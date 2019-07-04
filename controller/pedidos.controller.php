<?php
    class pedidosController{

        public static function ListarPedidosctrl(){

            $data = pedidosModel::ListarPedidosmdl();

            return $data;

        }

        public static function PedidosIdctrl($id){

            $data = pedidosModel::PedidoIdmdl($id);

            return $data;

        }

        public static function EstadoUpdatePedido($input){

            $data = pedidosModel::EstadoUpdatePedidomdl($input);

            return $data;

        }

    }

?>