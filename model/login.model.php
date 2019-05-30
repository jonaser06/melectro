<?php
class loginpagemdl{
    public static function signinmdl($data){
        /** url base */
        $urlBase = routes::routebase();
        /** api url */
        $url = $urlBase.'/api/login';
        /**crear nuevo recurso cURL */
        $ch = curl_init($url);
        /**preparacion del json para el envio */
        $payload = $data;
        /**adjuntamos json al post */
        curl_setopt($ch, CURLOPT_POSTFIELDS, $payload);
        /**establecemos contenido del tipo json */
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));
        /**respuesta de retorno */
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        /**ejecutar la solicitud post */
        $result = curl_exec($ch);
        /**cerramos recurso cURL */
        curl_close($ch);
        return $result;
    }
}

?>