<?php
/* @var $this UserRoleController */
/* @var $model UserRole */

$this->breadcrumbs=array(
	'User Roles'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List UserRole', 'url'=>array('index')),
	array('label'=>'Create UserRole', 'url'=>array('create')),
	array('label'=>'View UserRole', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage UserRole', 'url'=>array('admin')),
);
?>

<h1>Update UserRole <?php echo $model->user_role; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>