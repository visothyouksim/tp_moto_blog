<?php

namespace App\Controller;

use App\Entity\Post;
use App\Form\PostType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use Symfony\Component\String\Slugger\SluggerInterface;

#[Route('/administration/article')]
class PostController extends AbstractController
{
    #[Route('/creer-un-article.html', name: 'post_create')]
    # ex. localhost:8000/administration/article/creer-un-article.html
    public function create(Request $request,
                           SluggerInterface $slugger,
                           EntityManagerInterface $manager): Response
    {
        # Création d'un Post
        $post = new Post();
        $post->setCreatedAt(new \DateTimeImmutable());
        $post->setPublishedAt(new \DateTimeImmutable());
        $post->setUpdatedAt(new \DateTimeImmutable());

        # Récupération de l'utilisateur connecté en session
        $user = $this->getUser();

        # Affectation de l'auteur de mon article
        $post->setUser($user);

        # Création de mon formulaire
        $form = $this->createForm(PostType::class, $post);
        $form->handleRequest($request);

        # A la soumission du formulaire
        if ($form->isSubmitted() && $form->isValid()) {

            # TODO Vérification de l'alias ...
            $slug = $slugger->slug($post->getTitle());
            // Convertir l'objet UnicodeString en chaîne de caractères
            $post->setSlug($slug->toString());

            # Sauvegarde dans la BDD
            $manager->persist($post);
            $manager->flush();

            # Notification a l'utilisateur
            $this->addFlash('success', "Félicitation, votre article est enregistré");

            # Redirection vers l'article
            return $this->redirectToRoute('default_home', [
                'category' => $post->getCategories()[0]->getSlug(),
                'slug' => $post->getSlug()
            ]);

        }


        return $this->render('post/create.html.twig', [
            'form' => $form,
        ]);
    }
}
