<%@ page contentType="text/html;charset=utf-8" %><%@ taglib uri="/fis" prefix="fis"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${not empty menus}">
    <div class="jello-toc">
        <ul class="nav" role="menu">
            <c:forEach var="menu" items="${menus}">
                <li <c:if test="${not empty menu.active}">class="active"</c:if>>
                    <a href="${pageContext.request.contextPath}${menu.href}">${menu.label}</a>
                </li>
            </c:forEach>
        </ul>
    </div>

    <fis:script>
    require(['./sidebarmenus']);
    </fis:script>
</c:if>

