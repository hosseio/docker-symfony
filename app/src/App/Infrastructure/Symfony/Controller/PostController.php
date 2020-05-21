<?php

namespace App\Infrastructure\Symfony\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
//TODO controller as service and inyect domain repository
use App\Infrastructure\Symfony\Repository\PostRepository;

class PostController extends AbstractController
{
    /**
     * @Route("/", name="")
     * @Template
     */
    public function index(PostRepository $postRepository)
    {
        $posts = $postRepository->findAll();

        return [
            'posts' => $posts
        ];
    }
}
