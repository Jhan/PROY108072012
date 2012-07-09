<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div class="row header">
	<div class="grid_2">
		<h2>
			<a href="#" class="logo">Sareq</a>
		</h2>
	</div>
	<div class="space_5 grid_5">
		<security:authorize access="isAuthenticated()">
			<security:authentication property="principal.username" />
			<!-- TODO: Update logic -->
			Eguiluz Ortiz, Manuel
			<a href="<%=request.getContextPath()%>/j_spring_security_logout">Cerrar</a>
		</security:authorize>
	</div>
</div>

<security:authorize access="isAuthenticated()">
<ul id="menu" class="nav-horizontal">
	<security:authorize access="hasRole('ROLE_PACIENTE')">
		<li>
			<a href="#">Ficha M&eacute;dica</a>
			<ul>
				<li><a href="#">Actual</a></li>
				<li><a href="#">Historial</a></li>
			</ul>
		</li>
	</security:authorize>
	<security:authorize access="hasRole('ROLE_RECEPCIONISTA')">	
	</security:authorize>
	<security:authorize access="hasRole('ROLE_TRATANTE')">
		<!-- \URL's -->
		<spring:url var="patientNewFormUrl" value="/patient?form" />
		<!-- /URL's -->
	
		<li>
			<a href="#">Historia Cl&iacute;nica</a>
			<ul>
				<li><a href="${ patientNewFormUrl }">Aperturar</a></li>
			</ul>
		</li>
		<li>
			<a href="#">Ficha M&eacute;dica</a>
			<ul>
				<li><a href="#">Registrar Ficha</a></li>
			</ul>
		</li>
	</security:authorize>
</ul>
<!-- /.nav-horizontal ## -->
</security:authorize>