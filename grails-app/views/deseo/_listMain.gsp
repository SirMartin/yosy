<link rel="Stylesheet" href="css/default.css" type="text/css"
	media="screen" />
<g:javascript src="DOMAlert.js"></g:javascript>
<div>
	<div class="list">
		<table>
			<thead>
				<tr>
					<th class="invisible">
					</th>
					<g:sortableColumn property="titulo"
						title="${message(code: 'deseo.titulo.label', default: 'Titulo')}" />
					<g:sortableColumn property="descripcion"
						title="${message(code: 'deseo.descripcion.label', default: 'Descripcion')}" />

				</tr>
			</thead>
			<tbody>
				<g:each in="${deseoInstanceList}" status="i" var="deseoInstance">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
						<td><span id="numVotos${deseoInstance.id}"> <g:remoteLink
									action="votar" id="${deseoInstance.id}"
									update="numVotos${deseoInstance.id}" onFailure=" jQuery('#divPopUp').fadeOut('slow'); jQuery('#divPopUp').html('logueate anda'); jQuery('#divPopUp').fadeIn('slow');">VOTAR</g:remoteLink>
						</span></td>
						<td>
							${fieldValue(bean: deseoInstance, field: "titulo")}
						</td>

						<td>
							${fieldValue(bean: deseoInstance, field: "descripcion")}
						</td>
					</tr>
				</g:each>
			</tbody>
		</table>
		<div id="remoteLink"></div>
	</div>
	<div class="paginateButtons">
		<g:paginate total="${deseoInstanceTotal}" />
	</div>
</div>