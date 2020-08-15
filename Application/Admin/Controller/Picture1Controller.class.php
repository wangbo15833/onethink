<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Controller;

/**
 * 示例模型控制器
 * @author 王波 <492948155@qq.com>
 */
class Picture1Controller extends AdminController {
	public function index(){
		$db=M('Picture1');
		$list=$db->select();
		$this->assign('list',$list);
		// 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);
		$this->display();
	}


	public function add(){
		$this->display();
	}

	public function insert(){

		$Demo=D('Demo');
		$res=$Demo->insert();
		if(!$res){
		            $this->error($Demo->getError());
		        }else{
		            $this->success($res['id']?'更新成功':'新增成功', Cookie('__forward__'));
		}
	}

	public function update(){
		$db=D('Demo');
		$db->create();
		$res=$db->save();
		if(!$res)
		{
			$this->error('更新失败',Cookie('__forward__'));
		}else{
			$this->success('更新成功', Cookie('__forward__'));
		}
	}

	public function edit(){
		$id=I('id');
		$db=M('Demo');
		$result=$db->where('id='.$id)->find();
		$this->assign('result',$result);
		$this->display();		
	}

	public function del(){
		$id=I('id');
		$db=M('Picture1');
		$res=$db->where('id='.$id)->delete();
		if(!$res)
		{
			$this->error('删除失败',Cookie('__forward__'));
		}else{
			$this->success('删除成功', Cookie('__forward__'));
		}
	}

}