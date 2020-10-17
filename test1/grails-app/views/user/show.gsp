<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title>Détails de l'utilisateur</title>
    </head>
    <body>
        <a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}">Accueil</a></li>
                <li><g:link class="list" action="index">Liste des utilisateurs</g:link></li>
                <li><g:link class="create" action="create">Ajouter un utilisateur</g:link></li>
            </ul>
        </div>
        <div id="show-user" class="content scaffold-show" role="main">
            <h1>Détails de l'utilisateur</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>

           <!-- <f:display bean="user" /> -->

            <ol class="property-list user">

                <li class="fieldcontain">
                    <span id="username-label" class="property-label">Identifiant</span>
                    <div class="property-value" aria-labelledby="username-label">${user.username}</div>
                </li>

                <li class="fieldcontain">
                    <span id="passwordExpired-label" class="property-label">Mot de passe expiré</span>
                    <div class="property-value" aria-labelledby="passwordExpired-label">${user.passwordExpired}</div>
                </li>

                <li class="fieldcontain">
                    <span id="accountLocked-label" class="property-label">Compte verrouillé</span>
                    <div class="property-value" aria-labelledby="accountLocked-label">${user.accountLocked}</div>
                </li>

                <li class="fieldcontain">
                    <span id="accountExpired-label" class="property-label">Compte expiré</span>
                    <div class="property-value" aria-labelledby="accountExpired-label">${user.accountExpired}</div>
                </li>

                <li class="fieldcontain">
                    <span id="enabled-label" class="property-label">Actif</span>
                    <div class="property-value" aria-labelledby="enabled-label">${user.enabled}</div>
                </li>

                <li class="fieldcontain">
                    <span id="saleAds-label" class="property-label">Annonces</span>
                    <div class="property-value" aria-labelledby="saleAds-label">
                        <ul>
                            <g:each in="${user.saleAds}" var="saleAd">
                                <li>
                                    <g:link controller="saleAd" action="show" id="${saleAd.id}">
                                        ${saleAd.title}
                                    </g:link>
                                </li>
                            </g:each>
                        </ul>
                    </div>
                </li>

            </ol>

            <g:form resource="${this.user}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.user}">Modifier les informations</g:link>
                    <input class="delete" type="submit" value="Supprimer l'utilisateur" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
