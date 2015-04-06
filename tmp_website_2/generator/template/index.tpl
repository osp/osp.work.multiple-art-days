<html>
    <head>
        <meta charset="UTF-8" />
        <title>Multiple Art Days</title>
        <link rel="stylesheet" href="assets/css/style3.css" type="text/css" media="all" />
        <style type="text/css">
        </style>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                'use strict';

                $("#selectFrench").click(function (e) {
                    e.preventDefault();
                    $("#entry").detach();
                    $('body').removeClass('entry');
                    selectFrench();
                });

                $("#selectEnglish").click(function (e) {
                    e.preventDefault();
                    $("#entry").detach();
                    $('body').removeClass('entry');
                    selectEnglish();
                });

                $("#toEnglish").click(function(e) {
                    e.preventDefault();
                    selectEnglish();
                });

                $("#toFrench").click(function(e) {
                    e.preventDefault();
                    selectFrench();
                });

                var selectEnglish = function () {
                    $("body").removeClass('french').addClass('english');
                }

                var selectFrench = function () {
                    $("body").removeClass('english').addClass('french');
                }

                var panelClasses = ['one', 'two', 'three', 'four'];

                $(window).scroll(function (e) {
                    if (e) {
                        e.preventDefault();
                    }

                    var body = window.document.body;
                    var totalHeight = body.scrollHeight;
                    var panelHeight = totalHeight / panelClasses.length;
                    var offset = body.scrollTop;

                    var panel = Math.round(offset / panelHeight);
                    var className = panelClasses[panel]

                    $('body').removeClass(panelClasses.join(' '));
                    $('body').addClass(className);
                });
            });
        </script>
    </head>
    <body class="entry">
        <a name="francais" />
        <div id="french">
            <a href="#english" id="toEnglish" class="languageSwitch">English</a>
            <div id="practical">
               <div class="logo">
                    <img src="assets/logos/mad.png">
                </div>
                <div class="infos">
                    {% fr/sidebar %}
                </div>
            </div>
            <div class="container">
                <div class="menu">
                    <h4><a data-scroll data-options='{ "easing": "easeOutQuad" }' href="#a-propos">About</a></h4>
                    <h4><a data-scroll data-options='{ "easing": "easeOutQuad" }' href="#exposants">Exposants</a></h4>
                    <h4><a data-scroll data-options='{ "easing": "easeOutQuad" }' href="#infos-visiteur">Infos visiteurs</a></h4>
                    <h4><a data-scroll data-options='{ "easing": "easeOutQuad" }' href="#evenements">Evénements</a></h4>
                    <h4><a data-scroll data-options='{ "easing": "easeOutQuad" }' href="#partenaires">Partenaires</a></h4>
                    <h4><a data-scroll data-options='{ "easing": "easeOutQuad" }' href="#credits">Crédits</a></h4>
                </div>
                <div class="partners">
                    <div class="partners-logos">
                        <div id="cneai">
                            <a href="http://www.cneai.com">
                            <img src="assets/logos/cneai.png"/>
                            Centre&nbsp;National<br />Edition&nbsp;Art&nbsp;Image
                            </a>
                        </div>
                        <div id="maisonrouge">
                            <a href="http://www.lamaisonrouge.org/">
                            <img src="assets/logos/maisonrouge.png"/>
                            La&nbsp;Maison&nbsp;Rouge
                            Fondation&nbsp;Antoine&nbsp;de&nbsp;Galbert
                            </a>
                        </div>
                    </div>
                </div>
                <div id="a-propos" class="introduction">
                    {% fr/introduction %}
                </div>

                <div id="exposants" class="exposants">
                    {% fr/exposants %}
                </div>

                <div id="infos-visiteur" class="infos-visiteurs">
                    {% fr/info-visiteur %}
                    <br />
                    <iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://www.openstreetmap.org/export/embed.html?bbox=2.3592281341552734%2C48.84304247480693%2C2.375664710998535%2C48.85135953006185&amp;layer=mapnik&amp;marker=48.84720117510769%2C2.3674464225769043" style="border: 1px solid black"></iframe><br/><small><a href="http://www.openstreetmap.org/?mlat=48.8472&amp;mlon=2.3674#map=16/48.8472/2.3674">View Larger Map</a></small>
                </div>

                <div id="evenements" class="evenements">
                    {% fr/evenements %}
                </div>

                <div id="partenaires" class="partenaires">
                    {% fr/partenaires %}
                </div>

                <div id="credits" class="credits">
                    {% fr/credits %}
                </div>
            </div>
        </div>
    <a name="english" />
    <div id="english">
        <a href="#francais" id="toFrench" class="languageSwitch">Fran&ccedil;ais</a>
        <div id="practical">
            <div class="logo">
                <img src="assets/logos/mad.png">
            </div>
            <h2>Multiple Art Days</h2>
            <div class="infos">
                {% en/sidebar %}
            </div>
        </div>
        <div class="container">
            <div class="menu">
                <h4><a data-scroll data-options='{ "easing": "easeOutQuad" }' href="#about">About</a></h4>
                <h4><a data-scroll data-options='{ "easing": "easeOutQuad" }' href="#exhibitors">Exhibitors</a></h4>
                <h4><a data-scroll data-options='{ "easing": "easeOutQuad" }' href="#visitor-info">Infos for visitors</a></h4>
                <h4><a data-scroll data-options='{ "easing": "easeOutQuad" }' href="#events">Events</a></h4>
                <h4><a data-scroll data-options='{ "easing": "easeOutQuad" }' href="#partners">Partners</a></h4>
                <h4><a data-scroll data-options='{ "easing": "easeOutQuad" }' href="#credits">Credits</a></h4>
            </div>
            <div class="partners">
                <div class="partners-logos">
                    <div id="cneai">
                        <a href="http://www.cneai.com">
                            <img src="assets/logos/cneai.png"/>
                            Centre&nbsp;National<br />Edition&nbsp;Art&nbsp;Image
                        </a>
                    </div>
                    <div id="maisonrouge">
                        <a href="http://www.lamaisonrouge.org/">
                            <img src="assets/logos/maisonrouge.png"/>
                            La&nbsp;Maison&nbsp;Rouge
                            Fondation&nbsp;Antoine&nbsp;de&nbsp;Galbert
                        </a>
                    </div>
                </div>
            </div>
            <div id="about" class="introduction">
                {% en/introduction %}
            </div>

            <div id="exhibitors" class="exposants">
                {% en/exhibitors %}
            </div>

            <div id="visitor-info" class="infos-visiteurs">
                {% en/visitor-info %}
                <br />
                <iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://www.openstreetmap.org/export/embed.html?bbox=2.3592281341552734%2C48.84304247480693%2C2.375664710998535%2C48.85135953006185&amp;layer=mapnik&amp;marker=48.84720117510769%2C2.3674464225769043" style="border: 1px solid black"></iframe><br/><small><a href="http://www.openstreetmap.org/?mlat=48.8472&amp;mlon=2.3674#map=16/48.8472/2.3674">View Larger Map</a></small>
            </div>

            <div id="events" class="evenements">
                {% en/events %}
            </div>

            <div id="partners" class="partenaires">
                {% en/partners %}
            </div>

            <div id="credits" class="credits">
                {% en/credits %}
            </div>
        </div>
    </div>
    <div id="entry">
        <div class="entry-container">
            <div class="logo-entry">
                <img src="assets/logos/mad.png">
            </div>
        </div>
        <div class="left">
            <a id="selectFrench" class="left" href="#francais">entrez</a>
        </div>
        <div class="right">
            <a id="selectEnglish" class="right" href="#english">enter</a>
        </div>
    </div>
    <script src='assets/js/smoothscroll.js'></script>
    <script>
        smoothScroll.init({
            speed: 1000,
            easing: 'easeInOutCubic',
            offset: 0,
            updateURL: true,
            callbackBefore: function ( toggle, anchor ) {},
            callbackAfter: function ( toggle, anchor ) {}
        });
    </script>
    </body>
</html>
