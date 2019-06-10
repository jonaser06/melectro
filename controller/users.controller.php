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

    public static function deleteUsers($id){
        $request = usersModel::deleteUsermdl($id);
        return $request;
    }

    public static function newUser($data){
        $request = usersModel::newUsermdl($data);
        return $request;
    }
}

?>