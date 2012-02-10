<!DOCTYPE html>
<html>
<head>
<title><g:layoutTitle default="YOSY | Asociación sin ánimo de lucro en pos de la inclusión social" /></title>
<link
	href='http://fonts.googleapis.com/css?family=Ribeye+Marrow&subset=latin,latin-ext'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
<link rel="shortcut icon"
	href="http://www.yosy.org/wp-content/uploads/2012/01/ico2.ico"
	type="image/x-icon" />
<g:layoutHead />
<g:javascript library="application" />
<g:javascript library="jquery.approach" />
<g:javascript library="jquery-ui-1.8.17.custom.min" />
</head>
<body>
	<div id="spinner" class="spinner" style="display: none;">
		<img src="${resource(dir:'images',file:'spinner.gif')}"
			alt="${message(code:'spinner.alt',default:'Loading...')}" />
	</div>
	<div id="center">
		<div id="imageTitle" onclick="window.location='http://www.yosy.org/';">
			<img src="http://www.yosy.org/wp-content/uploads/2012/01/yosy.png"
				alt="Dezy" border="0" />
		</div>
		<span style="font-size: 80px; color: #F17A0A">DEZY</span>
	<g:layoutBody />
	</div>
</body>
</html>