<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/fis" prefix="fis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<fis:extends name="/page/layout/2columns-with-left-sidebar.jsp">

    <c:set var="pageTitle" value="JSP 语法说明" scope="request" />
    <c:set var="title" value="JSP 语法说明" scope="request" />

    <fis:block name="sidebar">
        <fis:widget name="/widget/sidebarmenus/sidebarmenus.jsp" menus="${menus[2].children}" />
    </fis:block>

    <fis:block name="content">
        <p>新版的 Jello 已经完全采用 jsp 作为模板来开发。完全兼容之前<a href="https://github.com/fouber/fis-java-jsp">云龙老大开发的 jsp 版本</a>。</p>

        <p>请先阅读 <a href="${pageContext.request.contextPath}/doc/standard">jello 中目录规范</a>，虽然文中的提及的模板是velocity，但是同时适用与 jsp</p>

        jello 为了打通前后端，采用 jsp tag 的方式扩充了自定义的标签，使用前，请先在头部加入。

        <div class="highlight highlight-jsp"><pre>&lt;%@ <span class="pl-k">taglib</span> <span class="pl-e">uri</span>=<span class="pl-s1"><span class="pl-pds">"</span>/fis<span class="pl-pds">"</span></span> <span class="pl-e">prefix</span>=<span class="pl-s1"><span class="pl-pds">"</span>fis<span class="pl-pds">"</span></span>%&gt;</pre></div>

        <div class="bs-callout bs-callout-warning">
            <h4>注意</h4>
            <p>虽然这里 <code>prefix</code> 值可以修改，但是千万别改，因为还有一系列编译工具，只识别 fis 打头的便签。 </p>
        </div>

        <h2>扩展标签</h2>

        <h3>fis:require</h3>
        <p>用来引入资源，不管是 JS 资源还是 CSS 资源，都统一通过 &lt;<span class="pl-ent">fis:require</span> <span class="pl-e">id</span>=<span class="pl-s1"><span class="pl-pds">"</span>xxxx<span class="pl-pds">"</span></span> /&gt; 引入。</p>

        <div class="highlight highlight-jsp"><pre><span class="pl-c">&lt;%-- 引入 js --%&gt;</span>
&lt;<span class="pl-ent">fis:require</span> <span class="pl-e">id</span>=<span class="pl-s1"><span class="pl-pds">"</span>/static/js/dialog.js<span class="pl-pds">"</span></span> /&gt;

<span class="pl-c">&lt;%-- 引入 css --%&gt;</span>
&lt;<span class="pl-ent">fis:require</span> <span class="pl-e">id</span>=<span class="pl-s1"><span class="pl-pds">"</span>./dialog.css<span class="pl-pds">"</span></span> /&gt;

<span class="pl-c">&lt;%-- 引入 jsp 目录是把目标 jsp 所有依赖的 js 和 css 都引入。 --%&gt;</span>
&lt;<span class="pl-ent">fis:require</span> <span class="pl-e">id</span>=<span class="pl-s1"><span class="pl-pds">"</span>/page/index.jsp<span class="pl-pds">"</span></span> /&gt;</pre></div>

        <p>路径说明：如果是本项目内的资源，请使用绝对路径或者相对路径。如果是跨项目引用。请使用 fis 资源 id。</p>

        <div class="bs-callout bs-callout-info">
    <h4>FIS 资源 </h4>
    <p>
        FIS 资源 ID 写法是  [namespace:]文件绝对路径。当项目设置了 <code>namespace</code> 的时候：<code>common:static/js/jquery.js</code>、当项目没有设置 <code>namespace</code> 的时候：<code>static/js/query.js</code>
    </p>
    <p>为什么要用 <code>FIS 资源 ID</code> 因为，我们的静态资源很可能是部署在 CDN 上 或者 文件名加了 md5 截，所以我们需要用 <code>FIS 资源 ID</code>标识资源，这样我们可以通过查找 jello release 出来的 map.json 表，查找出最终的存放路径。</p>
</div>

    <p>除了单纯的引入资源之外，有时候，需要控制资源是否在低版本的 IE 中加载。如何控制？请参考以下代码。</p>

    <div class="highlight highlight-jsp"><pre>&lt;<span class="pl-ent">fis:require</span> <span class="pl-e">id</span>=<span class="pl-s1"><span class="pl-pds">"</span>/static/scss/ie.scss<span class="pl-pds">"</span></span> <span class="pl-e">prefix</span>=<span class="pl-s1"><span class="pl-pds">"</span>&lt;!--[if lt IE 8]&gt;<span class="pl-pds">"</span></span> <span class="pl-e">affix</span>=<span class="pl-s1"><span class="pl-pds">"</span>&lt;![endif]--&gt;<span class="pl-pds">"</span></span> /&gt;</pre></div>

    <h3>fis:script &amp; fis:style</h3>
    <p>引入 js 或者 css, 通过它组织的 js 和 css 可以自动完成性能优化。</p>

    <div class="highlight highlight-jsp"><pre><span class="pl-c">&lt;%-- 内联 js --%&gt;</span>
