<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<spring:url var="loginUrl" value="/j_spring_security_check" />

<div id="divLogin" class="hidden">
	<form name="loginForm" method="post" action="${loginUrl}" class="form">
		<fieldset>
			<legend>Ingresar al sistema</legend>
			
			<div class="wrapper-block first">
				<label for="username">Usuario:
					<span class="small-label">8 caracteres
						<span>(*)</span>
					</span>
					
				</label>  
				<input type=text name="j_username" id="username" class="validate[minSize[8]]" maxlength="8"/>
			</div>
			<div class="wrapper-block">
				<label for="password">Contraseña:
					<span class="small-label">6-10 caracteres
						<span>(*)</span>
					</span>
				</label> 
				<input type="password" name="j_password" id="password" class="validate[minSize[6]]" maxlength="10"/>
			</div>
			<div class="action-block">
				<input type="submit" class="btn"/>
			</div>
			<div class="fieldset-messages">
				<ul>
					<li>(*) Campos requeridos</li>
				</ul>
			</div>
		</fieldset>

	</form>

</div>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/i18n/validationEngine.locale-es.js"></script>
<script type="text/javascript" src="js/jquery.validationEngine.js"></script>
<script type="text/javascript" src="js/jquery.limitkeypress.js"></script>
<script type="text/javascript" src="js/app/login.js"></script>