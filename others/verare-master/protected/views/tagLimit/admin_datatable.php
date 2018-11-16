<style>
#example {
    overflow-x: scroll;
    max-width: 40%;
    display: block;
    white-space: nowrap;
}
</style>

<?php
$this->breadcrumbs=['Tag Limit'=>['admin'], 'Manage'];
//$access_buttons = '{view} {update} {delete}';
/*
$access_level = 5;
$access_buttons = '';
if(isset(Yii::app()->user->user_role)){
              $user_rols = UserRole::model()->findByPk(Yii::app()->user->user_role);
              if($user_rols){$access_level = $user_rols->ledger_access_level;}
}
switch ($access_level) {
    case 1:
    $this->menu=[
        	//array('label'=>'List Ledger', 'url'=>array('index')),
        	array('label'=>'Create Ledger', 'url'=>array('create')),
        ];
        break;
    case 2:
        $access_buttons = '{update}';
        break;
    case 3:
        $access_buttons = '{delete}';
        break;
    case 4:
        $access_buttons = '{view} {update} {delete}';
        $this->menu=[
        	//array('label'=>'List Ledger', 'url'=>array('index')),
        	array('label'=>'Create Ledger', 'url'=>array('create')),
        ];
        break;
} 

$this->menu=[
	//array('label'=>'List Ledger', 'url'=>array('index')),
	array('label'=>'Create Ledger', 'url'=>array('create')),
];
*/
?>
<h1>Manage Instruments</h1>

<?php $baseUrl = Yii::app()->theme->baseUrl; ?>
     
<script type="text/javascript" language="javascript" class="init">  
       
var editor; // use a global for the submit and return data rendering in the examples
$(document).ready(function() {
    editor = new $.fn.dataTable.Editor( {
        ajax: 'tagLimit/taglimit',
        table: "#example",
        fields: [ 
            {label: "Id:", name: "id"},           
            {label: "Client Id:", name: "tag_limit.client_id"},
            {label: "Portfolio Id:", name: "tag_limit.portfolio_id"},
            {label: "Tag:", name: "tag_limit.tag"},
            {label: "Limit Min:", name: "tag_limit.limit_min"},
            {label: "Limit Max:", name: "tag_limit.limit_max"},                  
        ]
    } );
    
    $('#example').DataTable( {
        //dom: "Bfrtip",
        displayLength: 10,
        filter: true,
        paginate: true,
        sort: true,
        info: false,
        
       // "scrollX": true,
        //"sScrollX": "100%",
        //"sScrollXInner": "110%",
        //"bScrollCollapse": true,
        
        dom: '<"clear">&lt;<"clear">Bfrtip<"clear">', 
        //colVis: { exclude: [ 1 ] },
        //dom: 'C&gt;"clear"&lt;lfrtip"clear"Bfrtip',
        ajax: "tagLimit/",
        columns: [
        /*
            { data: null, render: function ( data, type, row ) {
                // Combine the first and last names into a single table field
                return data.first_name+' '+data.last_name;
            } },
        */              
            { data: "id" },
            { data: "tag_limit.client_id" },
            { data: "tag_limit.portfolio_id" },
            { data: "tag_limit.tag" },
            { data: "tag_limit.limit_min" },
            { data: "tag_limit.limit_max" },                       
        ],
        select: true,
        buttons: [
            { extend: "create", editor: editor },
            { extend: "edit",   editor: editor },
            { extend: "remove", editor: editor },
            {
                extend: 'copyHtml5',
                exportOptions: {
                    columns: ':visible'
                }
            },
            {
                extend: 'excelHtml5',
                exportOptions: {
                    columns: ':visible'
                }
            },
            {
                extend: 'pdfHtml5',
                exportOptions: {
                    columns: ':visible'
                }
            },
            { extend: 'colvis', collectionLayout: 'fixed two-column',},
            
        ]
    } );
    
} );

/*
  function SortByName(a, b){
    var aName = a.label.toLowerCase();
    var bName = b.label.toLowerCase();
    return ((aName < bName) ? -1 : ((aName > bName) ? 1 : 0));
  }
  function instrumenttypeLoader() {
    var instruments = [{'value': '0', 'label': '-- Select Instrument Type --'}];
    var path1 = '<?php //echo Yii::app()->baseUrl.'/instrumentTypes/instrumenttypes'; ?>';
    $.ajax({
        url: path1,
        async: false,
        dataType: 'json',
        success: function (json) {
          var data = json.data;
            for(var a=0; a<data.length; a++) {
              obj = {
                "value" : data[a]['id'],
                "label" : data[a]['instrument_type']
              };
              instruments.push(obj);
            }
        }
    });
    return instruments.sort(SortByName);
  }
  
  function instrumentgroupLoader() {
    var instruments = [{'value': '0', 'label': '-- Select Instrument Group --'}];
    var path1 = '<?php //echo Yii::app()->baseUrl.'/instrumentGroups/instrumentgroups'; ?>';
    $.ajax({
        url: path1,
        async: false,
        dataType: 'json',
        success: function (json) {
          var data = json.data;
            for(var a=0; a<data.length; a++) {
              obj = {
                "value" : data[a]['id'],
                "label" : data[a]['group_name']
              };
              instruments.push(obj);
            }
        }
    });
    return instruments.sort(SortByName);
  }
  
  function iscurrentLoader(){
    var instruments = [{'value': '0', 'label': 'No'}];
    return instruments.sort(SortByName);
  }
  */
</script>
<!-- page script -->
<table id="example" class="table table-striped table-bordered dt-responsive nowrap" width="100%" cellspacing="0">
        <thead>
            <tr>
                <th>Id</th>
                <th>Client Id</th>
                <th>Portfolio Id</th>
                <th>Tag</th>
                <th>Limit Min</th>
                <th>Limit Max</th>
            </tr>
        </thead>
    </table>