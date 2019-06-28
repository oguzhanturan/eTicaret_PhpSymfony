<?php

namespace App\Controller;

use App\Entity\Shopcarts;
use App\Entity\OrderDetails;
use App\Repository\OrderDetailsRepository;
use App\Repository\ShopcartsRepository;
use App\Entity\Orders;
use App\Form\OrdersType;
use App\Repository\OrdersRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/orders")
 */
class OrdersController extends AbstractController
{
    /**
     * @Route("/", name="orders_index", methods={"GET"})
     */
    public function index(OrdersRepository $ordersRepository, ShopcartsRepository $shopcartsRepository): Response
    {
        $user = $this->getUser();
        $userid = $user->getid();
        $total = $shopcartsRepository->getUserShopCartTotal($userid);
        return $this->render('orders/index.html.twig', [
            'orders' => $ordersRepository->findBy(['userid' => $userid]),
            'total' => $total,
        ]);
    }

    /**
     * @Route("/new", name="orders_new", methods={"GET","POST"})
     */
    public function new(Request $request, ShopcartsRepository $shopcartsRepository): Response
    {
        $orders = new Orders();
        $form = $this->createForm(OrdersType::class, $orders);
        $form->handleRequest($request);

        $user = $this->getUser();
        $userid = $user->getid();
        $total = $shopcartsRepository->getUserShopCartTotal($userid);

        $submittedToken = $request->request->get('token');
        //if($this->isCsrfTokenValid('form-order', $submittedToken)){
        if ($form->isSubmitted()) {

            $em = $this->getDoctrine()->getManager();

            $orders->setUserid($userid);
            $orders->setAmount($total);
            $orders->setStatus('New');


            $em->persist($orders);
            $em->flush();

            $orderid = $orders->getId();

            $shopcart = $shopcartsRepository->getUserShopCart($userid);


            foreach ($shopcart as $item) {
                $orderdetail = new OrderDetails();
                $orderdetail->setOrderid($orderid);
                $orderdetail->setUserid($user->getId());
                $orderdetail->setProductid($item["productid"]);
                $orderdetail->setPrice($item["price"]);
                $orderdetail->setQuantity($item["quantity"]);
                $orderdetail->setAmount($item["amount"]);
                $orderdetail->setName($item["title"]);
                $orderdetail->setStatus("Ordered");

                $em->persist($orderdetail);
                $em->flush();
            }


            $em = $this->getDoctrine()->getManager();
            $query = $em->createQuery('Delete From App\Entity\Shopcarts s Where s.userid=:userid')->setParameter('userid', $userid);

            $query->execute();

            $this->addFlash('success', 'Siparisiniz alinmistir');

            return $this->redirectToRoute('orders_index');
        }
        //}
        $em = $this->getDoctrine()->getManager();
        $sqlshop = 'Select p.title, p.sprice, s.* From shopcarts
        s, product p Where s.productid = p.id AND userid =:userid';
        $statementshop = $em->getConnection()->prepare($sqlshop);
        $statementshop->bindValue('userid', $user->getid());
        $statementshop->execute();
        $shopcarts = $statementshop->fetchAll();

        return $this->render('orders/new.html.twig', [
            'shopcarts' => $shopcarts,
            'order' => $orders,
            'total' => $total,
            'form' => $form->createView(),
        ]);
    }


    /**
     * @Route("/{id}", name="orders_show", methods={"GET"})
     */
    public function show(Orders $order, ShopcartsRepository $shopcartsRepository, OrderDetailsRepository $orderDetailsRepository): Response
    {
        $user = $this->getUser();
        $userid = $user->getid();
        $total = $shopcartsRepository->getUserShopCartTotal($userid);

        $orderid = $order->getId();
        $orderDetail = $orderDetailsRepository->findBy(['orderid' => $orderid]);

        return $this->render('orders/show.html.twig', [
            'orderdetail' => $orderDetail,
            'order' => $order,
            'total' => $total,
        ]);
    }



    /**
     * @Route("/{id}/edit", name="orders_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Orders $order): Response
    {
        $form = $this->createForm(OrdersType::class, $order);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('orders_index', [
                'id' => $order->getId(),
            ]);
        }

        return $this->render('orders/edit.html.twig', [
            'order' => $order,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="orders_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Orders $order): Response
    {
        if ($this->isCsrfTokenValid('delete' . $order->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($order);
            $entityManager->flush();
        }

        return $this->redirectToRoute('orders_index');
    }
}
