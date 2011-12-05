<link rel="Stylesheet" href="css/default.css" type="text/css"
	media="screen" />
<g:javascript src="DOMAlert.js"></g:javascript>
<g:if test="${hasCookies == false}">
<g:javascript>
	/*<![CDATA[*/
	
		function setCookie(c_name,value,exdays)
		{
			var exdate=new Date();
			exdate.setDate(exdate.getDate() + exdays);
			var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
			document.cookie=c_name + "=" + c_value;
		}
		
		function getCookie(c_name)
		{
			var i,x,y,ARRcookies=document.cookie.split(";");
			for (i=0;i<ARRcookies.length;i++)
			{
			  x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
			  y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
			  x=x.replace(/^\s+|\s+$/g,"");
			  if (x==c_name)
				{
				return unescape(y);
				}
			}
		}
		
		function checkEmailCookie(id)
		{
			var email=getCookie("email");
			if (email==null || email=="")
			{
				doAlert(document,id);
			}
		}
	
		function doAlert(parent,id)
		{
			var msg = new DOMAlert(
			{
				title: 'yosy.org',
				text: '<div style="padding:10px;">Es recomendable que dé datos, su correo mismamente, para mantenerle al tanto como un champ. Si así lo desea, '
					  +'introdúzcalo a continuación y clique sobre \'Aceptar\' <br><br> <input value="correo@valido.es" id="MPCorreo"/></div>',
				skin: 'default',
				width: 300,
				height: 300,
				ok: {value: true, text: 'Aceptar', onclick: showValue },
				cancel: {value: false, text: 'Cancelar', onclick: showValue }
			});
			msg.show();
		};
		
		//Se cargan mal los correos en la cookie, así que hay que montarselas asín... 
		//se convierte en la cadena sin arrobas y se guardan al final las posiciones en las que deberían estar tales arrobas
		function replaceArrobas(s)
		{
			var s2 = "";
			for (var i=0;i<s.length;i++)
			{
			  if (s.charAt(i)=='@')
			    s2 += '_'+i
			}
			return s.replace('@','')+s2+'_'+s.length;
		}
		
		function showValue(sender, value)
		{
			var email = document.getElementById('MPCorreo').value;
			sender.close();
			if(value)
			{
				setCookie("email",replaceArrobas(email),36500);
				var newMsg = new DOMAlert({skin: 'default', width: 200});
				newMsg.show("yosy.org", "<div style='padding:10px'>Gracias, de ahora en adelante le mantendremos informado en la siguiente cuenta de correo: "+email+"</div>");
			}
			
			setTimeout("location.reload(true)",1000);
		}
	/*]]>*/
</g:javascript>
</g:if>
<div class="body">
	<div class="list">
		<table>
			<thead>
				<tr>

					<g:sortableColumn property="id" title=" " />

					<g:sortableColumn property="titulo"
						title="${message(code: 'deseo.titulo.label', default: 'Titulo')}" />
					<g:cookie name="deseos" />
					<g:sortableColumn property="descripcion"
						title="${message(code: 'deseo.descripcion.label', default: 'Descripcion')}" />

					<%--							<g:sortableColumn property="fechaCreacion"--%>
					<%--								title="${message(code: 'deseo.fechaCreacion.label', default: 'Fecha Creacion')}" />--%>
					<%----%>
					<%--							<g:sortableColumn property="fechaModificacion"--%>
					<%--								title="${message(code: 'deseo.fechaModificacion.label', default: 'Fecha Modificacion')}" />--%>

				</tr>
			</thead>
			<tbody>
				<g:each in="${deseoInstanceList}" status="i" var="deseoInstance">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

						<td><span id="numVotos${deseoInstance.id}"> <g:if
									test="${hasCookies == true}">
									<g:remoteLink action="votar" id="${deseoInstance.id}"
										update="numVotos${deseoInstance.id}">VOTAR</g:remoteLink>
								</g:if> <g:else>
									<a id="enlaceVotar${deseoInstance.id}"
										onclick="checkEmailCookie();" style="cursor: pointer">VOTAR</a>
									<g:remoteLink action="votar" id="${deseoInstance.id}"
										update="numVotos${deseoInstance.id}" style="visibility:hidden"></g:remoteLink>
								</g:else>
						</span></td>
						<td>
							${fieldValue(bean: deseoInstance, field: "titulo")}
						</td>

						<td>
							${fieldValue(bean: deseoInstance, field: "descripcion")}
						</td>

						<%--								<td><g:formatDate date="${deseoInstance.fechaCreacion}" /></td>--%>
						<%----%>
						<%--								<td><g:formatDate date="${deseoInstance.fechaModificacion}" /></td>--%>


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