<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'saleAd.label', default: 'SaleAd')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-saleAd" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-saleAd" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
            <g:form resource="${this.saleAd}" method="POST">
                <fieldset class="form">
                   <!-- <f:all bean="saleAd"/> -->

                    <div class="fieldcontain required">
                        <label for="title">Titre
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="text" name="title" value="" required="" id="title">
                    </div>
                    <div class="fieldcontain required">
                        <label for="description">Description
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="text" name="description" value="" required="" id="description">
                    </div>
                    <div class="fieldcontain required">
                        <label for="longDescription">Texte de l'annonce
                            <span class="required-indicator">*</span>
                        </label>
                        <textarea name="longDescription" id="longDescription" value="" required="" cols="35" wrap="soft"></textarea>
                    </div>
                    <div class="fieldcontain required">
                        <label for="price">Prix (€)
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="number decimal" name="price" value="" required="" min="0.0" id="price">
                    </div>
                    <div class="fieldcontain required">
                        <label for="price">Illustration
                            <span class="required-indicator">*</span>
                        </label>
                        <g:link controller="illustration" action="create">Ajouter une illustration</g:link>
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

                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
