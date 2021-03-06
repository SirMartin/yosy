

<%@ page import="org.yosy.Deseo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'deseo.label', default: 'Deseo')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${deseoInstance}">
            <div class="errors">
                <g:renderErrors bean="${deseoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${deseoInstance?.id}" />
                <g:hiddenField name="version" value="${deseoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="comentarios"><g:message code="deseo.comentarios.label" default="Comentarios" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deseoInstance, field: 'comentarios', 'errors')}">
                                    <g:select name="comentarios" from="${org.domain.Comentario.list()}" multiple="yes" optionKey="id" size="5" value="${deseoInstance?.comentarios*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="descripcion"><g:message code="deseo.descripcion.label" default="Descripcion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deseoInstance, field: 'descripcion', 'errors')}">
                                    <g:textField name="descripcion" value="${deseoInstance?.descripcion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fechaCreacion"><g:message code="deseo.fechaCreacion.label" default="Fecha Creacion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deseoInstance, field: 'fechaCreacion', 'errors')}">
                                    <g:datePicker name="fechaCreacion" precision="day" value="${deseoInstance?.fechaCreacion}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fechaModificacion"><g:message code="deseo.fechaModificacion.label" default="Fecha Modificacion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deseoInstance, field: 'fechaModificacion', 'errors')}">
                                    <g:datePicker name="fechaModificacion" precision="day" value="${deseoInstance?.fechaModificacion}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="titulo"><g:message code="deseo.titulo.label" default="Titulo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deseoInstance, field: 'titulo', 'errors')}">
                                    <g:textField name="titulo" value="${deseoInstance?.titulo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="usuarios"><g:message code="deseo.usuarios.label" default="Usuarios" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deseoInstance, field: 'usuarios', 'errors')}">
                                    
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="votos"><g:message code="deseo.votos.label" default="Votos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deseoInstance, field: 'votos', 'errors')}">
                                    <g:select name="votos" from="${org.domain.Voto.list()}" multiple="yes" optionKey="id" size="5" value="${deseoInstance?.votos*.id}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
