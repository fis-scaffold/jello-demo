<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/fis" prefix="fis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<fis:extends name="/page/layout/2columns-with-left-sidebar.jsp">

    <c:set var="pageTitle" value="JSP 数据绑定" scope="request" />
    <c:set var="title" value="JSP 数据绑定" scope="request" />

    <fis:block name="sidebar">
        <fis:widget name="/widget/sidebarmenus/sidebarmenus.jsp" menus="${menus[2].children}" />
    </fis:block>

    <fis:block name="content">

        <p>jello 前端项目，只负责模板文件的编写，不负责数据的获取，但是为了让页面能够正常预览，需要提供一种机制，让模板自动关联数据，这样只要前期制定了数据格式，前端完全是可以后端独立开发的。</p>

        <p>那么，我们其实只用关心数据格式，而不用关心数据的真实性。我们完全可以通过 json 文件指定静态数据即可。</p>

        <h2>如何指定？</h2>

        <p>page 目录下的每个模板页面都会自动绑定上 test 目录下同名的 json 数据。</p>

        <p>test/page/index.json</p>

        <div class="highlight highlight-json"><pre><span class="p">{</span>
    <span class="nt">"title"</span><span class="p">:</span> <span class="s2">"This is title."</span><span class="p">,</span>
    <span class="nt">"subtitle"</span><span class="p">:</span> <span class="s2">"This is subtitle."</span>
<span class="p">}</span>
</pre></div>

        <p>page/index.jsp</p>
        <div class="highlight highlight-velocity"><pre><span class="x">&lt;h1&gt;</span><span class="p">\${</span><span class="nv">title</span><span class="p">}</span><span class="x">&lt;/h1&gt;</span>
<span class="x">&lt;h2&gt;</span><span class="p">\${</span><span class="nv">subtitle</span><span class="p">}</span><span class="x">&lt;/h2&gt;</span>
</pre></div>

        <p>那么页面预览输出的结果是</p>

        <div class="highlight highlight-html"><pre><span class="nt">&lt;h1&gt;</span>This is title.<span class="nt">&lt;/h1&gt;</span>
<span class="nt">&lt;h2&gt;</span>This is subtitle.<span class="nt">&lt;/h2&gt;</span>
</pre></div>

        <h2>如何解决公用数据问题？</h2>
        <p>页面多了，自然有公用的数据，如果你的数据都是通过 ajax 页面获取，那还好，通过 rewrite 转发就能每次获取同样的数据，如果是模板数据，则需要每次都不听的拷贝。</p>

        <p>这样确实太麻烦了，如是，我们提供了这么一种机制。如果预览的页面地址是 /page/A/B/C.jsp, 这个文件的 json 绑定，可以是多个，顺序为： </p>

        <ul>
            <li>/test/page.json</li>
            <li>/test/page/A.json</li>
            <li>/test/page/A/B.json</li>
            <li>/test/page/A/B/C.json</li>
        </ul>

        <p>多个文件的 json 值会叠加进来。</p>

        <h2>如何动态绑定数据</h2>

        <p>json 绑定的是静态数据，如果需要绑定动态的数据，可以通过 jsp 方式绑定，绑定规则是一样的，且绑定时机在 json 绑定之后，可以针对动态数据，在 jsp 中补充。</p>

        <div class="highlight highlight-jsp"><pre><span class="pl-pse">&lt;%</span><span class="pl-s2"></span>
<span class="pl-s2">request<span class="pl-k">.</span>setAttribute(<span class="pl-s1"><span class="pl-pds">"</span>title<span class="pl-pds">"</span></span>, <span class="pl-s1"><span class="pl-pds">"</span>Welcome to jello.<span class="pl-pds">"</span></span>);</span>
<span class="pl-s2"></span><span class="pl-pse"><span class="pl-s2">%</span>&gt;</span></pre></div>



        <div class="bs-callout bs-callout-warning">
            <h4>注意</h4>
            <p>
                在 jsp 中，任何输出都是没有意义的，你可以输出，但是输出没有任何作用，只能给 context 添加数据。
            </p>
        </div>

    </fis:block>

    <fis:require name="./binding.jsp" />
</fis:extends>
