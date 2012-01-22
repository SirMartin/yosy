function logoutClick() {
	$('#linkRegistro').show();
	$('#linkLogin').show();
	$('#linkLogout').hide();
	$('#linkPerfil').hide();
}
function loginClick() {
	$('#linkRegistro').hide();
	$('#linkLogin').hide();
	$('#linkLogout').show();
	$('linkPerfil').show();
}