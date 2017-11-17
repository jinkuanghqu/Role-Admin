<?php

namespace Common\Model;

use Think\Model\RelationModel;;

class StatusModel extends RelationModel
{
    public static function bool()
    {
        return array(
            '1' => '启用',
            '0' => '禁用',
         );
    }
    //RBAC 等级node.level
    public static function nodeLevel()
    {
        return array(
            '1' => '模块',
            '2' => '操作',
        );
    }

}
