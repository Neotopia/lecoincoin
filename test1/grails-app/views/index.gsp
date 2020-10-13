<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Lecoincoin</title>
</head>
<body>
    <content tag="nav">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Application Status <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="#">Environment: ${grails.util.Environment.current.name}</a></li>
                <li><a href="#">App profile: ${grailsApplication.config.grails?.profile}</a></li>
                <li><a href="#">App version:
                    <g:meta name="info.app.version"/></a>
                </li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Grails version:
                    <g:meta name="info.app.grailsVersion"/></a>
                </li>
                <li><a href="#">Groovy version: ${GroovySystem.getVersion()}</a></li>
                <li><a href="#">JVM version: ${System.getProperty('java.version')}</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Artefacts <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="#">Controllers: ${grailsApplication.controllerClasses.size()}</a></li>
                <li><a href="#">Domains: ${grailsApplication.domainClasses.size()}</a></li>
                <li><a href="#">Services: ${grailsApplication.serviceClasses.size()}</a></li>
                <li><a href="#">Tag Libraries: ${grailsApplication.tagLibClasses.size()}</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Installed Plugins <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
                    <li><a href="#">${plugin.name} - ${plugin.version}</a></li>
                </g:each>
            </ul>
        </li>
    </content>

    <div class="svg" role="presentation">
        <div class="grails-logo-container">
            <asset:image src="grails-cupsonly-logo-white.svg" class="grails-logo"/>
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
<<<<<<< HEAD
                <h2>Pages disponibles:</h2>
                        <g:link controller="login">Connexion </g:link> </br>
                        <g:link controller="user">Profil </g:link>

=======
                <h2>Available Controllers:</h2>
                <ul>

                    <li class="controller">
                        <g:link controller="login">Connexion</g:link>
                    </li>

                    <li class="controller">
                        <g:link controller="logout">Se déconnecter</g:link>
                    </li>

                    <li class="controller">
                        <g:link controller="user">Utilisateurs</g:link>
                    </li>

                    <li class="controller">
                        <g:link controller="saleAd">Annonces</g:link>
                    </li>

                </ul>
>>>>>>> 9552f88dd74eb70df24ec3b941968333e40f0feb
            </div>

        </section>
    </div>

</body>
</html>
