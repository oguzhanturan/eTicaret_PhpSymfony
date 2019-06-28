<?php

namespace App\Controller;


use App\Entity\Admin\User;
use App\Entity\Comments;
use App\Form\Admin\UserType;
use App\Form\CommentsType;
use App\Repository\CommentsRepository;
use App\Repository\OrdersRepository;
use App\Repository\ShopcartsRepository;
use App\ShopcartsController;
use App\ProductController;
use App\Entity\Admin\messages;
use App\Form\Admin\messagesType;
use App\Repository\Admin\CategoryRepository;
use App\Repository\Admin\messagesRepository;
use App\Repository\Admin\ProductRepository;
use App\Repository\Admin\SettingRepository;
use App\Repository\Admin\ImageRepository;
use Psr\Container\ContainerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{


    /**
     * @Route("/", name="home")
     */
    public function index(SettingRepository $settingRepository, ShopcartsRepository $shopcartsRepository)
    {
        $data = $settingRepository->findAll();
        //slider veri çekme
        $em = $this->getDoctrine()->getManager();
        $sql = 'SELECT * FROM product WHERE status="slider"';
        $statement = $em->getConnection()->prepare($sql);

        $sqlLatest = 'SELECT * FROM product WHERE status="true" ORDER by id DESC LIMIT 15';
        $statementLatest = $em->getConnection()->prepare($sqlLatest);
        //$statement->bindValue('catid',$catid);
        $statement->execute();
        $statementLatest->execute();

        $slider = $statement->fetchAll();
        $lastproduct = $statementLatest->fetchAll();

        $cats = $this->CategoryTreeList();
        $cats[0] = '<ul id="menu-v">';

        return $this->render('home/index.html.twig', [
            //'shopcarts' =>$shopcarts,
            'data' => $data,
            'cats' => $cats,
            'slider' => $slider,
            'lastproduct' => $lastproduct,
            //'total' => $total,
        ]);
    }

    /**
     * @Route("/aboutus", name="aboutus", methods="GET|POST" )
     */
    public function aboutus(SettingRepository $settingRepository, Request $request)
    {

        $message = new messages();
        $form = $this->createForm(messagesType::class, $message);
        $form->handleRequest($request);
        $submittedToken = $request->request->get('token');

        if ($form->isSubmitted()) {

            // 'delete-item' is the same value used in the template to generate the token
            if ($this->isCsrfTokenValid('form-message', $submittedToken)) {

                $em = $this->getDoctrine()->getManager();
                $em->persist($message);
                $em->flush();
                $this->addFlash('success', 'Mesaj Gönderildi');
                return $this->redirectToRoute('aboutus');
            }

        }
        $data = $settingRepository->findAll();

        return $this->render('home/aboutus.html.twig', [
            'data' => $data,
            'message' => $message,
        ]);
    }

    /**
     * @Route("/products", name="products", methods="GET|POST")
     */
    public function products(SettingRepository $settingRepository, ProductRepository $productRepository)
    {
        //$user = $this->getUser();

        //$em = $this->getDoctrine()->getManager();
       //$sqlshop = 'Select p.title, p.sprice, s.*
       //           From shopcarts s, product p
       //           Where s.productid = p.id AND userid =:userid';

       //$statementshop = $em->getConnection()->prepare($sqlshop);
       //$statementshop->bindValue('userid', $user->getid());
       //$statementshop->execute();
       //$shopcarts = $statementshop->fetchAll();

        $result = $productRepository->findBy(['status' => 'true']);

        $data = $settingRepository->findAll();
        return $this->render('home/product.html.twig', [
            //'shopcarts' => $shopcarts,
            'data' => $data,
            'result' => $result,
        ]);
    }

    /**
     * @Route("/products/{id}", name="products_detail", methods="GET|POST")
     */
    public function productsdetail(CommentsRepository $commentsRepository,CategoryRepository $categoryRepository, ProductRepository $productRepository, $id, ImageRepository $imageRepository, ShopcartsRepository $shopcartsRepository)
    {
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY'); // LOGİN KONTROLU
        $user = $this->getUser();
        $userid = $user->getid();
        $category = $productRepository->find('category_id');
        $catlist = $categoryRepository->findBy(['id' => $category]);
        $data = $productRepository->findBy(['id' => $id]);
        $images = $imageRepository->findBy(['productId' => $id]);
        $em = $this->getDoctrine()->getManager();
        $sqlshop = 'Select * from product where id=:userid';

        $statementshop = $em->getConnection()->prepare($sqlshop);
        $statementshop->bindValue('userid', $user->getid());
        $statementshop->execute();
        $shopcarts = $statementshop->fetchAll();
        $total = $shopcartsRepository->getUserShopCartTotal($userid);
        $comments = $commentsRepository->findBy(['productid' => $id,'status'=> 'true']);

        return $this->render('home/singleproduct.html.twig', [
            'usercomment' => $comments,
            'total' => $total,
            'data' => $data,
            'catlist' => $catlist,
            'images' => $images,
            'shopcarts' => $shopcarts,
        ]);
    }

    public function CategoryTreeList($parent = 0, $user_tree_array = '')
    {
        if (!is_array($user_tree_array)) {
            $user_tree_array = array();
        }
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT * FROM category WHERE status = 'true' AND parentid = " . $parent;
        $statement = $em->getConnection()->prepare($sql);
        // $statement->bindValue('pid',$parent);
        $statement->execute();
        $result = $statement->fetchAll();
        if (count($result) > 0) {
            $user_tree_array[] = "<ul>";
            foreach ($result as $row) {
                $user_tree_array[] = "<li><a href='category/" . $row['id'] . "'>" . $row['title'] . "</a>";
                $user_tree_array = $this->CategoryTreeList($row['id'], $user_tree_array);
            }
            $user_tree_array[] = "</li></ul>";
        }
        return $user_tree_array;

    }

    /**
     * @Route("/category/{catid}", name="category_products", methods="GET")
     */
    public function CategoryProducts($catid, CategoryRepository $repository)
    {
        $data = $repository->findBy(
            ['id' => $catid]
        );

        $em = $this->getDoctrine()->getManager();
        $sql = 'SELECT * FROM product WHERE status="true" AND category_id = :catid';
        $statement = $em->getConnection()->prepare($sql);
        $statement->bindValue('catid', $catid);
        $statement->execute();
        $result = $statement->fetchAll();

        return $this->render('home/product.html.twig', [
            'data' => $data,
            'result' => $result,
        ]);

    }

    /**
     * @Route("/singleproduct/{id}", name="single_product", methods="GET")
     */
    public function SingleProduct($id, ProductRepository $repository)
    {
        $data = $repository->findBy(
            ['id' => $id]
        );

        return $this->render('home/product.html.twig', [
            'data' => $data,
        ]);

    }

    /**
     * @Route("/myprofile", name="myprofile", methods="GET|POST")
     */
    public function profile(CommentsRepository $commentsRepository,ShopcartsRepository $shopcartsRepository, OrdersRepository $ordersRepository, ProductRepository $repository)
    {
        $user = $this->getUser();
        $id = $user->getid();
        $data = $repository->findBy(
            ['id' => $id]
        );

        $total = $shopcartsRepository->getUserShopCartTotal($id);
        $mycomments = $commentsRepository->findBy(['userid' => $id ]);


        return $this->render('home/profile.html.twig', [
            'mycomments' =>$mycomments,
            'data' => $data,
            'orders' => $ordersRepository->findBy(['userid' => $id]),
            'total' => $total,
        ]);

    }

    /**
     * @Route("/newuser", name="newuser", methods={"GET","POST"})
     */
    public function newuser(Request $request): Response
    {
        $user = new User();
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);
        $submittedToken = $request->request->get('token');

            if ($this->isCsrfTokenValid('form-newuser', $submittedToken) && $form->isSubmitted()) {
                $entityManager = $this->getDoctrine()->getManager();
                $entityManager->persist($user);
                $entityManager->flush();
                $this->addFlash('success', 'Kayıt olundu..');

                return $this->redirectToRoute('app_login');
            }

        return $this->render('home/newuser.html.twig', [
            'user' => $user,
            'form' => $form->createView(),
        ]);

    }

    /**
     * @Route("/edit", name="editusernow", methods={"GET","POST"})
     */
    public function edit(Request $request): Response
    {
        $userpermission = $this->getUser();
        $user = $this->getDoctrine()
            ->getRepository(User::class)
            ->find($userpermission->getid());

        if ($request->isMethod('POST')) {
            $submittedtoken = $request->request->get('token');
            if ($this->isCsrfTokenValid('form-user', $submittedtoken)) {


                $user->setName($request->request->get("name"));
                $user->setCity($request->request->get("city"));
                $user->setPassword($request->request->get("password"));
                $user->setAdress($request->request->get("adress"));
                $user->setPhone($request->request->get("phone"));
                $this->getDoctrine()->getManager()->flush();

                return $this->redirectToRoute('app_login');

            }

        }

        return $this->render('home/profile.html.twig', ['user' => $user]);


    }
    /**
     * @Route("/newcomment/{id}", name="newcomment", methods="GET|POST")
     */
    public function newcomment($id,Request $request): Response
    {
        $comment = new Comments();
        $form = $this->createForm(CommentsType::class, $comment);
        $form->handleRequest($request);
        $submittedToken = $request->request->get('token');
        if ($form->isSubmitted()) {

            // 'delete-item' is the same value used in the template to generate the token
            if ($this->isCsrfTokenValid('form-comment', $submittedToken)) {
                $entityManager = $this->getDoctrine()->getManager();
                $entityManager->persist($comment);
                $entityManager->flush();
                $this->addFlash('success', 'Yorum Yapıldı...');

                return $this->redirect($this->generateUrl('products_detail', array('id' => $id)));
                //return $this->redirectToRoute('products_detail',array('id' => $id));
            }
        }
        return $this->render('home/singleproduct.html.twig', [
            'addedcomment' => $comment,
            'form' => $form->createView(),
        ]);

    }

}