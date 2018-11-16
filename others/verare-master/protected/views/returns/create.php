<?php
/* @var $this ReturnsController */
/* @var $model Returns */

$this->breadcrumbs=array(
	'Returns'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Returns', 'url'=>array('index')),
	array('label'=>'Manage Returns', 'url'=>array('admin')),
);
?>

<h1>Create Returns</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>