<?php
/**
 * Created by PhpStorm.
 * User: Arshad
 * Date: 02-Feb-18
 * Time: 9:07 AM
 */

namespace QuotationEngine;

use Silex\Application;
use Doctrine\DBAL\Exception\UniqueConstraintViolationException as exception;
use Symfony\Component\EventDispatcher\EventDispatcher;
use Symfony\Component\EventDispatcher\GenericEvent;



class UserModel
{
    private $app;

    public function __construct(Application $app)
    {
        $this->app = $app;
    }

    public function getQuote($age,$gender,$start=1)
    {
        $queryBuilder =$this->app['db']->createQueryBuilder();
        $queryBuilder->select('*')
            ->from('tbl_provider','A')
            ->innerJoin('A','tbl_plans','B','B.provider_id = A.id')
        ->innerJoin('B','tbl_attributes','C','C.plan_id=B.id')
            ->innerJoin('C','tbl_price','D','D.plan_id=C.id')
            ->innerJoin('D','tbl_price_rules','E','E.id = D.price_rule')
        ->where('E.age_start <= '.$age)
        ->andwhere('E.age_end >= '.$age)
        ->andwhere('D.gender = '.$gender)
            ->orderBy('D.price','ASC')
            ->setFirstResult($start)
            ->setMaxResults(50);
        $data = $this->app['db']->query($queryBuilder->getSQL());
        $result = array();
        while($row = $data->fetch())
        {
            $result[]=$row;
        }
        return $result;

    }
}