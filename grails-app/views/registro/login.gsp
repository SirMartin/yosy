<%@ page import="org.yosy.Usuario"%>
<div class="nav">
	<span class="menuButton"><g:remoteLink controller="index"
			action="vacio" update="divPopUp" class="close">
			<g:message code="default.close.label" />
		</g:remoteLink></span>
</div>
<div class="body">
	<h1>
		<g:message code="default.login.label" />
	</h1>
	<g:if test="${flash.message}">
		<div class="message"
			style="color: red; margin: 10px 0px; font-weight: bold;">
			${flash.message}
		</div>
	</g:if>
	<g:hasErrors bean="${usuarioInstance}">
		<div class="errors">
			<g:renderErrors bean="${usuarioInstance}" as="list" />
		</div>
	</g:hasErrors>
	<div>
		${message}
	</div>
	<g:formRemote url="[ controller: 'registro', action: 'login']"
		name="login" update="divPopUp">
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
						<td valign="top" class="name"><label for="password"><g:message
									code="usuario.password.label" default="Contraseña" /></label></td>
						<td valign="top"
							class="value ${hasErrors(bean: usuarioInstance, field: 'password', 'errors')}">
							<g:passwordField name="password" value="" type="password" />
						</td>
					</tr>

				</tbody>
			</table>
			<g:remoteLink controller="registro" action="index" update="divPopUp">
				¿Aún no registrado?
			</g:remoteLink>
			</td>
		</div>
		<div class="buttons">
			<span class="button"><g:submitButton name="login" class="save"
					value="${message(code: 'default.button.login.label', default: 'Login')}" /></span>
		</div>
	</g:formRemote>
</div>
