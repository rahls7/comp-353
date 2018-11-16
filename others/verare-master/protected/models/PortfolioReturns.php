<?php
class PortfolioReturns extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return PortfolioReturns the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'portfolio_returns';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('portfolio_id, is_prtfolio_or_group, trade_date, return', 'required'),
			array('portfolio_id, is_prtfolio_or_group', 'numerical', 'integerOnly'=>true),
			array('return, benchmark_return', 'numerical'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, portfolio_id, is_prtfolio_or_group, trade_date, return, benchmark_return', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'portfolio_id' => 'Portfolio',
			'is_prtfolio_or_group' => 'Is Prtfolio Or Group',
			'trade_date' => 'Trade Date',
			'return' => 'Return',
            'benchmark_return' =>'Benchmark Return',
            
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('portfolio_id',$this->portfolio_id);
		$criteria->compare('is_prtfolio_or_group',$this->is_prtfolio_or_group);
		$criteria->compare('trade_date',$this->trade_date,true);
		$criteria->compare('return',$this->return);
        $criteria->compare('benchmark_return',$this->benchmark_return);
        

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
    
    
/////////////////////////


    /**
    *This function is using for portfolio returns calculation
    */

    public function PortfolioReturnsUpdate($portfolio_id, $client_id, $portfolio_currency)
	{  
	  // $portfolio_id = 33;
        if($portfolio_id >0){
        ini_set('max_execution_time', 50000);
        //$table_name = "client_".$client_id. "_inst_returns";
        
        $p_ids[] = $portfolio_id;
        
        $all_portfolios = Yii::app()->db->createCommand("select * from portfolios where parrent_portfolio = $portfolio_id")->queryAll(true);
        
        while(count($all_portfolios)>0){
            $new_ids = [];
            foreach($all_portfolios as $ap){
                $p_ids[] = $ap['id'];
                $new_ids[] = $ap['id'];
            }
            $new_p_ids = implode("','", array_unique($new_ids));
            $all_portfolios = Yii::app()->db->createCommand("select * from portfolios where parrent_portfolio in ('$new_p_ids')")->queryAll(true);
        }
        
        $all_p_ids = implode("','", array_unique($p_ids));
        
        Yii::app()->db->createCommand("delete from portfolio_returns where portfolio_id = '$portfolio_id'")->execute();

        //Trades // and (p.id = $portfolio_id or p.parrent_portfolio = $portfolio_id )
        $inst_sql = "select * from ledger l
                     inner join instruments i on l.instrument_id = i.id
                     inner join portfolios p on p.id = l.portfolio_id
                     where l.is_current = 1 and i.is_current = 1 and l.trade_status_id = 2 and l.client_id = '$client_id' 
                     and p.id in ('$all_p_ids')
                     order by trade_date asc";
        $trades = Yii::app()->db->createCommand($inst_sql)->queryAll(true);
        
        if(count($trades)>0){
        
        foreach($trades as $trd){$ins_ids[] = $trd['instrument_id'];} 
        
        $insids = implode("','", array_unique($ins_ids));                         


//This is the portfolio returns query without currency rates//
/*
$portfolio_return_sql = "select distinct
            p.trade_date, if(c.trd is not NULL, c.trd, 0) pnl, 
            if(m.port_val is not NULL, m.port_val, 0) top, 
            if(bc.weight is not NULL, sum(bc.ww)/sum(bc.weight), 0) sums, 
            if(c.coupon is not NULL, c.coupon, 0) coupon 
            from prices p 
            
            left join 
            (select l.trade_date, 
            	sum(if(l.trade_type Not in ('2'), l.nominal*l.price, 0)) trd, 
            	sum(if(l.trade_type in ('2'), l.nominal*l.price, 0)) coupon 
            	from ledger l 
            	where l.is_current = 1 and l.trade_status_id = 2 and l.instrument_id in ('$insids') and l.client_id = '$client_id' and l.portfolio_id in ('$all_p_ids') 
            	group by l.trade_date ) c on c.trade_date = p.trade_date 
            	
            left join 
            ( select p1.trade_date, 
            	sum(p1.price * nominal) port_val 
            	from ledger l
                inner join prices p1 on p1.instrument_id = l.instrument_id and l.trade_date<=p1.trade_date 
                where l.is_current = 1 and trade_status_id = 2 
                and l.instrument_id in ('$insids') and l.client_id = '$client_id' and l.portfolio_id in ('$all_p_ids')  and trade_type Not in ('2') 
            	group by p1.trade_date) m on m.trade_date = p.trade_date 
                      	
            left join 
            ( select bc.instrument_id, p.trade_date, 
            	p.price* bc.weight ww, bc.weight 
            	from benchmark_components bc 
            	inner join benchmarks bench on bench.id = bc.benchmark_id 
            	inner join portfolios port on port.benchmark_id = bench.id 
            	inner join prices p on p.instrument_id = bc.instrument_id 
            	where port.id ='$portfolio_id' ) bc on bc.trade_date = p.trade_date 
            	
            where p.instrument_id in ('$insids') and p.trade_date <> '0000-00-00'
            group by p.trade_date order by p.trade_date asc";
 */           
            
$portfolio_return_sql = "select dt.trade_date, dt.prev_date, dt.cur_date, 
                        if(c.trd is not NULL, c.trd, 0) curr_pnl, 
                        if(m.port_val is not NULL, m.port_val, 0) cur_top, 
                        if(c.coupon is not NULL, c.coupon, 0) cur_coupon,
                        if(d.trd is not NULL, d.trd, 0) prev_pnl, 
                        if(e.port_val is not NULL, e.port_val, 0) prev_top, 
                        if(d.coupon is not NULL, d.coupon, 0) prev_coupon,
                        if(if(e.port_val is not NULL, e.port_val, 0)+if(c.trd is not NULL, c.trd, 0)<>0,
                        (if(m.port_val is not NULL, m.port_val, 0)+if(c.coupon is not NULL, c.coupon, 0))/
                        (if(e.port_val is not NULL, e.port_val, 0)+ if(c.trd is not NULL, c.trd, 0))    , 1) ret,
                        if(bc.bench_sum is not NULL, bc.bench_sum/bc_prev.bench_sum, 1) benchmark_ret
                        from 
                        (select dt11.trade_date, (@dt2 := @dt1) as prev_date, (@dt1 := dt11.trade_date) as cur_date 
                        from (select distinct trade_date from prices where trade_date<>'0000-00-00' and instrument_id in ('$insids') order by trade_date) dt11) dt
                        left join 
                        (select trade_date, 
                        	sum(if(trade_type Not in ('2'), nominal*price, 0)) trd, 
                        	sum(if(trade_type in ('2'), nominal*price, 0)) coupon 
                        	from ledger l
                        	where is_current = 1 and trade_status_id = 2 and instrument_id in ('$insids') and client_id = @client_id and portfolio_id in ('$all_p_ids') 
                        	group by trade_date) c on c.trade_date = dt.trade_date             	
                        left join 
                        ( select p1.trade_date, sum(p1.price * nominal) port_val from ledger l
                            inner join prices p1 on p1.instrument_id = l.instrument_id and l.trade_date<=p1.trade_date 
                            where l.is_current = 1 and trade_status_id = 2 and l.instrument_id in ('$insids') and l.client_id = @client_id and l.portfolio_id in ('$all_p_ids')  and trade_type Not in ('2') 
                        	group by p1.trade_date) m on m.trade_date = dt.trade_date 
                        left join 
                        (select trade_date, 
                        	sum(if(trade_type Not in ('2'), nominal*price, 0)) trd, 
                        	sum(if(trade_type in ('2'), nominal*price, 0)) coupon 
                        	from ledger l
                        	where is_current = 1 and trade_status_id = 2 and instrument_id in ('$insids') and client_id = @client_id and portfolio_id in ('$all_p_ids') 
                        	group by trade_date ) d on d.trade_date = dt.prev_date           	
                        left join 
                        ( select p1.trade_date, 
                        	sum(p1.price * nominal) port_val 
                        	from ledger l
                            inner join prices p1 on p1.instrument_id = l.instrument_id and l.trade_date<=p1.trade_date 
                            where l.is_current = 1 and trade_status_id = 2 and trade_type Not in ('2') and l.client_id = @client_id and l.instrument_id in ('$insids') and l.portfolio_id in ('$all_p_ids')   
                        	group by p1.trade_date) e on e.trade_date = dt.prev_date 
                        left join 
                           ( select p.trade_date, if(sum(bc.weight) is not NULL, sum(p.price* bc.weight)/sum(bc.weight), 1) bench_sum
                           	from benchmark_components bc 
                           	inner join benchmarks bench on bench.id = bc.benchmark_id 
                           	inner join portfolios port on port.benchmark_id = bench.id 
                           	inner join prices p on p.instrument_id = bc.instrument_id 
                           	where port.id =@portfolio_id group by p.trade_date) bc on bc.trade_date = dt.trade_date   	
                        left join 
                           ( select p.trade_date, if(sum(bc.weight) is not NULL, sum(p.price* bc.weight)/sum(bc.weight), 1) bench_sum
                           	from benchmark_components bc 
                           	inner join benchmarks bench on bench.id = bc.benchmark_id 
                           	inner join portfolios port on port.benchmark_id = bench.id 
                           	inner join prices p on p.instrument_id = bc.instrument_id 
                           	where port.id =@portfolio_id group by p.trade_date) bc_prev on bc_prev.trade_date = dt.prev_date    	
                        order by dt.trade_date";
        

          //echo $portfolio_return_sql;
          //exit;                                     
        Yii::app()->db->createCommand("SET SQL_BIG_SELECTS = 1;set @dt1 = '-';
                        set @dt2 = '-';
                        set @client_id = '$client_id';
                        set @portfolio_id = '$portfolio_id';")->execute();
        $portfolio_returns = Yii::app()->db->createCommand($portfolio_return_sql)->queryAll(true);
      
        if(count($portfolio_returns)>0){
            
            Yii::app()->db->createCommand("delete from portfolio_returns where portfolio_id = '$portfolio_id'")->execute();
        //$i = 0;
        
        //for benchmarks//
      //  $return1[$i] = 1;
        //$return_bench = 1;
        //$return_bench_daily[] = 1;
        ////////////////////////
        
        foreach($portfolio_returns as $price){
            
            /*
            $rawData[$i]['id'] = $i;    
            $rawData[$i]['trade_date'] = $price['trade_date'];
            $rawData[$i]['top'] = $price['top'];
            $rawData[$i]['pnl'] = $price['pnl'];
            $rawData[$i]['coupon'] = $price['coupon'];
              
            $rawData[$i]['return'] = 1;  
            
            ////For Benchmark///////
            $sums[$i] = $price['sums'];
            $rawData[$i]['benchmark_return'] = 1;
            ////////////////////////
            $return1[$i] = 1;
                        
            if($i>0){ 
                    ////For Benchmark///////
                    if($sums[$i-1]> 0){$return1[$i] = $price['sums']/$sums[$i-1];}
                    //$return_bench = $return_bench * $return1[$i];
                    $rawData[$i]['benchmark_return'] = $return1[$i];
                    ////////////////////////
                    
                    //Portfolio return//
                    //$div = $rawData[$i-1]['top'] + $rawData[$i]['pnl'] - $rawData[$i]['coupon'];
                    //if($div>0 && !($rawData[$i]['top']==0)){$rawData[$i]['return'] = ($rawData[$i]['top'])/$div;}
                    
                    $div = $rawData[$i-1]['top'] + $rawData[$i]['pnl'];
                    if($div>0 && !($rawData[$i]['top']==0)){$rawData[$i]['return'] = ($rawData[$i]['top'] + $rawData[$i]['coupon'])/$div;}
                    
                  //if($rawData[$i]['trade_date']=='2012-04-30'){
                  //         var_dump( $rawData[$i]['return']);
        //exit;
       // }
               }
               
        
                       $return = new PortfolioReturns;
                       $return->portfolio_id = $portfolio_id;
                       $return->is_prtfolio_or_group = 1;
                       $return->trade_date = $rawData[$i]['trade_date'];
                       $return->return = $rawData[$i]['return'];
                       $return->benchmark_return = $rawData[$i]['benchmark_return'];
                       $return->save(); 
               $i++; */
               
               
               $return = new PortfolioReturns;
               $return->portfolio_id = $portfolio_id;
               $return->is_prtfolio_or_group = 1;
               $return->trade_date = $price['trade_date'];
               if($price['ret']==0){$return->return = 1;}else{$return->return = $price['ret'];}
               $return->benchmark_return = $price['benchmark_ret'];
               $return->save(); 
               
               
               }     
          }else{
                ///portfolio return is empty////
                //Yii::app()->user->setFlash('notice', "There are not confirmed trades available aor prices not found.");
                //Yii::app()->user->setFlash('success', "Data1 saved!");
                //Yii::app()->user->setFlash('error', "Data2 failed!"); 
               // foreach(Yii::app()->user->getFlashes() as $key => $message) {
                //    echo '<div class="alert alert-' . $key . '">' . $message . "</div>\n";
                //}
                //exit;       
              }  
        }else{
                ///treades are not found//
                Yii::app()->user->setFlash('notice', "Ledgar information not found.");
            }
        }    
        Yii::app()->user->setFlash('success', "Portfolio returns updated.");
        //$this->redirect('admin');       
    }
    
    
    
}