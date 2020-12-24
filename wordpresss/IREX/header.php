<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <title><?php wp_title('&laquo;', true, 'right'); ?> <?php bloginfo('name'); ?></title>

    <meta name="description" content="">
    <meta name="author" content="">

    <meta name="viewport" content="width=device-width">
    <link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />

    <?php wp_head(); ?>
</head>
<body <?php body_class(); ?> style="font-family: 'Poppins', sans-serif;">


<nav class="navbar navbar-light bg-light navbar-expand-lg fixed-top" style="height: 25px; background-color: #202020 !important;z-index: 9999;">
  <a href="#" class="navbar-brand"></a>
  <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarCollapse">
    <ul class="navbar-nav ml-auto">
      <li clas="navbar-item">
        <a href="#" class="nav-link" style="color: white !important; ">Blog</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"style="color: white !important; ">
            A propos
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" style="z-index: 999 ">
            <a class="dropdown-item" href="#">Partenaires</a>
            <a class="dropdown-item" href="#">Carière</a>
            <a class="dropdown-item" href="#">Historique</a>
          </div>
        </li>
        <li clas="navbar-item">
          <a href="#" class="nav-link" style="color: white !important; ">Contacter</a>
      </li>  
    </ul>
  </div>
</nav>






<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark" style="margin-top: 25px">
<img src="https://wp.dev.irex.aretex.ca/wp-content/uploads/2020/12/logo-64.png" alt="IREX LOGO">
  <a class="navbar-brand" href="https://wp.dev.irex.aretex.ca/" style="color: black !important;">
    <?php bloginfo('name'); ?>
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
 <?php
    wp_nav_menu([
      'menu'            => 'primary',
      'theme_location'  => 'menu-1',
      'container'       => 'div',
      'container_id'    => 'navbarCollapse',
      'container_class' => 'collapse navbar-collapse',
      'menu_id'         => false,
      'menu_class'      => 'navbar-nav mr-auto',
      'depth'           => 0,
      'fallback_cb'     => 'bs4navwalker::fallback',
      'walker'          => new bs4navwalker()
    ]);
  ?> 
</nav>
