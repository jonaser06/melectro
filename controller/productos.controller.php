<?php
    class products{

        public static function productsController(){
            
            $productos = Mproducts::productsModel();
            return $productos;
        }
    }
?>