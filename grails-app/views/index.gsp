<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        Titulo
    </title>
    <style type="text/css" media="all">
        @import url("./css/jquery.autocomplete.css");
    </style>
    <link href="./Site.css" rel="stylesheet" type="text/css" />
    <!-- Imports jQuery -->
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
    <!-- Añadir todos los datepickers para todos los idiomas que queramos -->
    <script src="http://jquery-ui.googlecode.com/svn/trunk/ui/i18n/jquery.ui.datepicker-es.js"></script>
    <!-- Imports para el autocomplete -->
    <script type="text/javascript" src="/Scripts/jquery.autocomplete.js"></script>
    <!-- Google Analytics -->
    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-23911902-1']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

    </script>
    <!-- Calendarios, calse DATEPICKER -->
    <script>
        $(document).ready(function () {
            $(".datepicker").datepicker({
                showOn: "both",
                buttonImage: "../Content/Images/calendario.png",
                buttonImageOnly: true,
                showAnim: "blind"
            });
        });
    </script>
</head>
<body>
    <div class="page" style="width: 950;">
        <div id="header">
            <div id="title" onclick="window.location='../../../../../../../../../../../../'">
                &nbsp;
            </div>
            <div id="menucontainer">
                <div class="btnGrid" onclick="window.location='../../../../../../../../../../../../Home/About/'">
                    <div class="btnTopLeft">
                        <div class="btnTopRight">
                            <div class="btnBottomLeft">
                                <div class="btnBottomRight">
                                    Que
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btnGrid" onclick="window.location='../../../../../../../../../../../../Home/About/'">
                    <div class="btnTopLeft">
                        <div class="btnTopRight">
                            <div class="btnBottomLeft">
                                <div class="btnBottomRight">
                                    Quienes
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btnGrid" onclick="window.location='../../../../../../../../../../../../Home/About/'">
                    <div class="btnTopLeft">
                        <div class="btnTopRight">
                            <div class="btnBottomLeft">
                                <div class="btnBottomRight">
                                    Patrocinador
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btnGrid" onclick="document.getElementsByTagName('body')[0].style.fontSize = '.95em'">
                    <div class="btnTopLeft">
                        <div class="btnTopRight">
                            <div class="btnBottomLeft">
                                <div class="btnBottomRight">
                                    A+
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btnGrid" style="font-size: 0.8em; margin-top: 2px;" onclick="document.getElementsByTagName('body')[0].style.fontSize = '.75em'">
                    <div class="btnTopLeft">
                        <div class="btnTopRight">
                            <div class="btnBottomLeft">
                                <div class="btnBottomRight">
                                    A
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btnGrid" style="font-size: 0.7em; margin-top: 4px;" onclick="document.getElementsByTagName('body')[0].style.fontSize = '.55em'">
                    <div class="btnTopLeft">
                        <div class="btnTopRight">
                            <div class="btnBottomLeft">
                                <div class="btnBottomRight">
                                    A-
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btnGrid">
                    Login
                </div>
            </div>
        </div>
        <div style="clear: left;">&nbsp;</div>
        <div id="main">
            <div id="left">
                <div class="leftrow" onclick="window.location='../../../../../../../../../Account/Register';">
                    Registro
                </div>
                <div class="leftrow" onclick="window.location='../../../../../../../../../../../';">
                    Noticias
                </div>
                <div class="leftrow">
                    Tienda
                </div>
                <div class="leftrow" onclick="window.location='../../../../../../../../../Activity/Donate'";>
                    Donaciones
                </div>
            </div>
            <div id="right">
                <div style="min-height: 110px;">
                  <g:render template="$template" />
                </div>
                <div id="footer">
                    <div id="bottom">
                        Copyright © 2011 YOSY Todos los derechos reservados.
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>