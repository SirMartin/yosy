<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<g:javascript library="jquery" plugin="jquery" />
</head>
<body>
	<div id="updateMe">
		<g:render template="../deseo/listMain" />
	</div>
	<g:formRemote name="nuevoDeseoForm" update="updateMe"
		url="[ controller: 'index', action: 'nuevoDeseo']" method="POST">
		<div id="divNuevoDeseo" style="display:none;">
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
							<g:textArea name="descripcion"
								value="${deseoInstance?.descripcion}" />
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="divBuscar" style="display:none;">
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
							<g:textArea name="descripcion"
								value="${deseoInstance?.descripcion}" />
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="buttons" style="float: left; ">
			<span style="display:none;" id="btnNuevoDeseo"><g:submitToRemote update="[success:'updateMe',failure:'divPopUp']"
				url="[ controller: 'index', action: 'nuevoDeseo']" 
				value="${message(code: 'deseo.nuevo.label', default: 'Yo deseo')}" /></span>
				<input id="btnNuevoDeseoClient" onclick="$(this).hide(); $('#divBuscar,#btnBuscar').hide(); $('#btnBuscarClient,#divNuevoDeseo,#btnNuevoDeseo').css({ 'display': 'block', 'opacity': '0' }).animate({ 'opacity': '1' }, 3000);" type="button" value="${message(code: 'deseo.nuevo.label', default: 'Yo deseo')}" id="btnDesplegableNuevoDeseo" />
<%--		<input id="btnNuevoDeseoClient" onclick="$(this).hide(); $('#divNuevoDeseo,#btnNuevoDeseo').show('blind', { direction: 'vertical' }, 1000);;" type="button" value="${message(code: 'deseo.nuevo.label', default: 'Yo deseo')}" id="btnDesplegableNuevoDeseo" />		--%>
		</div>
		<div class="buttons" style="float: right;">
			<span style="display:none;"  id="btnBuscar"><g:submitToRemote update="[success:'updateMe',failure:'divPopUp']"
				url="[ controller: 'index', action: 'nuevoDeseo']"
				value="${message(code: 'deseo.buscar.label', default: 'Yo busco')}" /></span>
				<input id="btnBuscarClient" onclick="$(this).hide(); $('#divNuevoDeseo,#btnNuevoDeseo').hide(); $('#divBuscar,#btnBuscar,#btnNuevoDeseoClient').css({ 'display': 'block', 'opacity': '0' }).animate({ 'opacity': '1' }, 3000);" type="button" value="${message(code: 'deseo.buscar.label', default: 'Yo busco')}" id="btnDesplegableBuscar" />
		</div>
	</g:formRemote>
</body>
</html>
