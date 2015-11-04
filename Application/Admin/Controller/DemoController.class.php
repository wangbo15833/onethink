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
class DemoController extends AdminController {
	public function index(){
		$db=M('Demo');
		$list=$db->where('uid='.$_SESSION['onethink_admin']['user_auth']['uid'])->select();
		$this->assign('list',$list);
		// 记录当前列表页的cookie
            		Cookie('__forward__',$_SERVER['REQUEST_URI']);
		$this->display();
	}


	public function add(){
		$this->display();
	}

	public function insert(){
		$db=M('Demo');
		$db->create();
		$db->create_time=time();
		$db->status=1;
		$db->uid=$_SESSION['onethink_admin']['user_auth']['uid'];
		$db->company_id=$_SESSION['onethink_admin']['company_id'];
		$res=$db->add();
		if(!$res){
		            $this->error(D('Demo')->getError());
		        }else{
		            $this->success($res['id']?'更新成功':'新增成功', Cookie('__forward__'));
		}
	}

	public function update(){
		$db=M('Demo');
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
		$db=M('Demo');
		$res=$db->where('id='.$id)->delete();
		if(!$res)
		{
			$this->error('删除失败',Cookie('__forward__'));
		}else{
			$this->success('删除成功', Cookie('__forward__'));
		}
	}

}