&lt;<span class="pl-ent">fis:script</span>&gt;
console.log('hello world');
&lt;/<span class="pl-ent">fis:script</span>&gt;

<span class="pl-c">&lt;%-- 等价与 fis:require --%&gt;</span>
&lt;<span class="pl-ent">fis:script</span> <span class="pl-e">src</span>=<span class="pl-s1"><span class="pl-pds">"</span>/static/lib/dialog.js<span class="pl-pds">"</span></span>&gt;&lt;/<span class="pl-ent">fis:script</span>&gt;

<span class="pl-c">&lt;%-- 引入外部资源 --%&gt;</span>
&lt;<span class="pl-ent">fis:script</span> <span class="pl-e">src</span>=<span class="pl-s1"><span class="pl-pds">"</span>//code.jquery.com/jquery-1.11.0.min.js<span class="pl-pds">"</span></span>&gt;&lt;/<span class="pl-ent">fis:script</span>&gt;

<span class="pl-c">&lt;%-- 内联 js --%&gt;</span>
&lt;<span class="pl-ent">fis:style</span>&gt;
.body {
}
&lt;/<span class="pl-ent">fis:style</span>&gt;

<span class="pl-c">&lt;%-- 等价与 fis:require --%&gt;</span>
&lt;<span class="pl-ent">fis:style</span> <span class="pl-e">href</span>=<span class="pl-s1"><span class="pl-pds">"</span>/static/lib/dialog.css<span class="pl-pds">"</span></span>&gt;&lt;/<span class="pl-ent">fis:style</span>&gt;

<span class="pl-c">&lt;%-- 引入外部资源 --%&gt;</span>
&lt;<span class="pl-ent">fis:style</span> <span class="pl-e">href</span>=<span class="pl-s1"><span class="pl-pds">"</span>//domain.com/xxx.scss<span class="pl-pds">"</span></span>&gt;&lt;/<span class="pl-ent">fis:style</span>&gt;</pre></div>


    <h3>fis:html</h3>
    <p>用它来代替 html 标签。可以设置任意属性，设置的属性，将会作用 html 标签。</p>

    <p>framework 属性，用来指定前端框架。</p>

    <div class="highlight highlight-jsp"><pre>&lt;<span class="pl-ent">fis:html</span> <span class="pl-e">framework</span>=<span class="pl-s1"><span class="pl-pds">"</span>/static/js/mod.js<span class="pl-pds">"</span></span> <span class="pl-e">class</span>=<span class="pl-s1"><span class="pl-pds">"</span>page-hello-world<span class="pl-pds">"</span></span>&gt;

&lt;/<span class="pl-ent">fis:html</span>&gt;</pre></div>

    <h3>fis:head &amp; fis:body</h3>
    <p>用来代替 head 和 body 标签的。作用其实很简单。fis:head 在 head 的底部插入了。&lt;!--FIS_STYLE_PLACEHOLDER--&gt;, 而 fis:body 给 body 底部插入了 &lt;!--FIS_FRAMEWORK_PLACEHOLDER--&gt; &lt;!--FIS_FRAMEWORK_CONFIG--&gt; &lt;!--FIS_SCRIPT_PLACEHOLDER--&gt;</p>

    <p>也就是说，如果你自己来控制在对应的位置插入这些标签，你是可以不用写 fis:head 和 fis:body 标签的。</p>

    <h3>fis:uri</h3>
    把 FIS 资源 ID 转化成实际路径，可以跨模块。与 fis:uri 的区别是，这个只会简单的输出路径，而不会引入此文件。

    <div class="highlight highlight-jsp"><pre>&lt;<span class="pl-ent">fis:uri</span> <span class="pl-e">name</span>=<span class="pl-s1"><span class="pl-pds">"</span>ns:static/xxxx/xxx.js<span class="pl-pds">"</span></span> /&gt;</pre></div>

    <h3>fis:widget</h3>
<p>引入一个模板碎片文件，支持指定局部变量。更多信息请查看此处<a href="${pageContext.request.contextPath}/jsp/widget">说明</a>。</p>

<h3>fis:extends &amp; fis:block &amp; fis:parent</h3>

<p>请查看<a href="${pageContext.request.contextPath}/jsp/layout">模板继承说明</a>。</p>

    </fis:block>

</fis:extends>
