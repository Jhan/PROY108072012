<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<spring:url var="loginUrl" value="/j_spring_security_check" />
	<section id="message">
		<div class="block-border"><div class="block-content no-title dark-bg">
			<p class="mini-infos">Solo <b>usuarios registrados</b> pueden loguearse</p>
		</div></div>
	</section>
	
	<section id="login-block">
		<div class="block-border"><div class="block-content">
			<h1>Sermeden</h1>
			<div class="block-header">Acceso al Sistema</div><p class="message warning no-margin" style="">Por favor, introduzca su ususrio y contraseña</p>
				
			<form class="form with-margin" name="loginForm" id="login-form" method="post" action="${loginUrl}" >
				<input type="hidden" name="a" id="a" value="send">
				<p class="inline-small-label">
					<label for="login"><span class="big">Usuario</span></label>
					<input type="text" name="j_username" id="login" class="full-width" value="">
				</p>
				<p class="inline-small-label">
					<label for="pass"><span class="big">Contraseña</span></label>
					<input type="password" name="j_password" id="pass" class="full-width" value="">
				</p>
				
				<button type="submit" class="float-right">Entrar</button>
				<p class="input-height">
					<input type="checkbox" name="keep-logged" id="keep-logged" value="1" class="mini-switch" checked="checked" style="display: none; ">
					
					<label for="keep-logged" class="inline">Mantenerme logueado</label>
				</p>
			</form>
			
			<form class="form" id="password-recovery" method="post" action="">
				<fieldset class="grey-bg no-margin collapsed">
					<legend><a href="javascript:void(0)">Olvidó su contraseña?</a></legend>
					<p class="input-with-button">
						<label for="recovery-mail">Introduzca su dirección de correo electrónico</label>
						<input type="text" name="recovery-mail" id="recovery-mail" value="">
						<button type="button">Enviar</button>
					</p>
				</fieldset>
			</form>
		</div></div>
	</section>
	
	<!-- Combined JS load -->
	<script src="js/login.js"></script>
	<!--[if lte IE 8]><script src="js/standard.ie.js"></script><![endif]-->
	
	<!-- example login script -->
	<script>
	
		$(document).ready(function()
		{
			// We'll catch form submission to do it in AJAX, but this works also with JS disabled
			$('#login-form').submit(function(event)
			{/*
				// Stop full page load
				event.preventDefault();
				
				// Check fields
				var login = $('#login').val();
				var pass = $('#pass').val();
				
				if (!login || login.length == 0)
				{
					$('#login-block').removeBlockMessages().blockMessage('Por favor, ingrese su usuario', {type: 'warning'});
				}
				else if (!pass || pass.length == 0)
				{
					$('#login-block').removeBlockMessages().blockMessage('Por favor, ingrese su contraseña', {type: 'warning'});
				}
				else
				{
					var submitBt = $(this).find('button[type=submit]');
					submitBt.disableBt();
					
					// Target url
					var target = $(this).attr('action');
					
					if (!target || target == '')
					{
						// Page url without hash
						target = document.location.href.match(/^([^#]+)/)[1];
					}
					
					// Request
					var data = {
						a: $('#a').val(),
						login: login,
						pass: pass,
						'keep-logged': $('#keep-logged').attr('checked') ? 1 : 0
					};
					var redirect = $('#redirect');
					if (redirect.length > 0)
					{
						data.redirect = redirect.val();
					}
					
					// Start timer
					var sendTimer = new Date().getTime();
					alert(target);
					// Send
					$.ajax({
						url: target,
						dataType: 'json',
						type: 'POST',
						data: data,
						success: function(data, textStatus, XMLHttpRequest)
						{
							if (data.valid)
							{
								// Small timer to allow the 'cheking login' message to show when server is too fast
								var receiveTimer = new Date().getTime();
								if (receiveTimer-sendTimer < 500)
								{
									setTimeout(function()
									{
										document.location.href = data.redirect;
										
									}, 500-(receiveTimer-sendTimer));
								}
								else
								{
									document.location.href = data.redirect;
								}
							}
							else
							{
								// Message
								$('#login-block').removeBlockMessages().blockMessage(data.error || 'Ocurrió un error inesperado, por favor, inténtalo de nuevo', {type: 'error'});
								
								submitBt.enableBt();
							}
						},
						error: function(XMLHttpRequest, textStatus, errorThrown)
						{
							// Message
							$('#login-block').removeBlockMessages().blockMessage('Error al contacto con el servidor, por favor, inténtalo de nuevo', {type: 'error'});
							
							submitBt.enableBt();
						}
					});
					
					// Message
					$('#login-block').removeBlockMessages().blockMessage('Por favor, espere, validando inicio de sesión ...', {type: 'loading'});
				}*/
			});
		});
	
	</script>
	
	<script>
	
	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', 'UA-10643639-3']);
	  _gaq.push(['_trackPageview']);
	
	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();
	
	</script>


<ul id="notifications"></ul><div id="tips"></div>
