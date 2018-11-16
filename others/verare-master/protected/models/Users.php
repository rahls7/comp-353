<?php

/**
 * This is the model class for table "users".
 *
 * The followings are the available columns in table 'users':
 * @property integer $id
 * @property string $username
 * @property string $password
 * @property string $email
 * @property string $activkey
 * @property string $create_at
 * @property string $lastvisit_at
 * @property integer $superuser
 * @property integer $status
 * @property integer $user_role
 * @property integer $default_portfolio_id
 * @property string $default_start_date
 * @property string $default_end_date
 * accessable_portfolios
 * step_completed
 * can_set_limits
 *
 * The followings are the available model relations:
 * @property Profiles $profiles
 */
class Users extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'users';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			//array('username, password, email, create_at, default_portfolio_id, default_start_date, default_end_date', 'required'),
			//array('superuser, status, user_role, default_portfolio_id', 'numerical', 'integerOnly'=>true),
            array('default_portfolio_id, client_id, step_completed, can_set_limits', 'numerical', 'integerOnly'=>true),
            array('default_start_date, default_end_date', 'length', 'max'=>10),
            array('accessable_portfolios', 'length', 'max'=>255),
            
            
			//array('username', 'length', 'max'=>20),
			//array('password, email, activkey', 'length', 'max'=>128),
			//array('lastvisit_at', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, username, step_completed, accessable_portfolios, password, email, activkey, create_at, lastvisit_at, superuser, can_set_limits, status, user_role, default_portfolio_id, default_start_date, default_end_date', 'safe', 'on'=>'search'),
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
			'profiles' => array(self::HAS_ONE, 'Profiles', 'user_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'username' => 'Username',
			'password' => 'Password',
			'email' => 'Email',
			'activkey' => 'Activkey',
			'create_at' => 'Create At',
			'lastvisit_at' => 'Lastvisit At',
			'superuser' => 'Superuser',
            'can_set_limits' => 'Can Set Limits',
			'status' => 'Status',
			'user_role' => 'User Role',
			'default_portfolio_id' => 'Default Portfolio',
			'default_start_date' => 'Default Start Date',
			'default_end_date' => 'Default End Date',
            'client_id' =>'client_id',
            'accessable_portfolios' =>'accessable_portfolios',
            'step_completed' => 'step_completed'
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
		$criteria->compare('username',$this->username,true);
		$criteria->compare('password',$this->password,true);
		$criteria->compare('email',$this->email,true);
		$criteria->compare('activkey',$this->activkey,true);
		$criteria->compare('create_at',$this->create_at,true);
		$criteria->compare('lastvisit_at',$this->lastvisit_at,true);
		$criteria->compare('superuser',$this->superuser);
        $criteria->compare('can_set_limits',$this->can_set_limits);
		$criteria->compare('status',$this->status);
		$criteria->compare('user_role',$this->user_role);
		$criteria->compare('default_portfolio_id',$this->default_portfolio_id);
		$criteria->compare('default_start_date',$this->default_start_date,true);
		$criteria->compare('default_end_date',$this->default_end_date,true);
        $criteria->compare('client_id',$this->client_id);
        $criteria->compare('accessable_portfolios',$this->accessable_portfolios);
        $criteria->compare('step_completed',$this->step_completed);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Users the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
