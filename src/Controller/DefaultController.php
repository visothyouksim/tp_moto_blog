<?php

namespace App\Controller;

use App\Repository\PostRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class DefaultController extends AbstractController
{
    #[Route('/', name: 'default_home', methods: ['GET'])]
    public function home(PostRepository $postRepository): Response
    {
        #1. Récupération des derniers articles
        $posts = $postRepository->findAll();

        return $this->render('default/home.html.twig', [
            'posts' => $posts
        ]);
    }
}
