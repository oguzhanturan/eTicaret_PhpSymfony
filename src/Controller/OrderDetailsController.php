<?php

namespace App\Controller;

use App\Entity\OrderDetails;
use App\Form\OrderDetailsType;
use App\Repository\OrderDetailsRepository;
use App\Repository\ShopcartsRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/orderdetails")
 */
class OrderDetailsController extends AbstractController
{
    /**
     * @Route("/", name="orderdetails_index", methods={"GET"})
     */
    public function index(OrderDetailsRepository $orderDetailsRepository): Response
    {
        return $this->render('order_details/index.html.twig', [
            'order_details' => $orderDetailsRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="orderdetails_new", methods={"GET","POST"})
     */
    public function new(Request $request,ShopcartsRepository $shopcartsRepository): Response
    {
        $orderDetail = new OrderDetails();
        $form = $this->createForm(OrderDetailsType::class, $orderDetail);
        $form->handleRequest($request);
        $user = $this->getUser();
        $userid = $user->getid();
        $total= $shopcartsRepository->getUserShopCartTotal($userid);
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($orderDetail);
            $entityManager->flush();

            return $this->redirectToRoute('orderdetails_index');
        }

        return $this->render('order_details/new.html.twig', [
            'order_detail' => $orderDetail,
            'form' => $form->createView(),
            'total' => $total,
        ]);
    }

    /**
     * @Route("/{id}", name="orderdetails_show", methods={"GET"})
     */
    public function show(OrderDetails $orderDetail): Response
    {
        return $this->render('order_details/show.html.twig', [
            'order_detail' => $orderDetail,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="orderdetails_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, OrderDetails $orderDetail): Response
    {
        $form = $this->createForm(OrderDetailsType::class, $orderDetail);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('orderdetails_index', [
                'id' => $orderDetail->getId(),
            ]);
        }

        return $this->render('order_details/edit.html.twig', [
            'order_detail' => $orderDetail,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="orderdetails_delete", methods={"DELETE"})
     */
    public function delete(Request $request, OrderDetails $orderDetail): Response
    {
        if ($this->isCsrfTokenValid('delete'.$orderDetail->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($orderDetail);
            $entityManager->flush();
        }

        return $this->redirectToRoute('orderdetails_index');
    }
}
