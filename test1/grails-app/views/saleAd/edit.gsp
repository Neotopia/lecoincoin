<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'saleAd.label', default: 'SaleAd')}" />
        <title>Modifier l'annonce</title>
    </head>
    <body>
        <a href="#edit-saleAd" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}">Accueil</a></li>
                <li><g:link class="list" action="index">Liste des annonces</g:link></li>
                <li><g:link class="create" action="create">Poster une annonce</g:link></li>
            </ul>
        </div>
        <div id="edit-saleAd" class="content scaffold-edit" role="main">
            <h1>Modifier l'annonce</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.saleAd}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.saleAd}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.saleAd}" method="PUT">
                <g:hiddenField name="version" value="${this.saleAd?.version}" />
                <fieldset class="form">
                    <div class="fieldcontain required">
                        <label for="title">Titre
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="text" name="title" value="${saleAd.title}" required="" id="title">
                    </div>
                    <div class="fieldcontain required">
                        <label for="description">Description
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="text" name="description" value="${saleAd.description}" required="" id="description">
                    </div>
                    <div class="fieldcontain required">
                        <label for="longDescription">Texte de l'annonce
                            <span class="required-indicator">*</span>
                        </label>
                        <textarea name="longDescription" id="longDescription" value="" required="" cols="35" wrap="soft">
                            ${saleAd.longDescription}
                        </textarea>
                    </div>
                    <div class="fieldcontain required">
                        <label for="price">Prix (€)
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="number decimal" name="price" value="${saleAd.price}" required="" min="0.0" id="price">
                    </div>
                    <div class="fieldcontain required">
                        <label for="author">Auteur
                            <span class="required-indicator">*</span>
                        </label>
                        <g:select from="${tpmbds.User.list()}"
                                  name="author"
                                  id="author"
                                  optionKey="id"
                                  optionValue="username">
                        </g:select>
                    </div>
                    <div class="fieldcontain">
                        <label for="price">Illustrations
                            <span class="required-indicator">*</span>
                        </label>
                        <div class="property-value" aria-labelledby="illustrations-label">
                        <ul>
                            <g:each in="${saleAd.illustrations}" var="illustration">
                                <li>
                                    <g:link controller="illustration" action="show" id="${illustration.id}">
                                        ${illustration.filename}
                                    </g:link>
                                </li>
                            </g:each>
                            <li>
                                <g:link controller="illustration" action="create">Ajouter une illustration</g:link>
                            </li>
                        </ul>
                        </div>
                    </div>

                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
