<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!doctype html>
<html lang="es" class=" dark js hashchange backgroundsize boxshadow cssgradients">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title><tiles:getAsString name="title" /></title>
	<meta name="description" content="">
	<meta name="author" content="">
	<link href="<%=request.getContextPath()%>/css/login.css?files=reset,common,form,standard,special-pages" rel="stylesheet" type="text/css">
	<link rel="shortcut icon" type="image/x-icon" href="http://www.display-inline.fr/demo/constellation/template/favicon.ico">
	<link rel="icon" type="<%=request.getContextPath()%>/image/png" href="http://www.display-inline.fr/demo/constellation/template/favicon-large.png">
	
</head>
<body class="special-page login-bg dark">
	<tiles:insertAttribute name="body" />
</body>
</html>