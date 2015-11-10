<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 王波 <492948155@qq.com>
// +----------------------------------------------------------------------

namespace Admin\Model;
use Think\Model;

/**
 * 行为模型
 * @author 王波 <492948155@qq.com>
 */

class DemoModel extends Model {
	  protected $_validate = array(
	  array('title', 'require', '标题不能为空', self::EXISTS_VALIDATE, 'regex', self::MODEL_BOTH),
	  //array('phone', '/^13[0-9]{1}[0-9]{8}$|15[0189]{1}[0-9]{8}$|189[0-9]{8}$/', '请输入正确手机号', self::VALUE_VALIDATE, 'regex', self::MODEL_BOTH),
	  //array('deadline', 'require', '名称不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
	  );

	protected $_auto = array(
		array('create_time', NOW_TIME, self::MODEL_INSERT),
		array('status', '1', self::MODEL_BOTH),
		array('deadline', 'strtotime', self::MODEL_BOTH, 'function'),
	);


	public function insert(){
		$data=$this->create();
		if(!$data){
			//$this->error="创建对象错误";
			return false;
		}
		$this->uid=$_SESSION['onethink_admin']['user_auth']['uid'];
		$res=$this->add();
		if(!$res){
			$this->error="新增模型错误";
			return false;
		}
		return true;
	}

}