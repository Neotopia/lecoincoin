<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Lecoincoin</title>
</head>
<body>
    <content tag="nav">

        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Profil <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li class="controller">
                    <g:link controller="login">Connexion</g:link>
                </li>
                <li class="controller">
                    <g:link controller="logout">Se déconnecter</g:link>
                </li>

            </ul>
        </li>
    </content>

    <div class="svg" role="presentation">
        <div class="grails-logo-container">
            <asset:image src="fond.jpg" class="grails-logo"/>
        </div>
    </div>

    <div id="content" role="main">
        <section class="row colset-2-its">
            <h1>Bienvenue sur Lecoincoin !</h1>

            <p>
                Lecoincoin est une société familiale qui existe depuis 1940, elle est gérée par Mr Gerard
                Lecoincoin et Mme Mathilde Lecoincoin.
                Lecoincoin est une entreprise de dépôt vente touchant à tout ce qui peut se vendre ou
                s’acheter.
            </p>

            <div id="controllers" role="navigation">

                <h2>Pages disponibles:</h2>
                <ul>

                    <li class="controller">
                        <g:link controller="user">Utilisateurs</g:link>
                    </li>

                    <li class="controller">
                        <g:link controller="saleAd">Annonces</g:link>
                    </li>

                </ul>
            </div>

        </section>
    </div>

</body>
</html>
