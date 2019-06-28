<?php

namespace App\Controller\Admin;

use App\Entity\Admin\messages;
use App\Form\Admin\messagesType;
use App\Repository\Admin\messagesRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/admin/messages")
 */
class messagesController extends AbstractController
{
    /**
     * @Route("/", name="admin_messages_index", methods="GET")
     */
    public function index(messagesRepository $messagesRepository): Response
    {
        return $this->render('admin/messages/index.html.twig', ['messages' => $messagesRepository->findAll()]);
    }

    /**
     * @Route("/new", name="admin_messages_new", methods="GET|POST")
     */
    public function new(Request $request): Response
    {
        $message = new messages();
        $form = $this->createForm(messagesType::class, $message);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($message);
            $em->flush();

            return $this->redirectToRoute('admin_messages_index');
        }

        return $this->render('admin/messages/new.html.twig', [
            'message' => $message,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="admin_messages_show", methods="GET")
     */
    public function show(messages $message): Response
    {
        return $this->render('admin/messages/show.html.twig', ['message' => $message]);
    }

    /**
     * @Route("/{id}/edit", name="admin_messages_edit", methods="GET|POST")
     */
    public function edit(Request $request, messages $message): Response
    {
        $form = $this->createForm(messagesType::class, $message);
        $form->handleRequest($request);

        if ($form->isSubmitted()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('admin_messages_index', ['id' => $message->getId()]);
        }

        return $this->render('admin/messages/edit.html.twig', [
            'message' => $message,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="admin_messages_delete", methods="DELETE")
     */
    public function delete(Request $request, messages $message): Response
    {
        if ($this->isCsrfTokenValid('delete'.$message->getId(), $request->request->get('_token'))) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($message);
            $em->flush();
        }

        return $this->redirectToRoute('admin_messages_index');
    }
}
