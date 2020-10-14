<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-user" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.user}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.user}" method="POST">
                <fieldset class="form">
                    <div class="fieldcontain required">
                        <label>Rôle de l'utilisateur</label>
                        <g:select from ="${tpmbds.Role.list()}"
                            name="role"
                            optionKey="id" optionValue="authority"/>
                    </div>
                    <div class="fieldcontain required">
                        <label for="username">Identifiant
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="text" name="username" value="" required="" id="username">
                    </div>
                    <div class="fieldcontain required">
                        <label for="password">Mot de passe
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="password" name="password" required="" value="" id="password">
                    </div>

                    <div class="fieldcontain">
                        <label for="passwordExpired">Mot de passe expiré</label><input type="hidden" name="_passwordExpired">
                        <input type="checkbox" name="passwordExpired" id="passwordExpired">
                    </div>

                    <div class="fieldcontain">
                        <label for="accountLocked">Compte verrouillé</label><input type="hidden" name="_accountLocked">
                        <input type="checkbox" name="accountLocked" id="accountLocked">
                    </div>

                    <div class="fieldcontain">
                        <label for="accountExpired">Compte expiré</label><input type="hidden" name="_accountExpired">
                        <input type="checkbox" name="accountExpired" id="accountExpired">
                    </div>

                    <div class="fieldcontain">
                        <label for="enabled">Actif</label>
                        <input type="hidden" name="_enabled"><input type="checkbox" name="enabled" checked="checked" id="enabled">
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
