<%@ page contentType="text/html;charset=UTF-8" language="java" %><%
    // sleep 3 second.
    Thread.sleep(1000);

    String url = request.getParameter("forward");
    if (url != null && !url.isEmpty()) {
        request.getRequestDispatcher(url).forward(request, response);
    } else {
        response.getWriter().write("只负责延时，不负责具体输出，请指定重定向地址。");
    }
%>