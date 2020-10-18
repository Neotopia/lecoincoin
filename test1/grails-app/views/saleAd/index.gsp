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
                <li><a class="home" href="${createLink(uri: '/')}">Accueil</a></li>
                <li><g:link class="create" action="create">Poster une annonce</g:link></li>
            </ul>
        </div>
        <div id="list-saleAd" class="content scaffold-list" role="main">
            <h1>Liste des annonces</h1>
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

                        <th scope="row">
                            <g:link controller="saleAd" action="show" id="${saleAd.id}">${saleAd.title}</g:link>
                        </th>

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
                            <g:each in = "${saleAd.illustrations}" var="illustration">
                                <img src="${resource(dir:'saleAdImages', file: illustration.id + '.png')}" width="70px" height="70px" style="object-fit: cover">
                            </g:each>

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