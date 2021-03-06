<%-- 
    Document   : index
    Created on : 14-Sep-2018, 11:19:53 PM
    Author     : william
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ca.wquintal.helios.SettingsDB"%>
<%@page import="ca.wquintal.helios.AccountDB"%>

<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/shared/import.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
	<script>
		$(document).ready(function () {
			$("#btnChangePassword").on('click',function() {
				var old = $("#old").val();
				var newp = $("#new").val();
				var conf = $("#confirmation").val();
				if(old === "") {
					$("#olddiv").addClass("has-error");
					return;
				}
				if(newp === "") {
					$("#newdiv").addClass("has-error");
					return;
				}
				if(newp !== conf) {
					$("#confdiv").addClass("has-error");
				}
				$.ajax({
					type: "POST",
					url: "/helios/api/account",
					data: "username="+old+"&password="+newp
					
				}).done(function () {
					// redirige vers index
					window.location.replace('/helios/index.jsp');
					
				}).fail(function (xhr, status,err) {
					var resp = xhr.responseText;
					$this.button('reset');
					
					if(resp === "username") {
						$('.error').text("Utilisateur invalide").fadeIn(400).delay(2000).fadeOut(400);
					} else  if(resp === "password") {
						$('.error').text("Mot de passe invalide").fadeIn(400).delay(2000).fadeOut(400);
					} else {
						alert(resp);
					}
				});
			});
			
		});
	</script>
    </head>
    
    <body>	
	<%
		// Va chercher les infos dans la session sur l'usager
		String s = (String)session.getAttribute("identity");
		Gson g = new Gson();
		AccountDB.IdentityToken t = g.fromJson(s, AccountDB.IdentityToken.class);
	%>
	
	<div class="modal fade" id="modalConfigDb" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
	  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	  <h5 class="modal-title" id="exampleModalLabel">Changer votre mot de passe</h5>
      </div>
      <div class="modal-body">
         <div class="container">
	     <div class="error"></div>
            <div class="col-md-4">              
		<div id="olddiv" class="form-group">
			<label for="password">Mot de passe actuel</label>
                        <input type="password" class="form-control" name="password" id="old">
                </div>
                <div id="pwdiv" class="form-group">
			<label for="password">Nouveau mot de passe</label>
                        <input type="password" class="form-control" name="password" id="new">
                </div>
                <div id="confdiv" class="form-group">
                        <label for="password">Confirmation</label>
                        <input type="password" class="form-control" name="password" id="confirmation">
                </div>            
            </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
        <button id="btnChangePassword" type="button" class="btn btn-primary" data-loading-text="<i class='fa fa-spin fa-spinner'></i> Validation">Appliquer</button>
      </div>
    </div>
  </div>
</div>
	
	
	
	<div class="container">
	        <h1>Hello World! Index</h1>
		<h3><%=System.getProperty("user.dir")%></h3>
	    
		<h2>L'information de l'IdentityToken</h2>
		<ul class="list-group list-group-flush">
			<li class="list-group-item">ID <%=t.getId()%></li>
			<li class="list-group-item">Role <%=t.getRole()%> </li>
			<li class="list-group-item">Key <%=t.getIdentityHash()%></li>
		</ul>
		
		<div class="row">
			<a href="/helios/account/logout.jsp" class="btn btn-primary btn-block">Déconnecter</a>
			<a class="btn btn-primary btn-block" data-toggle="modal" data-target="#modalConfigDb">Changer mot de passe</a>
			<a class="btn btn-primary btn-block">Supprimer ce compte</a>
			<a href="/helios/reset.jsp" class="btn btn-primary btn-block">Réinitialiser le site</a>
		</div>
		
	</div>
    </body>
</html>
