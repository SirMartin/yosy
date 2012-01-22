
<div class="body">
	<div class="list">
		<table>
			<thead>
				<tr>

					<g:sortableColumn property="titulo"
						title="${message(code: 'deseo.titulo.label', default: 'Titulo')}" />
					<g:cookie name="deseos" />
					<g:sortableColumn property="descripcion"
						title="${message(code: 'deseo.descripcion.label', default: 'Descripcion')}" />

				</tr>
			</thead>
			<tbody>
				<g:each in="${deseosVotados}" status="i" var="deseoInstance">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
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
		<table>
			<thead>
				<tr>

					<g:sortableColumn property="titulo"
						title="${message(code: 'deseo.titulo.label', default: 'Titulo')}" />
					<g:cookie name="deseos" />
					<g:sortableColumn property="descripcion"
						title="${message(code: 'deseo.descripcion.label', default: 'Descripcion')}" />

				</tr>
			</thead>
			<tbody>
				<g:each in="${deseosCreados}" status="i" var="deseoInstance">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
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
	</div>
</div>
