<?php

namespace App\Controller;

use App\Entity\Category;
use App\Repository\CategoryRepository;
use App\Repository\PostRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class DefaultController extends AbstractController
{
    #[Route('/', name: 'default_home', methods: ['GET'])]
    public function home(PostRepository $postRepository, CategoryRepository $categoryRepository): Response
    {
        $posts = $postRepository->findBy([], ['publishedAt' => 'DESC']);

        return $this->render('default/home.html.twig', [
            'posts' => $posts,
            'categories' => $categoryRepository->findAll()
        ]);
    }
}
