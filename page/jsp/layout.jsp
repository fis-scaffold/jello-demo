<%@ page contentType="text/html;charset=utf-8" %><%@ page import="java.util.*" %><%@ taglib uri="/fis" prefix="fis"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%

    String layout = request.getParameter("layout");
    String parent = "page/layout/2columns-with-left-sidebar.jsp";

    if (layout != null) {
        if (layout.equals("right")) {
            parent =  "page/layout/2columns-with-right-sidebar.jsp";
        } else if (layout.equals("both")) {
            parent = "page/layout/3columns.jsp";
        }
    } else {
        layout = "left";
    }

    request.setAttribute("layout", layout);
    request.setAttribute("parent", parent);
%><fis:extends name="${parent}">

    <c:set var="pageTitle" value="JSP 模板继承" scope="request" />
    <c:set var="title" value="JSP 模板继承" scope="request" />

    <fis:block name="sidebar">
        <fis:widget name="/widget/sidebarmenus/sidebarmenus.jsp" menus="${menus[2].children}" />
    </fis:block>

    <fis:block name="sidebarSecondary">
        <%--with 表示把整个对象里面的成员展开，作为局部变量。--%>
        <fis:widget name="/widget/sidebarmenus/sidebarmenus.jsp" with="${sidebar}" />
    </fis:block>

    <fis:block name="content">
        <p>模板继承思想来源于 <a href="http://www.smarty.net/inheritance">smarty</a>, 可以用来更好的复用代码。</p>

        <div class="bs-callout bs-callout-warning">
            <h4><a href="http://www.smarty.net/inheritance">Smarty 模板继承文档</a></h4>
            <p>如果之前没有接触过模板继承，请先一定要看下这个说明。</p>
        </div>


        <h2 id="示例">示例</h2>

        <div class="bs-callout bs-callout-info">
            <h4>先点击示例看效果</h4>
            <p>请切换下面这三个按钮看效果，同样的内容在不同的骨架下的效果。</p>
            <div class="btn-group">
                <a type="button" href="?layout=left" class="btn btn-info <c:if test="${layout eq 'left'}">active</c:if>">两栏布局 - 带左边栏</a>
                <a type="button" href="?layout=both" class="btn btn-info <c:if test="${layout eq 'both'}">active</c:if>">三栏布局</a>
                <a type="button" href="?layout=right" class="btn btn-info <c:if test="${layout eq 'right'}">active</c:if>">两栏布局 - 带右边栏</a>
            </div>
        </div>

        <p>没错，模板继承可以很方便的来定义具有容器功能的模板。子模板可以选择直接填充此类骨架类模板。</p>

        <h2 id="说明">说明</h2>

        <p>layout.jsp</p>

        <div class="highlight highlight-jsp"><pre>&lt;!doctype html&gt;
&lt;<span class="pl-ent">html</span>&gt;
&lt;<span class="pl-ent">head</span>&gt;
  &lt;<span class="pl-ent">meta</span> <span class="pl-e">charset</span>=<span class="pl-s1"><span class="pl-pds">"</span>utf-8<span class="pl-pds">"</span></span>&gt;
  &lt;<span class="pl-ent">title</span>&gt;&lt;<span class="pl-ent">fis:block</span> <span class="pl-e">name</span>=<span class="pl-s1"><span class="pl-pds">"</span>title<span class="pl-pds">"</span></span>&gt;My Site&lt;/<span class="pl-ent">fis:block</span>&gt;&lt;/<span class="pl-ent">title</span>&gt;

  &lt;<span class="pl-ent">fis:block</span> <span class="pl-e">name</span>=<span class="pl-s1"><span class="pl-pds">"</span>head<span class="pl-pds">"</span></span>&gt;
  &lt;<span class="pl-ent">link</span> <span class="pl-e">rel</span>=<span class="pl-s1"><span class="pl-pds">"</span>stylesheet<span class="pl-pds">"</span></span> <span class="pl-e">href</span>=<span class="pl-s1"><span class="pl-pds">"</span>main.css<span class="pl-pds">"</span></span>&gt;
  &lt;/<span class="pl-ent">fis:block</span>&gt;
&lt;/<span class="pl-ent">head</span>&gt;
&lt;<span class="pl-ent">body</span>&gt;
  &lt;<span class="pl-ent">fis:block</span> <span class="pl-e">name</span>=<span class="pl-s1"><span class="pl-pds">"</span>content<span class="pl-pds">"</span></span>&gt;&lt;/<span class="pl-ent">fis:block</span>&gt;
&lt;/<span class="pl-ent">body</span>&gt;
&lt;/<span class="pl-ent">html</span>&gt;</pre></div>

        <p>index.jsp</p>
        <div class="highlight highlight-jsp"><pre>&lt;<span class="pl-ent">fis:extends</span> <span class="pl-e">name</span>=<span class="pl-s1"><span class="pl-pds">"</span>layout.jsp<span class="pl-pds">"</span></span>&gt;
    &lt;<span class="pl-ent">fis:block</span> <span class="pl-e">name</span>=<span class="pl-s1"><span class="pl-pds">"</span>title<span class="pl-pds">"</span></span>&gt;My Page&lt;/<span class="pl-ent">fis:block</span>&gt;

    &lt;<span class="pl-ent">fis:block</span> <span class="pl-e">name</span>=<span class="pl-s1"><span class="pl-pds">"</span>head<span class="pl-pds">"</span></span>&gt;
         &lt;<span class="pl-ent">fis:parent</span> /&gt;
         &lt;<span class="pl-ent">link</span> <span class="pl-e">rel</span>=<span class="pl-s1"><span class="pl-pds">"</span>stylesheet<span class="pl-pds">"</span></span> <span class="pl-e">href</span>=<span class="pl-s1"><span class="pl-pds">"</span>custom.css<span class="pl-pds">"</span></span>&gt;
    &lt;/<span class="pl-ent">fis:block</span>&gt;

    &lt;<span class="pl-ent">fis:block</span> <span class="pl-e">name</span>=<span class="pl-s1"><span class="pl-pds">"</span>content<span class="pl-pds">"</span></span>&gt;
    &lt;<span class="pl-ent">p</span>&gt;This is just an awesome page.&lt;/<span class="pl-ent">p</span>&gt;
    &lt;/<span class="pl-ent">fis:block</span>&gt;
&lt;/<span class="pl-ent">fis:extends</span>&gt;</pre></div>

        <p>简单点描述就是，父模板挖坑，子模块填坑。特别注意下 fis:parent 的作用，就是把父模板中对应的 block 给拿过来。</p>

        <h2 id="局部变量">局部变量</h2>

        <p>请直接查看 widget 中的局部变量用法，用法一样。<a href="${pageContext.request.contextPath}/jsp/widget#局部变量">传送门</a></p>

    </fis:block>
</fis:extends>
