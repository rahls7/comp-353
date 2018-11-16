<?php
/* @var $this PricesController */
/* @var $model Prices */

$this->breadcrumbs=array(
	'Prices'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Prices', 'url'=>array('index')),
	array('label'=>'Manage Prices', 'url'=>array('admin')),
);
?>

<h1>Create Price</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>