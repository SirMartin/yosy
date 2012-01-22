<%@ page import="org.yosy.Usuario"%>
<g:set var="entityName"
	value="${message(code: 'usuario.label', default: 'Usuario')}" />

<div class="nav">
	<span class="menuButton"><g:remoteLink controller="index" action="vacio" update="divPopUp" class="close"
		><g:message
				code="default.close.label" /></g:remoteLink></span>
</div>
<div class="body">
	<h1>
		<g:message code="default.register.label" />
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
	<g:formRemote url="[ controller: 'registro', action: 'save']"
		name="save" update="divPopUp">
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
							<g:passwordField name="password" value="" type="password" />
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
						<td valign="top" class="name"><label for="tipoUsuario"><g:message
									code="usuario.tipoUsuario.label" default="Tipo Usuario" /></label></td>
						<td valign="top"
							class="value ${hasErrors(bean: usuarioInstance, field: 'tipoUsuario', 'errors')}">
							<g:select name="tipoUsuario"
								from="${org.yosy.TipoUsuario?.listRegistro()}"
								keys="${org.yosy.TipoUsuario?.listRegistro()*.name()}"
								value="${usuarioInstance?.tipoUsuario?.name()}" />
						</td>
					</tr>

				</tbody>
			</table>
		</div>
		<div class="buttons">
			<span class="button"><g:submitButton name="register"
					class="save"
					value="${message(code: 'default.button.register.label', default: 'Register')}" /></span>
		</div>
	</g:formRemote>
</div>