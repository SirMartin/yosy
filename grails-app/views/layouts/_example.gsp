<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Inicio</title>
<g:javascript library="jquery" plugin="jquery" />
</head>
<body>
	<g:formRemote name="myForm" update="updateMe"
		url="[ controller: 'index', action: 'nuevoDeseo']" method="POST">
		<div class="dialog">
			<table>
				<tbody>

					<tr class="prop">
						<td valign="top" class="name"><label for="titulo"><g:message
									code="deseo.titulo.label" default="Titulo" /></label></td>
						<td valign="top"
							class="value ${hasErrors(bean: deseoInstance, field: 'titulo', 'errors')}">
							<g:textField name="titulo" value="${deseoInstance?.titulo}" />
						</td>
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><label for="descripcion"><g:message
									code="deseo.descripcion.label" default="Descripcion" /></label></td>
						<td valign="top"
							class="value ${hasErrors(bean: deseoInstance, field: 'descripcion', 'errors')}">
							<g:textField name="descripcion"
								value="${deseoInstance?.descripcion}" />
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="buttons">
			<g:submitToRemote update="[success:'updateMe',failure:'divPopUp']"
				url="[ controller: 'index', action: 'nuevoDeseo']"
				value="Nuevo deseo" />
		</div>
	</g:formRemote>
	<div id="updateMe">
		<g:render template="../deseo/listMain" />
	</div>
</body>
</html>
