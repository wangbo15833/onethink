<?php

namespace Addons\FriendLink;
use Common\Controller\Addon;

/**
 * 友情链接插件
 * @author Lynx
 */

    class FriendLinkAddon extends Addon{

        public $info = array(
            'name'=>'FriendLink',
            'title'=>'友情链接',
            'description'=>'友情链接',
            'status'=>1,
            'author'=>'Lynx',
            'version'=>'0.1'
        );

        public $admin_list = array(
            'model'=>'FriendLink',		//要查的表
            'fields'=>'*',			//要查的字段
            'map'=>'',			//查询条件, 如果需要可以再插件类的构造方法里动态重置这个属性
            'order'=>'id desc',		//排序,
            'listKey'=>array( 		//这里定义的是除了id序号外的表格里字段显示的表头名
                'title'=>'链接名称',
                'url'=>'链接地址'
	),
        );

        public $custom_adminlist = 'adminlist.html';

        public function install(){
            return true;
        }

        public function uninstall(){
            return true;
        }

        //实现的FriendLink钩子方法
        public function FriendLink($param){
            $db= M('FriendLink');
            $list=$db->select();
            $this->assign('list',$list);
            $this->display('widget');

        }

    }