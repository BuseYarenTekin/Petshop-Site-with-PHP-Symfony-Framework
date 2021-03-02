<?php

namespace App\Controller;

use App\Entity\Admin\Image;
use App\Entity\User;
use App\Form\UserType;
use App\Repository\Admin\CategoryRepository;
use App\Repository\Admin\ProductRepository;
use App\Repository\Admin\SettingRepository;
use App\Repository\Admin\ImageRepository;
use App\Entity\Admin\Messages;
use App\Form\Admin\MessagesType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    /**
     * @Route("/", name="home")
     */
    public function index(SettingRepository $settingRepository, CategoryRepository $categoryRepository)
    {
        $data = $settingRepository->findAll();
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT * FROM product WHERE status='True' ORDER BY ID DESC LIMIT 3";
        $statement = $em->getConnection()->prepare($sql);
        // $statement->bindValue('parentid',$parent);
        $statement->execute();
        $sliders = $statement->fetchAll();
        $cats = $this->categorytree();
        // dump($sliders);
        // print_r($cats);
        //die();
        $cats[0] = '<ul id="menu-v">';

        return $this->render('home/index.html.twig', [
            'data' => $data,
            'cats' => $cats,
            'sliders' => $sliders,
        ]);
    }

    //Recursive function for category tree
    public function categorytree($parent = 0, $user_tree_array = ' ')
    {

        if (!is_array($user_tree_array))
            $user_tree_array = array();
        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT * FROM category WHERE status='True' AND parentid=" . $parent;
        $statement = $em->getConnection()->prepare($sql);
        //  $statement->bindValue('parentid',$parent);
        $statement->execute();
        $result = $statement->fetchAll();

        if (count($result) > 0) {
            $user_tree_array[] = "<ul>";
            foreach ($result as $row) {
                $user_tree_array[] = "<li><a href='category/" . $row['id'] . "'>" . $row['title'] . "</a>";
                $user_tree_array = $this->categorytree($row['id'], $user_tree_array);

            }
            $user_tree_array[] = "</li></ul>";
        }
        return $user_tree_array;
    }

    /**
     * @Route("/category/{catid}", name="category_products", methods="GET")
     */
    public function CategoryProducts($catid, CategoryRepository $categoryRepository)
    {

        $cats = $this->categorytree();
        $cats[0] = '<ul id="menu-v">';
        $data = $categoryRepository->findBy(
            ['id' => $catid]
        );
        //dump($data);

        $em = $this->getDoctrine()->getManager();
        $sql = "SELECT * FROM product WHERE status='true' AND category_id=" . $catid;
        $statement = $em->getConnection()->prepare($sql);
        //   $statement->bindValue('catid', $catid);
        $statement->execute();
        $products = $statement->fetchAll();
//        dump($products);
//        die();
        return $this->render('home/products.html.twig', [
            'data' => $data,
            'cats' => $cats,
            'products' => $products,
        ]);
    }


    /**
     * @Route("/product/{id}", name="product_detail", methods="GET")
     */
    public function ProductDetails($id, ProductRepository $productRepository)
    {
        $cats = $this->categorytree();
        // dump($sliders);
        // print_r($cats);
        //die();
        $cats[0] = '<ul id="menu-v">';

        $data = $productRepository->findBy(
            ['id' => $id]

        );

        $gallery = $this->getDoctrine()->getRepository(Image::class)->findBy(array("product_id" => $id));



        return $this->render('home/product_detail.html.twig', [
            'data' => $data,
            'cats' => $cats,
            'gallery' => $gallery

        ]);
    }

    /**
     * @Route("/hakkimizda", name="hakkimizda")
     */
    public function hakkimizda(SettingRepository $settingRepository)
    {
        $data = $settingRepository->findAll();

        return $this->render('home/hakkimizda.html.twig', [
            'data' => $data,
        ]);
    }

    /**
     * @Route("/iletisim", name="iletisim")
     */
    public function iletisim(SettingRepository $settingRepository, Request $request)
    {
        $message = new Messages();
        $form = $this->createForm(MessagesType::class, $message);
        $form->handleRequest($request);
        //formdaki csrfi okuma
        $submittedToken = $request->request->get('token');
        if ($form->isSubmitted()) {
            //formdaki mesaj ile eşleşiyorsa
            if ($this->isCsrfTokenValid('form-message', $submittedToken)) {
                $em = $this->getDoctrine()->getManager();
                $em->persist($message);
                $em->flush();
                $this->addFlash('success', 'Mesajınız Başarıyla Gönderilmiştir');
                return $this->redirectToRoute('iletisim');
            }
        }
        $data = $settingRepository->findAll();
        return $this->render('home/iletisim.html.twig', [
            'data' => $data,
            'form' => $form->createView(),
            'message' => $message,
        ]);
    }

    /**
     * @Route("/referanslar", name="referanslar")
     */
    public function referanslar(SettingRepository $settingRepository)
    {
        $data = $settingRepository->findAll();

        return $this->render('home/referanslar.html.twig', [
            'data' => $data,
        ]);
    }


    /**
     * @Route("home/user/{id}", name="home_user_show", methods="GET")
     */
    public function show(User $user): Response
    {
        return $this->render('user/show.html.twig', ['user' => $user]);
    }

    /**
     * @Route("home/user/{id}/edit", name="home_user_edit", methods="GET|POST")
     */
    public function edit(Request $request, User $user): Response
    {
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);

        $submittedToken = $request->request->get('token');
        if ($this->isCsrfTokenValid('useredit-form', $submittedToken)) {
            if ($form->isSubmitted()) {

                $role = $request->request->get('role');
                $user->setRoles(array($role));
                $this->getDoctrine()->getManager()->flush();

                return $this->redirectToRoute('home', [
                    'user' => $user
                ]);
            }
        }

        return $this->render('user/edit.html.twig', [
            'user' => $user,
            'form' => $form->createView(),
        ]);
    }

}
