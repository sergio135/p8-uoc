<?php
///////////////////////////////////////////
// Configuracion de la ruta REST registro //
///////////////////////////////////////////
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

// Register
$app->post('/api/test', function(Request $req, Response $res, array $args) {

    // los datos que vienen del formulario
    $dataForm = json_decode($req->getBody(), true);
    
    $data = [];
    return $res->withJson($data, 200);  
});

?>