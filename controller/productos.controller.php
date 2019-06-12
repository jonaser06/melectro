<?php
    class products{

        public static function productsController(){
            
            $productos = Mproducts::productsModel();
            return $productos;
        }

        public static function addProduct($data){
            $add = Mproducts::addProductmdl($data);
            return $add;
        }
    }
?>