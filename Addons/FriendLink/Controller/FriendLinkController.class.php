<?php

namespace Addons\FriendLink\Controller;
use Home\Controller\AddonsController;

class FriendLinkController extends AddonsController{
	public function add(){
		//dump(T('Addons://FriendLink@FriendLink/add'));exit;
		$this->display(T('Addons://FriendLink@FriendLink/add'));
	}

	public function insert(){
		$db=D('Addons://FriendLink/FriendLink');

		if($db->update()){
			$this->success('添加友情链接成功',Cookie('__forward__'));
		}else{
			$this->error($db -> getError());
		}
	}
}
