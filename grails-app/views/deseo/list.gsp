
<%@ page import="org.yosy.Deseo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'deseo.label', default: 'Deseo')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'deseo.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="descripcion" title="${message(code: 'deseo.descripcion.label', default: 'Descripcion')}" />
                        
                            <g:sortableColumn property="fechaCreacion" title="${message(code: 'deseo.fechaCreacion.label', default: 'Fecha Creacion')}" />
                        
                            <g:sortableColumn property="fechaModificacion" title="${message(code: 'deseo.fechaModificacion.label', default: 'Fecha Modificacion')}" />
                        
                            <g:sortableColumn property="titulo" title="${message(code: 'deseo.titulo.label', default: 'Titulo')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${deseoInstanceList}" status="i" var="deseoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${deseoInstance.id}">${fieldValue(bean: deseoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: deseoInstance, field: "descripcion")}</td>
                        
                            <td><g:formatDate date="${deseoInstance.fechaCreacion}" /></td>
                        
                            <td><g:formatDate date="${deseoInstance.fechaModificacion}" /></td>
                        
                            <td>${fieldValue(bean: deseoInstance, field: "titulo")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${deseoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
