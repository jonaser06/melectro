<?php
    class products{

        public static function productsController($key){
            
            $productos = Mproducts::productsModel($key);
            return $productos;
        }
        public static function getProductByID($id){
            
            $productos = Mproducts::ProductByIDmdl($id);
            return $productos;
        }

        public static function addProduct($data){
            $add = Mproducts::addProductmdl($data);
            return $add;
        }

        public static function updateProductctrl($data){
            
            $add = Mproducts::updateProductmdl($data);
            return $add;
        }

        public static function busquedaproducto($data){
            
            $add = Mproducts::busquedaproductmdl($data);
            return $add;
        }

        public static function pagination(){
            
            $add = Mproducts::paginationmdl();
            return $add;
        }

        public static function deleteProduct($id){
            $request = Mproducts::deleteProductmdl($id);
            return $request;
        }
    }
?>