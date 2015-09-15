<%@ page contentType="text/html;charset=utf-8" %><%@ taglib uri="/fis" prefix="fis"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${not empty menus}">
    <!-- Fixed navbar -->
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <a class="navbar-brand<c:if test="${currentUrl == '/'}"> active</c:if>" href="${pageContext.request.contextPath}/">Jello Demo</a>

            <ul class="nav navbar-nav" role="menu">
                <c:forEach var="menu" items="${menus}">
                    <c:choose>
                        <c:when test="${not empty menu.children}">
                        <li class="dropdown <c:if test="${not empty menu.active}"> active</c:if>">
                            <a href="${pageContext.request.contextPath}${menu.href}" class="dropdown-toggle" data-toggle="dropdown" href="#">${menu.label} <span class="caret"></span></a>

                            <ul class="dropdown-menu" role="menu">
                            <c:forEach var="menu" items="${menu.children}">
                                <li <c:if test="${not empty menu.active}">class="active"</c:if>>
                                    <a href="${pageContext.request.contextPath}${menu.href}">${menu.label}</a>
                                </li>
                            </c:forEach>
                            </ul>
                        </li>
                        </c:when>

                        <c:otherwise>
                        <li <c:if test="${not empty menu.active}">class="active"</c:if>>
                            <a href="${pageContext.request.contextPath}${menu.href}">${menu.label}</a>
                        </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ul>
        </div>
    </div>
</c:if>
