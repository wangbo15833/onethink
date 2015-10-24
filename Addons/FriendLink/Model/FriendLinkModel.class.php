<?php

namespace Addons\FriendLink\Model;
use Think\Model;

/**
 * FriendLink模型
 */
class FriendLinkModel extends Model{

	/**
	 * 新增或更新一个文档
	 * @return boolean fasle 失败 ， int  成功 返回完整的数据
	 * @author huajie <banhuajie@163.com>
	 */
	public function update() {
		/* 获取数据对象 */
		$data = $this -> create();
		if (empty($data)) {
			return false;
		}
		/* 添加或新增基础内容 */
		if (empty($data['id'])) {//新增数据
			$id = $this -> add();
			//添加基础内容
			if (!$id) {
				$this -> error = '新增友情链接出错！';
				return false;
			}
		} else {//更新数据
			$status = $this -> save();
			//更新基础内容
			if (false === $status) {
				$this -> error = '更新友情链接出错！';
				return false;
			}
		}
		//内容添加或更新完成
		return $data;
	}

}
