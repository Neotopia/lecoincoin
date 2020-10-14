<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'saleAd.label', default: 'Annonces')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-saleAd" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-saleAd" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <table class="table">
                <thread>
                    <tr>
                        <th scope="col">Titre</th>
                        <th scope="col">Description</th>
                        <th scope="col">Description longue</th>
                        <th scope="col">Prix</th>
                        <th scope="col">Illustration</th>
                        <th scope="col">Auteur</th>
                    </tr>
                </thread>
                <tbody>
                <g:each in="${saleAdList}" var="saleAd">
                    <tr>
                        <th scope="row">${saleAd.title}</th>

                    <td>
                            ${saleAd.description}
                    </td>
                        <td>
                                ${saleAd.longDescription}
                        </td>
                        <td>
                                ${saleAd.price}
                        </td>
                        <td>
                            <g:link controller="saleAd" action="show" id="${saleAd.id}">
                                <asset:image src="canard logo petit.png" height="50" width="50" absolute="true" />
                            </g:link>

                        </td>
                        <td>
                             <g:each in="${saleAd.author}" var="user">
                                  <g:link controller="user" action="show" id="${user.id}">
                                    ${user.username}
                                  </g:link>
                            </g:each></td>
                    </tr>
                </g:each>
                </tbody>
            </table>


            <div class="pagination">
                <g:paginate total="${saleAdCount ?: 0}" />
            </div>
        </div>
    </body>
</html>