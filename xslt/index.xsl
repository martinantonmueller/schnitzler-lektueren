<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0" exclude-result-prefixes="tei xsl xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes"
        omit-xml-declaration="yes"/>
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select=".//tei:title[@type = 'main'][1]/text()"/>
        </xsl:variable>
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html xmlns="http://www.w3.org/1999/xhtml">
            <xsl:call-template name="html_head">
                <xsl:with-param name="html_title" select="$doc_title"/>
            </xsl:call-template>
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    <div class="wrapper" id="wrapper-hero">
                        <!--<div class="wrapper" id="wrapper-hero-content" >
                            <div class="container hero-dark" id="wrapper-hero-inner" tabindex="-1">-->
                        <div id="audenIndexCarousel" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#audenIndexCarousel" data-slide-to="0"
                                    class="active"/>
                            </ol>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img
                                        src="https://shared.acdh.oeaw.ac.at/schnitzler-lektueren/leseliste.jpg"
                                        class="d-block w-100" alt="..."/>
                                    <div class="carousel-caption d-none d-md-block"
                                        style="background-image: linear-gradient(rgba(38.0, 35.3, 37.6, 0.5), rgba(38.0, 35.3, 37.6, 0.5));">
                                        <h1>
                                            <xsl:value-of select="$project_title"/>
                                        </h1>
                                        <h2>Herausgegeben von Achim Aurnhammer</h2>
                                        <p>Digitale Edition der Leseliste von Arthur Schnitzler</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--</div>
                        </div>-->
                    </div>
                    <div class="container" style="margin-top:1em;">
                        <div class="row">
                            <div class="col-md-8" style="margin: 0 auto; ">
                                <p style="font-size:18px;line-heigth:27px;">Wohl im Jahre 1905 legte
                                    Arthur Schnitzler ein Typoskript an, das alle Autoren und Werke
                                    nennt, die er bis zu diesem Zeitpunkt gelesen hatte. Die
                                    Lektüreliste führte Schnitzler bis 1928, kurz vor seinem Tode,
                                    handschriftlich weiter. Der Lückenhaftigkeit seiner Leseliste
                                    war sich Schnitzler selbst durchaus bewusst. So bemerkte er zu
                                    Weihnachten 1911 in einer handschriftlichen Notiz auf dem
                                    Vorsatzblatt der Liste: »Auf Vollständigkeit kein Anspruch, nur
                                    zum Gedächtnisbehelf aufnotiert…« Nur etwa ein Drittel der Werke
                                    der Leseliste finden sich im <i>Tagebuch</i>. Damit stellt sie
                                    eine quantitativ wie qualitativ wichtige Ergänzung der dort
                                    notierten Lektürenachweisecd  dar.</p>
                                <p>Die gedruckte Edition wurde 2013 in der Reihe »Akten des Arthur
                                    Schnitzler-Archivs Freiburg« veröffentlicht und ist bei <a
                                        href="https://www.nomos-shop.de/ergon/titel/arthur-schnitzlers-lektueren-leseliste-und-virtuelle-bibliothek-id-90147/"
                                        target="_blank">Ergon</a> lieferbar. Sie wird hier nun
                                    erstmals digital verfügbar gemacht. Damit seht ein steht das
                                    digitale Urkundenbuch allen Interessierten online zu
                                    Verfügung.</p>
                            </div>
                        </div>
                    </div>
                    <div class="container" style="margin-top:1em;">
                        <div class="row">
                            <div class="col-md-4">
                                <a href="listperson.html" class="index-link">
                                    <div class="card index-card">
                                        <div class="card-body">
                                            <img
                                                src="https://shared.acdh.oeaw.ac.at/schnitzler-briefe/img/persons.jpg"
                                                class="d-block w-100" alt="..."/>
                                        </div>
                                        <div class="card-header">
                                            <h3>
                                                <i class="fa-solid fa-user-group"/> Personenregister
                                            </h3>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a href="listwork.html" class="index-link">
                                    <div class="card index-card">
                                        <div class="card-body">
                                            <img
                                                src="https://shared.acdh.oeaw.ac.at/schnitzler-briefe/img/werke.jpg"
                                                class="d-block w-100" alt="..."/>
                                        </div>
                                        <div class="card-header">
                                            <h3>
                                                <i class="fa-solid fa-user-group"/> Werkregister
                                            </h3>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a href="Deutschsprachige-Literatur.html" class="index-link">
                                    <div class="card index-card">
                                        <div class="card-body">
                                            <img
                                                src="https://shared.acdh.oeaw.ac.at/schnitzler-lektueren/leseliste-beispiel.jpg"
                                                class="d-block w-100" alt="..."/>
                                        </div>
                                        <div class="card-header">
                                            <h3>
                                                <i class="fa-solid fa-bars-staggered"/>
                                                Deutschsprachige Literatur </h3>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a href="Frankreich.html" class="index-link">
                                    <div class="card index-card">
                                        <div class="card-body">
                                            <img
                                                src="https://shared.acdh.oeaw.ac.at/schnitzler-lektueren/leseliste-beispiel.jpg"
                                                class="d-block w-100" alt="..."/>
                                        </div>
                                        <div class="card-header">
                                            <h3>
                                                <i class="fa-solid fa-bars-staggered"/> Frankreich
                                            </h3>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a href="Italien.html" class="index-link">
                                    <div class="card index-card">
                                        <div class="card-body">
                                            <img
                                                src="https://shared.acdh.oeaw.ac.at/schnitzler-lektueren/leseliste-beispiel.jpg"
                                                class="d-block w-100" alt="..."/>
                                        </div>
                                        <div class="card-header">
                                            <h3>
                                                <i class="fa-solid fa-bars-staggered"/> Italien
                                            </h3>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a href="Spanien.html" class="index-link">
                                    <div class="card index-card">
                                        <div class="card-body">
                                            <img
                                                src="https://shared.acdh.oeaw.ac.at/schnitzler-lektueren/leseliste-beispiel.jpg"
                                                class="d-block w-100" alt="..."/>
                                        </div>
                                        <div class="card-header">
                                            <h3>
                                                <i class="fa-solid fa-bars-staggered"/> Spanien
                                            </h3>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a href="England.html" class="index-link">
                                    <div class="card index-card">
                                        <div class="card-body">
                                            <img
                                                src="https://shared.acdh.oeaw.ac.at/schnitzler-lektueren/leseliste-beispiel.jpg"
                                                class="d-block w-100" alt="..."/>
                                        </div>
                                        <div class="card-header">
                                            <h3>
                                                <i class="fa-solid fa-bars-staggered"/> England
                                            </h3>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a href="Ungarn-etc.html" class="index-link">
                                    <div class="card index-card">
                                        <div class="card-body">
                                            <img
                                                src="https://shared.acdh.oeaw.ac.at/schnitzler-lektueren/leseliste-beispiel.jpg"
                                                class="d-block w-100" alt="..."/>
                                        </div>
                                        <div class="card-header">
                                            <h3>
                                                <i class="fa-solid fa-bars-staggered"/> Ungarn..
                                                etc. </h3>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a href="Polen-Czechen.html" class="index-link">
                                    <div class="card index-card">
                                        <div class="card-body">
                                            <img
                                                src="https://shared.acdh.oeaw.ac.at/schnitzler-lektueren/leseliste-beispiel.jpg"
                                                class="d-block w-100" alt="..."/>
                                        </div>
                                        <div class="card-header">
                                            <h3>
                                                <i class="fa-solid fa-bars-staggered"/> Polen..
                                                Czechen.. </h3>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a href="Norden.html" class="index-link">
                                    <div class="card index-card">
                                        <div class="card-body">
                                            <img
                                                src="https://shared.acdh.oeaw.ac.at/schnitzler-lektueren/leseliste-beispiel.jpg"
                                                class="d-block w-100" alt="..."/>
                                        </div>
                                        <div class="card-header">
                                            <h3>
                                                <i class="fa-solid fa-bars-staggered"/> Norden </h3>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a href="Russland.html" class="index-link">
                                    <div class="card index-card">
                                        <div class="card-body">
                                            <img
                                                src="https://shared.acdh.oeaw.ac.at/schnitzler-lektueren/leseliste-beispiel.jpg"
                                                class="d-block w-100" alt="..."/>
                                        </div>
                                        <div class="card-header">
                                            <h3>
                                                <i class="fa-solid fa-bars-staggered"/> Russland
                                            </h3>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a href="Griechenland.html" class="index-link">
                                    <div class="card index-card">
                                        <div class="card-body">
                                            <img
                                                src="https://shared.acdh.oeaw.ac.at/schnitzler-lektueren/leseliste-beispiel.jpg"
                                                class="d-block w-100" alt="..."/>
                                        </div>
                                        <div class="card-header">
                                            <h3>
                                                <i class="fa-solid fa-bars-staggered"/> Griechenland
                                            </h3>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a href="Rom.html" class="index-link">
                                    <div class="card index-card">
                                        <div class="card-body">
                                            <img
                                                src="https://shared.acdh.oeaw.ac.at/schnitzler-lektueren/leseliste-beispiel.jpg"
                                                class="d-block w-100" alt="..."/>
                                        </div>
                                        <div class="card-header">
                                            <h3>
                                                <i class="fa-solid fa-bars-staggered"/> Rom </h3>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="html_footer"/>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="tei:div//tei:head">
        <h2 id="{generate-id()}">
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    <xsl:template match="tei:p">
        <p id="{generate-id()}">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:list">
        <ul id="{generate-id()}">
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    <xsl:template match="tei:item">
        <li id="{generate-id()}">
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    <xsl:template match="tei:ref">
        <xsl:choose>
            <xsl:when test="starts-with(data(@target), 'http')">
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="@target"/>
                    </xsl:attribute>
                    <xsl:value-of select="."/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
