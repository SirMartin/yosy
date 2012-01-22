var Ajax;
if (Ajax && (Ajax != null)) {
	Ajax.Responders.register({
	  onCreate: function() {
        if($('spinner') && Ajax.activeRequestCount>0)
          Effect.Appear('spinner',{duration:0.5,queue:'end'});
	  },
	  onComplete: function() {
        if($('spinner') && Ajax.activeRequestCount==0)
          Effect.Fade('spinner',{duration:0.5,queue:'end'});
	  }
	});
}

function logoutClick() {
	$('#linkRegistro').show();
	$('#linkLogin').show();
	$('#linkLogout').hide();
}
function loginClick() {
	$('#linkRegistro').hide();
	$('#linkLogin').hide();
	$('#linkLogout').show();
}
$(document).ready(function(){logoutClick();});
