<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/fis" prefix="fis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<fis:extends name="/page/layout/2columns-with-left-sidebar.jsp">

    <c:set var="pageTitle" value="JSP widget" scope="request" />
    <c:set var="title" value="JSP widget" scope="request" />

    <fis:block name="sidebar">
        <fis:widget name="/widget/sidebarmenus/sidebarmenus.jsp" menus="${menus[2].children}" />
    </fis:block>

    <fis:block name="content">
        <p>页面中比较常用的小的部分，可以抽离成<a href="${pageContext.request.contextPath}/jsp/widget">widget</a>，比如：登陆框、头部菜单、边栏菜单等等</p>

        <p>抽离成小模板后，可以通过这样的方式引入页面的任意位置。</p>

        <div class="highlight highlight-jsp"><pre>&lt;<span class="pl-ent">fis:widget</span> <span class="pl-e">name</span>=<span class="pl-s1"><span class="pl-pds">"</span>/widget/sidebarmenus/sidebarmenus.jsp<span class="pl-pds">"</span></span> /&gt;</pre></div>

        <h2 id="局部变量">局部变量</h2>

        <p>除了模板复用外，有时候变量也需要复用，在通过 <code>fis:widget</code> 引入模板的时候，可以通过以下两种方式指定变量</p>

        <ul>
            <li><code>with</code> 将指定变量下面的所有属性做为 widget 中的局部变量使用</li>
            <li><code>其他attribute</code> 设置 widget 中局部变量</li>
        </ul>

        <div class="highlight highlight-jsp"><pre>&lt;<span class="pl-ent">fis:widget</span> <span class="pl-e">name</span>=<span class="pl-s1"><span class="pl-pds">"</span>/widget/sidebarmenus/sidebarmenus.jsp<span class="pl-pds">"</span></span> <span class="pl-e">vara</span>=<span class="pl-s1"><span class="pl-pds">"</span>test string<span class="pl-pds">"</span></span> <span class="pl-e">obja</span>=<span class="pl-s1"><span class="pl-pds">"</span><span class="pl-pse">\${</span><span class="pl-s2">reference</span><span class="pl-pse"><span class="pl-s2">}</span></span><span class="pl-pds">"</span></span> <span class="pl-e">with</span>=<span class="pl-s1"><span class="pl-pds">"</span><span class="pl-pse">\${</span><span class="pl-s2">object</span><span class="pl-pse"><span class="pl-s2">}</span></span><span class="pl-pds">"</span></span> /&gt;</pre></div>

    </fis:block>

</fis:extends>
