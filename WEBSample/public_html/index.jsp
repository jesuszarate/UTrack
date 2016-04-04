<!doctype html>
<!--
  Material Design Lite
  Copyright 2015 Google Inc. All rights reserved.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License
-->
<%@ page language="java" import="cs5530.*" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Utrack</title>

    <!-- Add to homescreen for Chrome on Android -->
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="icon" sizes="192x192" href="images/android-desktop.png">

    <!-- Add to homescreen for Safari on iOS -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Material Design Lite">
    <link rel="apple-touch-icon-precomposed" href="images/ios-desktop.png">

    <!-- Tile icon for Win8 (144x144 + tile color) -->
    <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png">
    <meta name="msapplication-TileColor" content="#3372DF">

    <link rel="shortcut icon" href="images/favicon.png">

    <!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
    <!--
    <link rel="canonical" href="http://www.example.com/">
    -->

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.deep_purple-pink.min.css">
    <link rel="stylesheet" href="styles.css">
    <style>
        #view-source {
        position: fixed;
        display: block;
        right: 0;
        bottom: 0;
        margin-right: 40px;
        margin-bottom: 40px;
        z-index: 900;
        }
    </style>
</head>
<body class="mdl-demo mdl-color--grey-100 mdl-color-text--grey-700 mdl-base">
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
    <header class="mdl-layout__header mdl-layout__header--scroll mdl-color--red-600">
        <div class="mdl-layout--large-screen-only mdl-layout__header-row">
        </div>
        <div class="mdl-layout--large-screen-only mdl-layout__header-row">
            <b><h1>UTrack</h1></b>
        </div>
        <div class="mdl-layout--large-screen-only mdl-layout__header-row">
        </div>
        <div class="mdl-layout__tab-bar mdl-js-ripple-effect mdl-color--red-900">
            <a href="#overview" class="mdl-layout__tab is-active">Home</a>
            <a href="#features" class="mdl-layout__tab">Favorites</a>
            <a href="#popular" class="mdl-layout__tab">Popular</a>
            <a href="#features" class="mdl-layout__tab">FAQ</a>
            <a href="signin.jsp" class="mdl-layout__tab">Sign in</a>
            <a href="#features" class="mdl-layout__tab">Account</a>
            <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored mdl-shadow--4dp mdl-color--grey-900" id="add">
                <i class="material-icons" role="presentation">add</i>
                <span class="visuallyhidden">Add</span>
            </button>
        </div>
    </header>
    <main class="mdl-layout__content">
        <div class="mdl-layout__tab-panel is-active" id="overview">
            <div class="android-be-together-section mdl-typography--text-center mdl-text--grey-900">
                <b><h1>Check out these POIs</h1></b>
            </div>
            <!--Use this for each POI-->
            <!-- Jack Mormon Card -->
            <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
                <header class="section__play-btn mdl-cell mdl-cell--3-col-desktop mdl-cell--2-col-tablet mdl-cell--4-col-phone mdl-color--teal-100 mdl-color-text--white">
                    <!-- Insert Image here for POI-->
                    <!--<i class="material-icons">play_circle_filled</i>-->
                    <img src="images/jack-morman.jpg" alt="Jack Mormon image" style="width:220px;height:228px;">
                </header>

                <div class="mdl-card mdl-cell mdl-cell--9-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone">
                    <div class="mdl-card__supporting-text">
                        <h4>Jack Mormon Coffee</h4>
                    </div>
                    <div class="mdl-card__actions">
                        <a href="#" class="mdl-button">Read more</a>
                    </div>
                </div>
                <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="btn-n">
                    <i class="material-icons">more_vert</i>
                </button>

                <!-- Menu -->
                <ul class="mdl-menu mdl-js-menu mdl-menu--bottom-right" for="btn-n">
                    <li class="mdl-menu__item">Lorem</li>
                    <li class="mdl-menu__item" disabled>Ipsum</li>
                    <li class="mdl-menu__item">Dolor</li>
                </ul>
            </section>

            <!-- Naked Fish Card -->
            <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
                <header class="section__play-btn mdl-cell mdl-cell--3-col-desktop mdl-cell--2-col-tablet mdl-cell--4-col-phone mdl-color--teal-100 mdl-color-text--white">
                    <!-- Insert Image here for POI-->
                    <!--<i class="material-icons">play_circle_filled</i>-->
                    <img src="images/naked-fish.jpg" alt="Naked Fish" style="width:220px;height:228px;">
                </header>

                <div class="mdl-card mdl-cell mdl-cell--9-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone">
                    <div class="mdl-card__supporting-text">
                        <h4>Naked Fish</h4>
                    </div>
                    <div class="mdl-card__actions">
                        <a href="#" class="mdl-button">Read more</a>
                    </div>
                </div>
                <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="btn-nf">
                    <i class="material-icons">more_vert</i>
                </button>

                <!-- Menu -->
                <ul class="mdl-menu mdl-js-menu mdl-menu--bottom-right" for="btn-nf">
                    <li class="mdl-menu__item">Lorem</li>
                    <li class="mdl-menu__item" disabled>Ipsum</li>
                    <li class="mdl-menu__item">Dolor</li>
                </ul>
            </section>
            <section class="section--footer mdl-color--white mdl-grid">
                <!--
                <div class="section__circle-container mdl-cell mdl-cell--2-col mdl-cell--1-col-phone">
                    <div class="section__circle-container__circle mdl-color--accent section__circle--big">
                    </div>
                </div>
                <div class="section__text mdl-cell mdl-cell--4-col-desktop mdl-cell--6-col-tablet mdl-cell--3-col-phone">
                    <h5>Lorem ipsum dolor sit amet</h5>
                    Qui sint ut et qui nisi cupidatat. Reprehenderit nostrud proident officia exercitation anim et pariatur ex.
                </div>
                <div class="section__circle-container mdl-cell mdl-cell--2-col mdl-cell--1-col-phone">
                    <div class="section__circle-container__circle mdl-color--accent section__circle--big"></div>
                </div>
                <div class="section__text mdl-cell mdl-cell--4-col-desktop mdl-cell--6-col-tablet mdl-cell--3-col-phone">
                    <h5>Lorem ipsum dolor sit amet</h5>
                    Qui sint ut et qui nisi cupidatat. Reprehenderit nostrud proident officia exercitation anim et pariatur ex.
                </div>
                -->
            </section>
        </div>
        <!--Details Section (Don't know what I'll use them for yet)-->
        <!--
        <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
            <div class="mdl-card mdl-cell mdl-cell--12-col">
                <div class="mdl-card__supporting-text mdl-grid mdl-grid--no-spacing">
                    <h4 class="mdl-cell mdl-cell--12-col">Details</h4>
                    <div class="section__circle-container mdl-cell mdl-cell--2-col mdl-cell--1-col-phone">
                        <div class="section__circle-container__circle mdl-color--primary"></div>
                    </div>
                    <div class="section__text mdl-cell mdl-cell--10-col-desktop mdl-cell--6-col-tablet mdl-cell--3-col-phone">
                        <h5>Lorem ipsum dolor sit amet</h5>
                        Dolore ex deserunt aute fugiat aute nulla ea sunt aliqua nisi cupidatat eu. Duis nulla tempor do aute et eiusmod velit exercitation nostrud quis <a href="#">proident minim</a>.
                    </div>
                    <div class="section__circle-container mdl-cell mdl-cell--2-col mdl-cell--1-col-phone">
                        <div class="section__circle-container__circle mdl-color--primary"></div>
                    </div>
                    <div class="section__text mdl-cell mdl-cell--10-col-desktop mdl-cell--6-col-tablet mdl-cell--3-col-phone">
                        <h5>Lorem ipsum dolor sit amet</h5>
                        Dolore ex deserunt aute fugiat aute nulla ea sunt aliqua nisi cupidatat eu. Duis nulla tempor do aute et eiusmod velit exercitation nostrud quis <a href="#">proident minim</a>.
                    </div>
                    <div class="section__circle-container mdl-cell mdl-cell--2-col mdl-cell--1-col-phone">
                        <div class="section__circle-container__circle mdl-color--primary"></div>
                    </div>
                    <div class="section__text mdl-cell mdl-cell--10-col-desktop mdl-cell--6-col-tablet mdl-cell--3-col-phone">
                        <h5>Lorem ipsum dolor sit amet</h5>
                        Dolore ex deserunt aute fugiat aute nulla ea sunt aliqua nisi cupidatat eu. Duis nulla tempor do aute et eiusmod velit exercitation nostrud quis <a href="#">proident minim</a>.
                    </div>
                </div>
                <div class="mdl-card__actions">
                    <a href="#" class="mdl-button">Read our features</a>
                </div>
            </div>
            <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="btn2">
                <i class="material-icons">more_vert</i>
            </button>
            <ul class="mdl-menu mdl-js-menu mdl-menu--bottom-right" for="btn2">
                <li class="mdl-menu__item">Lorem</li>
                <li class="mdl-menu__item" disabled>Ipsum</li>
                <li class="mdl-menu__item">Dolor</li>
            </ul>
        </section>
        -->

        <!--Another way of displaying the data but without an image-->
        <!--
        <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
            <div class="mdl-card mdl-cell mdl-cell--12-col">
                <div class="mdl-card__supporting-text">
                    <h4>Technology</h4>
                    Dolore ex deserunt aute fugiat aute nulla ea sunt aliqua nisi cupidatat eu. Nostrud in laboris labore nisi amet do dolor eu fugiat consectetur elit cillum esse. Pariatur occaecat nisi laboris tempor laboris eiusmod qui id Lorem esse commodo in. Exercitation aute dolore deserunt culpa consequat elit labore incididunt elit anim.
                </div>
                <div class="mdl-card__actions">
                    <a href="#" class="mdl-button">Read our features</a>
                </div>
            </div>
            <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="btn3">
                <i class="material-icons">more_vert</i>
            </button>
            <ul class="mdl-menu mdl-js-menu mdl-menu--bottom-right" for="btn3">
                <li class="mdl-menu__item">Lorem</li>
                <li class="mdl-menu__item" disabled>Ipsum</li>
                <li class="mdl-menu__item">Dolor</li>
            </ul>
        </section>
        -->

        <!-- Cool circle things that I don't know what I'll use them for yet either -->
        <!--
        <section class="section--footer mdl-color--white mdl-grid">
            <div class="section__circle-container mdl-cell mdl-cell--2-col mdl-cell--1-col-phone">
                <div class="section__circle-container__circle mdl-color--accent section__circle--big"></div>
            </div>
            <div class="section__text mdl-cell mdl-cell--4-col-desktop mdl-cell--6-col-tablet mdl-cell--3-col-phone">
                <h5>Lorem ipsum dolor sit amet</h5>
                Qui sint ut et qui nisi cupidatat. Reprehenderit nostrud proident officia exercitation anim et pariatur ex.
            </div>
            <div class="section__circle-container mdl-cell mdl-cell--2-col mdl-cell--1-col-phone">
                <div class="section__circle-container__circle mdl-color--accent section__circle--big"></div>
            </div>
            <div class="section__text mdl-cell mdl-cell--4-col-desktop mdl-cell--6-col-tablet mdl-cell--3-col-phone">
                <h5>Lorem ipsum dolor sit amet</h5>
                Qui sint ut et qui nisi cupidatat. Reprehenderit nostrud proident officia exercitation anim et pariatur ex.
            </div>
        </section>
    </div>
    -->


        <!--For the features tab-->
        <div class="mdl-layout__tab-panel" id="features">
            <section class="section--center mdl-grid mdl-grid--no-spacing">
                <div class="mdl-cell mdl-cell--12-col">
                    <h4>Favorites</h4>

                    <ul class="toc">
                        <a>Jack Mormon</a>
                        <a>Naked Fish</a>
                        <a>Tosh's Ramen</a>
                        <a>Eve's Bakery</a>
                        <a>Starbucks</a>
                    </ul>
                </div>
            </section>
        </div>


        <%
        Connector connector = new Connector();
        User user = new User();
        POI poi = new POI();
        int limit = 10;
        String popPOI = poi.getCostliestForEachCategory(limit, connector.stmt, connector._con);
        String[] ps = popPOI.split("\n");
        String[] pois = new String[ps.length];
        for(int i = 0; i < ps.length; i++){
            pois[i] =
        "<section class=\"section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp\">" +
        "<div class=\"mdl-card mdl-cell mdl-cell--9-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone\">" +
            "<div class=\"mdl-card__supporting-text\">" +
                "<h4>" + ps[i] + "</h4>" +
                "<b>" + ps[i] + "</b>" +
            "</div>" +
            "<div class=\"mdl-card__actions\">" +
                "<a href=\"#\" class=\"mdl-button\">Read more</a>" +
            "</div>" +
        "</div>" +
            "</section>";
        }
        %>
        <!--For the popular tab-->
        <div class="mdl-layout__tab-panel" id="popular">
            <section class="section--center mdl-grid mdl-grid--no-spacing">
                <div class="mdl-cell mdl-cell--12-col">
                    <h4>Favorites</h4>

                    <ul class="toc">
                        <a>Jack Mormon</a>
                        <a>Naked Fish</a>
                        <a>Tosh's Ramen</a>
                        <a>Eve's Bakery</a>
                        <a>Starbucks</a>
                    </ul>
                    <%
                    for(int i = 0; i < ps.length; i++){
                        out.println(pois[i]);
                    }
                    %>
                </div>
            </section>
        </div>


        <!-- Footer Information-->
        <footer class="mdl-mega-footer">
            <div class="mdl-mega-footer--middle-section">
                <div class="mdl-mega-footer--drop-down-section">
                    <input class="mdl-mega-footer--heading-checkbox" type="checkbox" checked>
                    <h1 class="mdl-mega-footer--heading">Features</h1>
                    <ul class="mdl-mega-footer--link-list">
                        <li><a href="#">About</a></li>
                        <li><a href="#">Terms</a></li>
                        <li><a href="#">Partners</a></li>
                        <li><a href="#">Updates</a></li>
                    </ul>
                </div>
                <div class="mdl-mega-footer--drop-down-section">
                    <input class="mdl-mega-footer--heading-checkbox" type="checkbox" checked>
                    <h1 class="mdl-mega-footer--heading">Details</h1>
                    <ul class="mdl-mega-footer--link-list">
                        <li><a href="#">Spec</a></li>
                        <li><a href="#">Tools</a></li>
                        <li><a href="#">Resources</a></li>
                    </ul>
                </div>
                <div class="mdl-mega-footer--drop-down-section">
                    <input class="mdl-mega-footer--heading-checkbox" type="checkbox" checked>
                    <h1 class="mdl-mega-footer--heading">Technology</h1>
                    <ul class="mdl-mega-footer--link-list">
                        <li><a href="#">How it works</a></li>
                        <li><a href="#">Patterns</a></li>
                        <li><a href="#">Usage</a></li>
                        <li><a href="#">Products</a></li>
                        <li><a href="#">Contracts</a></li>
                    </ul>
                </div>
                <div class="mdl-mega-footer--drop-down-section">
                    <input class="mdl-mega-footer--heading-checkbox" type="checkbox" checked>
                    <h1 class="mdl-mega-footer--heading">FAQ</h1>
                    <ul class="mdl-mega-footer--link-list">
                        <li><a href="#">Questions</a></li>
                        <li><a href="#">Answers</a></li>
                        <li><a href="#">Contact us</a></li>
                    </ul>
                </div>
            </div>
            <!--
            <div class="mdl-mega-footer--bottom-section">
                <div class="mdl-logo">
                    More Information
                </div>
                <ul class="mdl-mega-footer--link-list">
                    <li><a href="https://developers.google.com/web/starter-kit/">Web Starter Kit</a></li>
                    <li><a href="#">Help</a></li>
                    <li><a href="#">Privacy and Terms</a></li>
                </ul>
            </div>
            -->
        </footer>
    </main>
</div>
<a href="https://github.com/google/material-design-lite/blob/master/templates/text-only/" target="_blank" id="view-source"
   class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-color--red-900 mdl-color-text--accent-contrast">View Source</a>
<script src="https://code.getmdl.io/1.1.3/material.min.js"></script>
</body>
</html>
