<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title>Liste des utilisateurs</title>
</head>
<body>
<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}">Accueil</a></li>
        <li><g:link class="create" action="create">Ajouter un utilisateur</g:link></li>
    </ul>
</div>
<div id="list-user" class="content scaffold-list" role="main">
    <h1>Liste des utilisateurs</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <table class="table">
        <thread>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Username</th>
                <th scope="col">SaleAds</th>
            </tr>
        </thread>
        <tbody>
        <g:each in="${userList}" var="user">
            <tr>
                <th scope="row">${user.id}</th>
                    <td>
                        <g:link controller="user" action="show" id="${user.id}">
                            ${user.username}
                        </g:link>
                    </td>
                    <td>
                        <g:each in="${user.saleAds}" var="saleAd">
                            <g:link controller="saleAd" action="show" id="${saleAd.id}">
                                ${saleAd.title}
                            </g:link>
                        </g:each></td>
            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${userCount ?: 0}"/>
    </div>
</div>
</body>

</html>