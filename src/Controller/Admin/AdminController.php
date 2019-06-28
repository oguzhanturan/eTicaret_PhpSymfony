<?php

namespace App\Controller\Admin;

use App\Entity\Admin\Product;
use App\Controller\OrdersController;
use App\Entity\Comments;
use App\Entity\Orders;
use App\Form\CommentsType;
use App\Form\OrdersType;
use App\Repository\Admin\CategoryRepository;
use App\Repository\Admin\ProductRepository;
use App\Repository\Admin\UserRepository;
use App\Repository\CommentsRepository;
use App\Repository\OrderDetailsRepository;
use App\Repository\OrdersRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


class AdminController extends AbstractController
{
    /**
     * @Route("/admin", name="admin")
     */
    public function index()
    {
        return $this->render('admin/index.html.twig', [
            'controller_name' => 'AdminController',
        ]);
    }

    /**
     * @Route("admin/orders/{slug}", name="admin_orders_index")
     */
    public function orders($slug, OrdersRepository $ordersRepository)
    {
        $orders = $ordersRepository->findBy(['status' => $slug]);

        return $this->render('admin/orders/index.html.twig', [
            'orders' => $orders,
        ]);
    }

    /**
     * @Route("admin/slider", name="slider", methods="GET")
     */
    public function slider(ProductRepository $productRepository,CategoryRepository $categoryRepository): Response
    {

        $catlistesi = $categoryRepository->findAll();

        return $this->render('admin/product/slider.html.twig', [
            'slider' => $productRepository->findBy(['status' => 'slider']),
            'catlistesi' => $catlistesi,
        ]);
    }

    /**
     * @Route("/orders/show/{id}", name="admin_orders_show", methods="GET")
     */
    public function show($id, Orders $order, OrderDetailsRepository $ordersDetailRepository)
    {
        $ordersDetail = $ordersDetailRepository->findBy(['orderid' => $id]);

        return $this->render('admin/orders/show.html.twig', [

            'ordersDetail' => $ordersDetail,
            'order' => $order,
        ]);
    }

    /**
     * @Route("/admin/orders/{id}/update", name="admin_orders_update", methods="POST")
     */
    public function order_update($id, Request $request, Orders $orders): Response
    {
        $em = $this->getDoctrine()->getManager();
        $sql = "UPDATE orders SET shipinfo=:shipinfo,note=:note,status=:status WHERE id=:id";

        $statement = $em->getConnection()->prepare($sql);

        $statement->bindValue('shipinfo', $request->request->get('shipinfo'));
        $statement->bindValue('note', $request->request->get('note'));
        $statement->bindValue('status', $request->request->get('status'));

        $statement->bindValue('id', $id);

        $statement->execute();
        $this->addFlash('success', 'Siparis Bilgileri Guncellendi.');

        return $this->redirectToRoute('admin_orders_show', ['id' => $id]);

    }

    /**
     * @Route("admin/comments", name="comments", methods="GET|POST")
     */
    public function comments(CommentsRepository $commentsRepository)
    {


        $mycomments = $commentsRepository->findAll(['id' => 'ASC']);

        return $this->render('admin/comment/comment.html.twig', [
            'mycomments' => $mycomments,
        ]);

    }
    /**
     * @Route("/{id}/edit", name="admin_comment_edit", methods="GET|POST")
     */
    public function comment(Request $request,Comments $comments): Response
    {
        $form = $this->createForm(CommentsType::class, $comments);
        $form->handleRequest($request);

        if ($form->isSubmitted()) {
            $this->getDoctrine()->getManager()->flush();
            $this->addFlash('success','Kayıt Günceleme Başarılı');
            return $this->redirectToRoute('comments');
        }

        return $this->render('admin/comment/commentshow.html.twig', [
            'comment' => $comments,
            'form' => $form->createView(),
        ]);
    }

}
