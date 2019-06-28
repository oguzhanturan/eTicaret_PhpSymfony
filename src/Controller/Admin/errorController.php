<?php

namespace App\Controller\Admin;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class errorController extends AbstractController
{
    /**
     * @Route("error", name="error")
     */
    public function index()
    {
        return $this->render('admin/error/error.html.twig', [
            'controller_name' => 'errorController',
        ]);
    }
}
