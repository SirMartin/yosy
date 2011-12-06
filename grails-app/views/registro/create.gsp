

<%@ page import="org.yosy.Usuario"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'usuario.label', default: 'Usuario')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<div class="nav">
		<span class="menuButton"><a class="home"
			href="${createLink(uri: '/')}"><g:message
					code="default.home.label" /></a></span> <span class="menuButton"><g:link
				class="list" action="list">
				<g:message code="default.list.label" args="[entityName]" />
			</g:link></span>
	</div>
	<div class="body">
		<h1>
			<g:message code="default.create.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${usuarioInstance}">
			<div class="errors">
				<g:renderErrors bean="${usuarioInstance}" as="list" />
			</div>
		</g:hasErrors>
		<g:form action="save">
			<div class="dialog">
				<table>
					<tbody>

						<tr class="prop">
							<td valign="top" class="name"><label for="email"><g:message
										code="usuario.email.label" default="Email" /></label></td>
							<td valign="top"
								class="value ${hasErrors(bean: usuarioInstance, field: 'email', 'errors')}">
								<g:textField name="email" value="${usuarioInstance?.email}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="nombre"><g:message
										code="usuario.nombre.label" default="Nombre" /></label></td>
							<td valign="top"
								class="value ${hasErrors(bean: usuarioInstance, field: 'nombre', 'errors')}">
								<g:textField name="nombre" value="${usuarioInstance?.nombre}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="password"><g:message
										code="usuario.password.label" default="Contraseña" /></label></td>
							<td valign="top"
								class="value ${hasErrors(bean: usuarioInstance, field: 'password', 'errors')}">
								<g:passwordField name="password"
									value="" type="password" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label>Repetir
									Contraseña<g:message default="Repetir Contraseña" />
							</label></td>
							<td valign="top" class="value"><g:passwordField
									name="passwordRepeat" value="" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label>Tipo de Usuario
									<g:message default="Tipo de Usuario" />
							</label></td>
							<td valign="top" class="value"><g:select name="tipoUsuario"
									id="tipoUsuario" from="${org.yosy.TipoUsuario.listRegistro()}" optionKey="tipoUsuarioId"
									value="${fieldValue(bean: usuarioInstance, field: 'tipoUsuario')}"
									 /></td>
						</tr>

					</tbody>
				</table>
			</div>
			<div class="buttons">
				<span class="button"><g:submitButton name="create"
						class="save"
						value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
			</div>
		</g:form>
	</div>
</body>
</html>
