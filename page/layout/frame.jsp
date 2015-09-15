<%@ page contentType="text/html;charset=utf-8" %><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@ taglib uri="/fis" prefix="fis"%><!DOCTYPE html><fis:html lang="en" framework="/static/js/require.js">
    <fis:head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>${title}<c:if test="${not empty titleAffix}">  - ${titleAffix}</c:if></title>
        <link rel="shortcut icon" type="image/x-icon" href="/static/favicon.ico" />
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <fis:require name="/static/scss/normalize.css" />
        <fis:require name="bootstrap/css/bootstrap.css" />
        <fis:require name="bootstrap/css/bootstrap-theme.css" />
        <fis:require name="/static/scss/global.scss" />
    </fis:head>

    <fis:body class="body">
        <div id="wrapper">
            <fis:block name="body"></fis:block>
        </div>
        <!--livereload-->
    </fis:body>

    <fis:script>
    // 启用 bootstrap
    require(['bootstrap']);
    </fis:script>
</fis:html>
