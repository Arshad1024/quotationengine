<?php
/**
 * Created by PhpStorm.
 * User: Arshad
 * Date: 02-Feb-18
 * Time: 8:58 AM
 */

require_once __DIR__.'/vendor/autoload.php';


use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

$app = new Silex\Application();
$app['debug'] = debug_mode;


$app['userModel'] = function($app){
    return new QuotationEngine\UserModel($app);
};

$app['errorHandler'] = function($app){
    return new QuotationEngine\ErrorHandler($app);
};


# Checks for IP address, if defined in config.php, it will return 403
$app->before(function(Request $request){

    if(IPS !== "")
    {
        $requestMatch = new \Symfony\Component\HttpFoundation\RequestMatcher('/',null,null,explode(',',IPS));
        if(!$requestMatch->matches($request))
        {
            return new Response('<h1>Forbidden</h1><p>You do not have permissions to access this resource</p>',403);
        }
    }
});


$app->register(new Silex\Provider\DoctrineServiceProvider());
$app->register(new Dflydev\Provider\DoctrineOrm\DoctrineOrmServiceProvider);
$app->register(new Silex\Provider\ValidatorServiceProvider());

$app['db.options'] = array(
    'driver'   => 'pdo_mysql',
    'charset'  => 'utf8',
    'host'     => DB_host,
    'dbname'   => DB_name,
    'user'     => DB_username,
    'password' => DB_password,
);

$app->get('/',function(){

    return "Valid Request : /user/{age}/{gender : m|f}/{page}";
});

$app->mount('/user',new \QuotationEngine\UserController());

$app->after(function (Request $request, Response $response) {
    $response->headers->set('Access-Control-Allow-Origin', '*');
    $response->headers->set('Access-Control-Allow-Methods','PUT,GET,POST');
});


$app->run();



