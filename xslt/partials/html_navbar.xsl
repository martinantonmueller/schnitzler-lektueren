<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xsl tei xs" version="2.0">
    <xsl:template match="/" name="nav_bar">
        <div class="wrapper-fluid wrapper-navbar sticky-navbar" id="wrapper-navbar" itemscope="" itemtype="http://schema.org/WebSite">
            <a class="skip-link screen-reader-text sr-only" href="#content">Skip to content</a>
            <nav class="navbar navbar-expand-lg navbar-light">
                <div class="container-fluid">
                    <!-- Your site title as branding in the menu -->
                    <a href="index.html" class="navbar-brand custom-logo-link" rel="home" itemprop="url">
                        <img src="https://shared.acdh.oeaw.ac.at/schnitzler-lektueren/lektueren-logo.jpg" class="img-fluid" alt="Schnitzler Lektueren" itemprop="logo"/>
                    </a><!-- end custom logo -->
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"/>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                        <!-- Your menu goes here -->
                        <ul id="main-menu" class="navbar-nav">
                            <li class="nav-item dropdown">
                                <a title="Papers" href="#" data-toggle="dropdown" class="nav-link dropdown-toggle">Projekt <span class="caret"></span></a>
                                <ul class=" dropdown-menu" role="menu">
                                    <li class="nav-item dropdown-submenu">
                                        <a title="Schnitzler-Lektueren" href="about.html" class="nav-link">Zum Projekt</a>
                                        <a title="Schnitzler-Lektueren" href="vorwort.html" class="nav-link">Vorwort</a>
                                        <a title="Schnitzler-Lektueren" href="einleitung.html" class="nav-link">Einleitung</a>
                                        <a title="Schnitzler-Lektueren" href="edition.html" class="nav-link">Zur Edition</a>
                                        <a title="Schnitzler-Lektueren" href="literatur.html" class="nav-link">Literatur</a>
                                    </li>
                                </ul>                                
                            </li>
                            <li class="nav-item dropdown">
                                <a title="Indexes" href="#" data-toggle="dropdown" class="nav-link dropdown-toggle">Register <span class="caret"></span></a>
                                <ul class=" dropdown-menu" role="menu">
                                    <li class="nav-item dropdown-submenu">
                                        <a title="Personen" href="listperson.html" class="nav-link">Personen</a>
                                    </li>
                                    <li class="nav-item dropdown-submenu">
                                        <a title="Werke" href="listwork.html" class="nav-link">Werke</a>
                                    </li>
                                    <div class="dropdown-divider"></div>
                                    <li class="nav-item dropdown-submenu">
                                        <a title="GND-BEACON" href="beacon.txt" class="nav-link">GND-BEACON</a>
                                    </li>
                                </ul>                                
                            </li>                            
                            <li class="nav-item"><a title="Inhalt" href="toc.html" class="nav-link">Inhalt</a></li>
                            <li class="nav-item dropdown">
                                <a title="Indexes" href="#" data-toggle="dropdown" class="nav-link dropdown-toggle">Links <span class="caret"></span></a>
                                <ul class=" dropdown-menu" role="menu">
                                    <li class="nav-item dropdown-submenu"><a title="Links" href="http://portal.uni-freiburg.de/ndl/personen/achimaurnhammer/schnitzlerarchiv.html/startseite" class="nav-link">Arthur-Schnitzler-Archiv</a></li>
                            <li class="nav-item dropdown-submenu">
                                <a title="Links" href="https://schnitzler.acdh.oeaw.ac.at" class="nav-link">Schnitzler am ACDH-CH</a></li></ul></li>
                            <a title="Links" href="https://github.com/martinantonmueller/schnitzler-lektueren" class="nav-link">Daten auf gitHub</a>
                        </ul>                        
                        <form class="form-inline my-2 my-lg-0 navbar-search-form" method="get" action="search.html" role="search">
                            <input class="form-control navbar-search" id="s" name="q" type="text" placeholder="Suche" value="" autocomplete="off" />
                            <button type="submit" class="navbar-search-icon">
                                <i data-feather="Suche"></i>
                            </button>
                        </form>
                    </div>
                    <!-- .collapse navbar-collapse -->
                </div>
                <!-- .container -->
            </nav>
            <!-- .site-navigation -->
        </div>
    </xsl:template>
</xsl:stylesheet>