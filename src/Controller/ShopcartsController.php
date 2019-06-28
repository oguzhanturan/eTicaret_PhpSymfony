<?php

namespace App\Controller;

use App\Entity\Shopcarts;
use App\Form\ShopcartsType;
use App\Repository\Admin\ProductRepository;
use App\Repository\ShopcartsRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/shopcarts")
 */
class ShopcartsController extends AbstractController
{
    /**
     * @Route("/", name="shopcarts_index", methods={"GET"})
     */
    public function index(ShopcartsRepository $shopcartsRepository): Response
    {
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY'); // LOGİN KONTROLU
        $user = $this->getUser();;
        $userid = $user->getid();
        $em = $this->getDoctrine()->getManager();
        $sql ='Select p.title, p.sprice, s.*,p.image
        From shopcarts s, product p 
        Where s.productid = p.id
         AND userid =:userid';
        $statement = $em->getConnection()->prepare($sql);
        $statement->bindValue('userid',$user->getid());
        $statement->execute();
        $shopcarts = $statement->fetchAll();
        $total= $shopcartsRepository->getUserShopCartTotal($userid);

        return $this->render('shopcarts/index.html.twig', [
            'total' => $total,
            'shopcarts' => $shopcarts,
        ]);
    }

    /**
     * @Route("/new", name="shopcarts_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $shopcart = new Shopcarts();
        $form = $this->createForm(ShopcartsType::class, $shopcart);
        $form->handleRequest($request);
        $submittedToken = $request->get("token");
        if($this->isCsrfTokenValid('add_item',$submittedToken)){

            if ($form->isSubmitted()) {


                $entityManager = $this->getDoctrine()->getManager();
                $user = $this->getUser();
                $shopcart ->setQuantity($request->request->get('quantity'));
                $shopcart->setUserid($user->getid());
                $entityManager->persist($shopcart);
                $entityManager->flush();

                return $this->redirectToRoute('shopcarts_index');
            }

        }

    }

    /**
     * @Route("/{id}", name="shopcarts_show", methods={"GET"})
     */
    public function show(Shopcarts $shopcart ): Response
    {

        return $this->render('shopcarts/show.html.twig', [
            'shopcart' => $shopcart,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="shopcarts_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Shopcarts $shopcart): Response
    {
        $form = $this->createForm(ShopcartsType::class, $shopcart);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('shopcarts_index', [
                'id' => $shopcart->getId(),
            ]);
        }

        return $this->render('shopcarts/edit.html.twig', [
            'shopcart' => $shopcart,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}/del", name="shopcarts_delete",methods={"GET","POST"})
     */
    public function delete(Request $request, Shopcarts $shopcart): Response
    {

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($shopcart);
            $entityManager->flush();
            $this->addFlash('success',"Ürün sepetinizden silindi");
        return $this->redirectToRoute('shopcarts_index');
    }
}
