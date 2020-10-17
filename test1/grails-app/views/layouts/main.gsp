<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="canard_logo_petit.png" type="image/x-png" />

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>
<body>
    <div class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/tpmbds">
                    <asset:image src="canard_logo_petit.png" alt="LeCoinCoin Logo"/>
                        <g:link controller="user" style="margin-left: 50px;position: relative; top: 25px;">Utilisateurs</g:link>
                        <g:link controller="saleAd" style="margin-left: 20px;position: relative; top: 25px;">Annonces</g:link>
            </div>

            <div class="navbar-collapse collapse" aria-expanded="false" style="height: 0.8px;">
                <ul class="nav navbar-nav navbar-right">
                    <g:pageProperty name="page.nav" />
                </ul>
            </div>
        </div>
        <div class="dropdown" style="position: absolute;bottom: 40px;right: 100px;">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                <sec:ifNotLoggedIn>
                    Profil
                </sec:ifNotLoggedIn>
                <sec:ifLoggedIn>
                    <sec:loggedInUserInfo field="username" />
                </sec:ifLoggedIn>
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li class="controller">
                    <sec:ifNotLoggedIn>
                        <g:link controller="login" style="color: black !important;">Connexion</g:link>
                    </sec:ifNotLoggedIn>
                </li>
                <li class="controller">
                    <sec:ifLoggedIn>
                        <g:link controller="logout" style="color: black !important;">Se déconnecter</g:link>
                    </sec:ifLoggedIn>
                </li>
            </ul>
        </div>

    </div>


    <g:layoutBody/>

    <div class="footer" role="contentinfo"></div>

    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

    <asset:javascript src="application.js"/>

</body>
</html>
