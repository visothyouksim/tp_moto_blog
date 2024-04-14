<?php

namespace App\DataFixtures;

use App\Entity\Post;
use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\String\Slugger\SluggerInterface;

class AppFixtures extends Fixture
{
    public function __construct(private readonly SluggerInterface $slugger,private readonly UserPasswordHasherInterface $passwordHasher)
    {
    }

    public function load(ObjectManager $manager): void
    {
        # Chargement des utilisateurs
        $admin = new User();
        $admin->setFirstName('Admin')
            ->setLastName('Test')
            ->setEmail('admin@moto.blog')
            ->setRoles(['ROLE_ADMIN']);

        # Hashage du mot de passe
        $admin->setPassword(
            $this->passwordHasher->hashPassword(
                $admin, 'demo'
            )
        );
        $manager->persist($admin);

        $reporter = new User();
        $reporter->setFirstName('Reporter')
            ->setLastName('Test')
            ->setEmail('reporter@moto.blog')
            ->setRoles(['ROLE_REPORTER']);

        # Hashage du mot de passe
        $reporter->setPassword(
            $this->passwordHasher->hashPassword(
                $reporter, 'demo'
            )
        );

        $manager->persist($reporter);

        $user = new User();
        $user->setFirstName('User')
            ->setLastName('Test')
            ->setEmail('user@moto.blog')
            ->setRoles(['ROLE_USER']);

        # Hashage du mot de passe
        $user->setPassword(
            $this->passwordHasher->hashPassword(
                $user, 'demo'
            )
        );

        $manager->persist($user);

//        #################################################################

        # Chargement des articles

        $currentDate = new \DateTimeImmutable();
        $title = 'Essai comparatif Kawasaki ZX-4RR / ZX-6R';
        $slug = $this->slugger->slug($title);

        $post = new Post();
        $post->setTitle($title)
            ->setSlug($slug)
            ->setImage('https://storage.kawasaki.eu/public/kawasaki.eu/en-EU/model/24MY_Ninja_ZX-6R_GN1_STU__2_.png')
            ->setContent('Avec la ZX-4R et la ZX-6R, c’est le grand retour des hystériques des hauts régimes, des symphonies en turbine majeure. Kawasaki relance en effet sa fameuse ZX-6R et dévoile en même temps sa ZX-4RR, harpie de poche des circuits. Fan des screamers, vous pouvez de nouveau hurler de plaisir, avec le choix des armes et des pistardes. Essai...')
            ->setCreatedAt($currentDate)
            ->setUpdatedAt($currentDate)
            ->setPublishedAt($currentDate)
            ->setUser($admin);

        $manager->persist($post);

        $post = new Post();
        $post->setTitle('Kawasaki Z500')
            ->setSlug('kawasaki-z500')
            ->setImage('https://storage.kawasaki.eu/public/kawasaki.eu/en-EU/model/24MY_Z500_SE_RD1_STU__2_.png')
            ->setContent('Incontournable succès des ventes de Kawasaki sur le segment midsize dès son apparition en 2004, les roadsters midsize Z750 et ses descendantes Z800 et Z900 affolent les compteurs. Décliné en Z125 et Z400, le roadster se dote ainsi d’une famille à succès. Mais les petite-moyennes cylindrées du modèle ont désormais fort à faire avec une concurrence toujours plus pressante sur le marché A2. Après son Eliminator 500, le constructeur d’Akashi met à jour sa Z avec une évolution en version « 500 ». Deux déclinaisons sont disponibles, standard et SE. C’est cette dernière que nous emmenons dans l’arrière-pays d’Alicante (Espagne) sur un racé soigneusement choisi par la marque japonaise pour nous permettre de juger des qualités de son roadster de poche.')
            ->setCreatedAt($currentDate)
            ->setUpdatedAt($currentDate)
            ->setPublishedAt($currentDate)
            ->setUser($reporter);

        $manager->persist($post);

        $post = new Post();
        $post->setTitle('Comparo roadsters Honda Hornet, Kawasaki Z650 et Yamaha MT-07')
            ->setSlug('comparo-roadsters-honda-hornet-kawasaki-z650-et-yamaha-mt-07')
            ->setImage('https://storage.kawasaki.eu/public/kawasaki.eu/en-EU/model/23MY_Z650_GY1_STU__2_.png')
            ->setContent('Dans la catégorie roadster midsize, je demande la moto la plus vendue : et je nomme la Yamaha MT-07. Car la MT07 domine le segment depuis des années, avec encore 4.363 modèles vendus en 2022., loin devant une certaine Kawasaki Z650 à 1.316 modèles vendus, derrière même une certaine Honda CB650R. Et puis arrive la Honda CB750 Hornet à un tarif quasi identique, mais avec un moteur bien plus puissant. Peut-on encore parler de comparatif, tellement les différences sont grandes pour envisager un duel à armes égales ? Essai, vidéo à l\'appui des modèles, version A2 comprise.')
            ->setCreatedAt($currentDate)
            ->setUpdatedAt($currentDate)
            ->setPublishedAt($currentDate)
            ->setUser($user);

        $manager->persist($post);

        $post = new Post();
        $post->setTitle('Essai moto Kawasaki Ninja 7 Hybrid')
            ->setSlug('essai-moto-kawasaki-ninja-7-hybrid')
            ->setImage('https://storage.kawasaki.eu/public/kawasaki.eu/en-EU/model/24MY_Ninja%207%20Hybrid_SL1_STU%20(1).001.png')
            ->setContent('On se demandait qui oserait en premier sortir une motorisation hybride sur une moto ou un scooter. Quoi de plus naturel qu\'un motoriste de renom, doublé d\'un constructeur sachant innover, soit à la pointe d’une nouvelle technologie ? C\'est donc Kawasaki qui s\'y colle et tâte le terrain au travers de cette première mondiale. Un terrain connu dans le monde automobile, dont Kawasaki ne fait d’ailleurs pas partie contrairement à Honda ou à Suzuki, mais un terrain totalement vierge dans l\'univers du deux roues motorisé de série. Kawasaki, c\'est aussi une « marque ». La River Marque, en l’occurrence, arborée par les modèles d\'exception. Et cette nouvelle Ninja 7 Hybrid la porte. Quant à savoir ce qu\'elle apporte, ou devrait apporter, voyons ensemble. Essai, vidéo incluse...')
            ->setCreatedAt($currentDate)
            ->setUpdatedAt($currentDate)
            ->setPublishedAt($currentDate)
            ->setUser($user);

        $manager->persist($post);

        $manager->flush();
    }
}
