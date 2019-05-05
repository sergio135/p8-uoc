<?php
///////////////////////////////////////////
// Configuracion general e inicializacion //
///////////////////////////////////////////

require './vendor/autoload.php';

$config['displayErrorDetails'] = true;
$config['addContentLengthHeader'] = false;

$config['db']['host']   = 'localhost';
$config['db']['user']   = 'suncoast';
$config['db']['pass']   = 'suncoast123';
$config['db']['dbname'] = 'suncoast_p8';

$app = new \Slim\App(['settings' => $config]);

// Se crea un container que servira para añadir mas 
// dependencias al proyecto y enlazarlas con el framework.
$container = $app->getContainer();

// Añadios nueva depenencias para renderizar plantillas .phtml
$container['view'] = new \Slim\Views\PhpRenderer('./src/views/');

$container['db'] = function ($c) {
    $db = $c['settings']['db'];
    $pdo = new PDO('mysql:host=' . $db['host'] . ';dbname=' . $db['dbname'].';charset=utf8', $db['user'], $db['pass']);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    return $pdo;
};

// $test = $container['db'];

// Importamos el resto de codigo de nuestra aplicacion 
// categorizado por funcionalidad.
require __DIR__ . '/src/controllers/index.php';
require __DIR__ . '/src/api/index.php';
require __DIR__ . '/src/models/index.php';

session_start();
// Se lanza toda la aplicacion.
$app->run();
?>