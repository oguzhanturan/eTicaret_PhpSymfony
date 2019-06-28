<?php

namespace App\Controller;

use App\Repository\Admin\SettingRepository;
use App\Repository\OrdersRepository;
use App\Repository\ShopcartsRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class SecurityController extends AbstractController
{
    /**
     * @Route("/login", name="app_login")
     */
    public function login(AuthenticationUtils $authenticationUtils,SettingRepository $settingRepository): Response
    {

        $data =$settingRepository->findAll();
        // get the login error if there is one
        $error = $authenticationUtils->getLastAuthenticationError();
        // last username entered by the user

        $lastUsername = $authenticationUtils->getLastUsername();
       // $email = $settingRepository->findBy(['email' =>$lastUsername]);


       // $em = $this->getDoctrine()->getManager();
       // $sql ='SELECT roles FROM product WHERE email="'.$email.'"';
       // $statement = $em->getConnection()->prepare($sql);
       // $statement->execute();
       // $roles[]= $statement->fetchAll();
        //
      // $user = $this->getUser();
      // $em = $this->getDoctrine()->getManager();
      // $sqlshop ='Select p.title, p.sprice, s.* From shopcarts
      //   s, product p Where s.productid = p.id AND userid =:userid';
      // $statementshop = $em->getConnection()->prepare($sqlshop);
      // $statementshop->bindValue('userid',$user->getid());
      // $statementshop->execute();
      // $shopcarts = $statementshop->fetchAll();
      // $user = $this->getUser();
      // $userid = $user->getid();
      // $total= $shopcartsRepository->getUserShopCartTotal($userid);

        return $this->render('security/login.html.twig', [
            //'orders' => $ordersRepository->findBy(['userid'=>$userid]),
            //'total'=>$total,
            //'shopcarts' => $shopcarts,
            //'roles' => $roles,
            'last_username' => $lastUsername,
            'error' => $error,
            'data' => $data,
        ]);
    }
}
