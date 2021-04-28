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
    <link rel="stylesheet" href="https://wp.dev.irex.aretex.ca/wp-content/themes/irex/style.css">
    <link rel="stylesheet" href="https://wp.dev.irex.aretex.ca/wp-content/themes/irex/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@icon/elegant-icons@0.0.1-alpha.4/elegant-icons.css" integrity="sha256-sBa7x1vl84pa660kRpy/EiYF0lSRL8SxRqUbCDaLEfg=" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/fontawesome.min.css" integrity="sha512-OdEXQYCOldjqUEsuMKsZRj93Ht23QRlhIb8E/X0sbwZhme8eUw6g8q7AdxGJKakcBbv7+/PX0Gc2btf7Ru8cZA==" crossorigin="anonymous" />
    <meta name="viewport" content="width=device-width">
    <link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />

    <?php wp_head(); ?>
</head>
<body <?php body_class(); ?> style="font-family: 'Poppins', sans-serif;">






<nav class="navbar navbar-light bg-light navbar-expand-lg fixed-top" style="height: 35px; background-color: #007bff !important;z-index: 9999;">
  <a href="#" class="navbar-brand"></a>
  <div class="mynavbar" id="mynav">
    <ul class="navbar-na" style="display:flex; margin-top: -10px; list-style: none;">
      <li clas="navbar-item">
        <a href="https://erpnext.dev.irex.aretex.ca/blog" class="nav-link" style="color: white !important; ">Blog</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"style="color: white !important; ">
            A propos
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" style="z-index: 999 ">
            <a class="dropdown-item" href="https://wp.dev.irex.aretex.ca/partenaires">Partenaires</a>
            <a class="dropdown-item" href="https://wp.dev.irex.aretex.ca/historique">Historique</a>
            <a class="dropdown-item" href="https://wp.dev.irex.aretex.ca/carriere">Carrière</a>
            
          </div>
        </li>
        <li clas="navbar-item">
          <a href="https://erpnext.dev.irex.aretex.ca/contact" class="nav-link" style="color: white !important; ">Contact</a>
        </li>  
        <li clas="navbar-item">
          <a href="faq" class="nav-link" style="color: white !important; ">FAQ</a>
        </li>  
    </ul>
  </div>
</nav>






<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark" style="margin-top: 35px">
<a href="https://wp.dev.irex.aretex.ca">
  <img src="https://wp.dev.irex.aretex.ca/wp-content/uploads/2020/12/logo-64.png" alt="IREX LOGO">
</a>
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
