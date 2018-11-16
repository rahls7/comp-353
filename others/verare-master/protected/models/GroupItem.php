<?php

/**
 * This is the model class for table "group_item".
 *
 * The followings are the available columns in table 'group_item':
 * @property integer $id
 * @property integer $group_id
 * @property integer $item_id
 * @property string $item_table
 * @property double $item_weight
 * @property integer $is_current
 * @property string $created_at
 *
 * The followings are the available model relations:
 * @property Grouping $group
 */
class GroupItem extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return GroupItem the static model class
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
		return 'group_item';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('group_id, item_id, item_table, item_weight, created_at', 'required'),
			array('group_id, item_id, is_current', 'numerical', 'integerOnly'=>true),
			array('item_weight', 'numerical'),
			array('item_table', 'length', 'max'=>255),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, group_id, item_id, item_table, item_weight, is_current, created_at', 'safe', 'on'=>'search'),
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
			'group' => array(self::BELONGS_TO, 'Grouping', 'group_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'group_id' => 'Group',
			'item_id' => 'Item',
			'item_table' => 'Item Table',
			'item_weight' => 'Item Weight',
			'is_current' => 'Is Current',
			'created_at' => 'Created At',
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
		$criteria->compare('group_id',$this->group_id);
		$criteria->compare('item_id',$this->item_id);
		$criteria->compare('item_table',$this->item_table,true);
		$criteria->compare('item_weight',$this->item_weight);
		$criteria->compare('is_current',$this->is_current);
		$criteria->compare('created_at',$this->created_at,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}