<?php
class usersController{
    public static function listUsers(){
        $data = usersModel::listUsersmdl();
        return $data;
    }
    public static function updateUsers($data){

        $request = usersModel::UpdateUsermdl($data);
        return $request;
    }
}

?>