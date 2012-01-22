<script type="text/javascript">
	if ("${actionN}"!="logout" && "${actionN}"!="save")
		{
			$("#linkRegistro").hide();
			$("#linkLogin").hide();
			$("#linkLogout").show();
			$("#linkPerfil").show();
		}
	else
		{
			$("#linkRegistro").show();
			$("#linkLogin").show();
			$("#linkLogout").hide();
			$("#linkPerfil").hide();
		}
</script>