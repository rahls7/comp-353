<link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/css/jquery.dataTables_themeroller.css">
<link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/css/jquery.dataTables.css">
<?php 
    //$this->pageTitle=Yii::app()->name; 
    $client_id = $user_data->client_id;
    
    $portfolio = 0;
    
    $accessable_portfolios2 = $user_data->accessable_portfolios;  
    $accessable_portfolios = implode("', '", explode(",", $accessable_portfolios2));
    
    if(isset($user_data->default_portfolio_id) && $user_data->default_portfolio_id>0){ $portfolio = $user_data->default_portfolio_id;}else{$portfolio = $accessable_portfolios[0];}
            
   	$end_date = Date('Y-m-d');
	$start_date = date('Y-m-d', strtotime('-1 years'));
    if(isset($user_data->default_start_date) && $user_data->default_start_date!=='0000-00-00'){$start_date = $user_data->default_start_date;}
    if(isset($user_data->default_end_date) && $user_data->default_end_date!=='0000-00-00'){$end_date = $user_data->default_end_date;}
?>

<h3> <i><?php //echo CHtml::encode(Yii::app()->name); ?></i></h3>

<!-- Content Header (Page header) -->        
<form class="form-horizontal" id="form_id">
    <div class="row form-group">
    
        <div class="col-sm-2 control-label" style="margin-left: -70px;">Start Date:</div>
        <div class="col-sm-2">
        <?php
        $this->widget('zii.widgets.jui.CJuiDatePicker',[
                'name'=>'start_date',
                'id'=>'start_date',
                'value' => $start_date,
                //'language'=>'nl',
                //'attribute'=>'SaleDate',
                //'model'=>$model,
                'options'=>['showAnim'=>'fold', 'dateFormat'=>'yy-mm-dd'],
                'htmlOptions'=>['placeholder'=>'YYYY-MM-DD', 'class'=>"form-control", 'onChange'=>'overviewload()'],
            ]);
        
        ?>
        </div>
         
        <div class="col-sm-2 control-label" style="margin-left: -70px;">End Date:</div>
        <div class="col-sm-2">
        <?php
        $this->widget('zii.widgets.jui.CJuiDatePicker',[
                'name'=>'end_date',
                'id'=>'end_date',
                'value' =>$end_date,
                //'language'=>'nl',
                //'attribute'=>'SaleDate',
                //'model'=>$model,
                'options'=>['showAnim'=>'fold', 'dateFormat'=>'yy-mm-dd'],
                'htmlOptions'=>['placeholder'=>'YYYY-MM-DD', 'class'=>"form-control", 'onChange'=>'overviewload()'],
            ]);
        
        ?>
        </div>
        
        <div class="col-sm-2 control-label" style="margin-left: -70px;">Portfolio:</div>
        <div class="col-sm-2">
            <?php       
            //$ports = Portfolios::model()->findAll(['condition' => 'client_id = :client_id', 'params' => array(':client_id' => $client_id)]);
            
            $ports_sql = "select id, portfolio from portfolios where id in ('$accessable_portfolios') and client_id = '$client_id'";
            $ports = Yii::app()->db->createCommand($ports_sql)->queryAll(true);
            $list = CHtml::listData($ports,'id','portfolio');
            echo CHtml::dropDownList('portfolio', $portfolio,  $list, [ 'id' => 'portfolio', 'empty' => '-- Select --',  'onchange'=>'overviewload()', 'class'=>"form-control"  /*'multiple' => true, 'size'=>'10'*/]);
            ?>
        </div>
        <div class="col-sm-1">
        <button type="button" class="btn step-nav-button green-gradient-bk" onclick="download()">
              DOWNLOAD
            </button>
        </div>

</div>
<div id="wait" style="display:none;width:69px;height:89px;position:absolute;left:50%;padding:2px; z-index: 100000;">
    <img src='<?php echo Yii::app()->theme->baseUrl;?>/img/demo_wait.gif' width="64" height="64" /><br/>Loading..
</div>

</form>



<script>

    function download(){
        // Validamos el formulario actual
       // if (globalApp.tool.pages[globalApp.tool.currentPage].onCheckPage && globalApp.tool.pages[globalApp.tool.currentPage].onCheckPage() == false)
       //     return;
       // if (globalApp.tool.pages[globalApp.tool.currentPage].onDownload)
      //     globalApp.tool.pages[globalApp.tool.currentPage].onDownload();
        // Ahora montamos la chicha
      //  var JSONData = JSON.stringify(tool.data);
     //   var compressed = encodeURIComponent(LZString.compressToBase64(JSONData));
        // alert("SIZE: " + compressed.length + "\nDATA: " + compressed + "\n\n\n");

      //  var pages = globalApp.tool.currentPage;
       // if (globalApp.tool.pages[globalApp.tool.currentPage].downloadPages) {
       //     pages = downloadPages;
     //   }
     //   var urlParams = "tool=" + globalApp.tool.id + "&pages=" + pages + "&data=" + compressed;
        //alert('URL PARAMS:\n' + urlParams);

        /*
        var uncompressed = LZString.decompressFromBase64(decodeURIComponent(compressed));
        alert("SIZE: " + uncompressed.length + "\nDATA: " + uncompressed + "\n\n\n");
        */
        /* MODO POPUP PRINT
        var printPopup = window.open(location.href + "?" + urlParams);
        if (printPopup == null) {
            bootBox.alert('You must allow this site open popup windows in order to print the results.');
        }
        */
        /**/
        // MODO DOWNLOAD
      //  var downloadUrl = <?php //echo Yii::app()->baseUrl."/site/admin"; ?>  // + urlParams;
        location.href = '<?php echo Yii::app()->baseUrl."/site/pdf?start_date=2017-01-01&end_date=2018-02-01&portfolio=48&client_id=9"; ?>'; // downloadUrl;
        /**/
    }
</script>

<div id="overview-view"></div>
<script>
/*
$(document).ajaxStart(function(){
            $("#wait").css("display", "block");
        });
        $(document).ajaxComplete(function(){
            $("#wait").css("display", "none");
        });
*/
$(document).ready(function ($) {
        

// $("#form_id").submit(function(){
//  return false;
//});

    overviewload();
});

    function overviewload(){
    	$.ajax({
    			type: 'post',
    			url: '<?php echo Yii::app()->baseUrl.'/site/overviewload'; ?>',
    			data: {
    			     portfolio:$('#portfolio').val(),
                     start_date:$('#start_date').val(),
                     end_date:$('#end_date').val(),
                     client_id: '<?php echo $client_id;?>',
    			},
                beforeSend: function() {
                       $("#wait").css("display", "block");               
                      },

    			success: function (response) {
    			     $("#wait").css("display", "none");
    			     $( '#overview-view' ).html(response);
    			}
    		   });
    }
</script>