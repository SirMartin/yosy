<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title><g:message code="default.title.label" /></title>
<g:setProvider library="jquery" />
<script type="text/javascript" src="application.js" />
<g:javascript>
	/*<![CDATA[*/
	alert('asdf');
	/*]]>*/
</g:javascript>
</head>
<body>
	<div style="margin-top:20px">
		<div id="main">
			<table id="divSession">
				<tr>
					<td id="linkRegistro"><g:remoteLink controller="registro"
							update="divPopUp">
							<g:message code="default.register.label" />
						</g:remoteLink></td>
					<td id="linkLogin"><g:remoteLink controller="registro"
							action="login" update="divPopUp">
							<g:message code="default.login.label" />
						</g:remoteLink></td>
					<td id="linkLogout"><g:remoteLink controller="registro"
							action="logout" after="logoutClick()">
							<g:message code="default.logout.label" />
						</g:remoteLink></td>
					<td id="linkPerfil"><g:link controller="perfil"
							action="indexPerfil">
							<g:message code="default.perfil.label" />
						</g:link></td>
				</tr>
			</table>
			<g:render template="$template" />
			<div id="divPopUpB"
				style="visibility: hidden; background-color: grey; min-height: 100%; min-width: 100%; position: fixed; top: 0pt; opacity: 0.4;">
			</div>
			<div id="divPopUp"
				style="left: 40%; position: absolute; background-color: white; top: 30%;">
			</div>
		</div>
	</div>
</body>

</html>