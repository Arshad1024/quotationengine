<?php
/**
 * Created by PhpStorm.
 * User: Arshad
 * Date: 02-Feb-18
 * Time: 10:27 AM
 */

namespace QuotationEngine;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints as Validate;
use Symfony\Component\HttpFoundation\Response;
use Silex\Application;
use Silex\Api\ControllerProviderInterface;






class UserController implements ControllerProviderInterface
{



    public function connect(Application $appInstance)
    {

        $collection = $appInstance['controllers_factory'];
        $collection->get('/{age}/{gender}/{start}','\QuotationEngine\UserController::getQuote')->assert('age','\d+')->assert('gender','[a-z]{1}')->assert('start','\d+');
        return $collection;
    }

    public function getQuote(Application $app, $age, $gender, $start)
    {
        if($gender == "m")
            $gender = 1;
        else if($gender == "f")
            $gender = 2;

        $result = $app['userModel']->getQuote($age,$gender,$start);

        return $app->json($result);

    }

}