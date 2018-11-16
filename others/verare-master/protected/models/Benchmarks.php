<?php

/**
 * This is the model class for table "benchmarks".
 *
 * The followings are the available columns in table 'benchmarks':
 * @property integer $id
 * @property integer $client_id
 * @property integer $portfolio_id
 * @property string $benchmark_name
 *
 * The followings are the available model relations:
 * @property BenchmarkComponents[] $benchmarkComponents
 * @property Clients $client
 * @property Portfolios $portfolio
 */
class Benchmarks extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'benchmarks';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('client_id, portfolio_id, benchmark_name', 'required'),
			array('client_id, portfolio_id', 'numerical', 'integerOnly'=>true),
			array('benchmark_name', 'length', 'max'=>100),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, client_id, portfolio_id, benchmark_name', 'safe', 'on'=>'search'),
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
			'benchmarkComponents' => array(self::HAS_MANY, 'BenchmarkComponents', 'benchmark_id'),
			'client' => array(self::BELONGS_TO, 'Clients', 'client_id'),
			'portfolio' => array(self::BELONGS_TO, 'Portfolios', 'portfolio_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'client_id' => 'Client',
			'portfolio_id' => 'Portfolio',
			'benchmark_name' => 'Benchmark Name',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('client_id',$this->client_id);
		$criteria->compare('portfolio_id',$this->portfolio_id);
		$criteria->compare('benchmark_name',$this->benchmark_name,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Benchmarks the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
