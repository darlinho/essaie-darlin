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
<body <?php body_class(); ?>>





<nav class="navbar nav1">
    <div class="container">
        <div class="navbar-header">
            
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right top-nv text-uppercase">
                <li><a href="#">About US</a></li>
                <li><a href="#">Careers</a></li>
                <li><a href="#">Group Site</a></li>
                <li><a href="#">Contact Us</a></li>
                <li><a href="#"><i>Client Login</i></a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="navbar navbar-inverse nav2" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#"><img src="images/home/logo.png" alt="LOGO"></a>
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar2">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar2">
            <ul class="nav navbar-nav navbar-right cust-nav text-uppercase ">
                <li><a href="#">Wealth management</a></li>
                <li><a href="#">Multi manager</a></li>
                <li><a href="#">Asset manager</a></li>
                <li><a href="#">International</a></li>
                <li><a href="#">News &amp; Insights</a></li>
                <div class="hd hidden-md"></div>
            </ul>

        </div>

        <?php
    wp_nav_menu([
      'menu'            => 'primary',
      'theme_location'  => 'menu-1',
      'container'       => 'div',
      'container_id'    => 'navbarCollapse',
      // 'container_class' => 'collapse navbar-collapse',
      'menu_id'         => false,
      'menu_class'      => 'navbar-nav mr-auto',
      'depth'           => 0,
      'fallback_cb'     => 'bs4navwalker::fallback',
      'walker'          => new bs4navwalker()
    ]);
  ?> 
    </div>
</div>






<!-- <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
  <a class="navbar-brand" href="#">
    <?php bloginfo('name'); ?>
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

</nav> -->



        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>