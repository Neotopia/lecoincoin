<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'saleAd.label', default: 'SaleAd')}" />
        <title>Détails de l'annonce</title>
    </head>
    <body>
        <a href="#show-saleAd" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}">Accueil</a></li>
                <li><g:link class="list" action="index">Liste des annonces</g:link></li>
                <li><g:link class="create" action="create">Poster une annonce</g:link></li>
            </ul>
        </div>
        <div id="show-saleAd" class="content scaffold-show" role="main">
            <h1>Détails de l'annonce</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:display bean="saleAd" />
            <g:form resource="${this.saleAd}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.saleAd}">Modifier l'annonce</g:link>
                    <input class="delete" type="submit" value="Supprimer l'annonce" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
