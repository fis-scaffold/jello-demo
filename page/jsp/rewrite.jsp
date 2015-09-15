<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/fis" prefix="fis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<fis:extends name="/page/layout/2columns-with-left-sidebar.jsp">

    <c:set var="pageTitle" value="JSP 页面模拟" scope="request" />
    <c:set var="title" value="JSP 页面模拟" scope="request" />

    <fis:block name="sidebar">
        <fis:widget name="/widget/sidebarmenus/sidebarmenus.jsp" menus="${menus[2].children}" />
    </fis:block>

    <fis:block name="content">
        <p>在 page 目录下面的所有 jsp 模板文件，只会有两类，一种是骨架模板，而另一种是入口模板。在 jello 环境下，所有入口模板都是可以直接预览的。他的预览规则为 <code>/page/{{jsp 路径}}</code>。</p>

        <p>比如： page 目录下面的 index.jsp 文件，则可以通过 <code>/page/index</code>(.jsp 可以省略)路径预览。</p>

        <div class="bs-callout bs-callout-warning">
            <h4>namespace 项目</h4>
            <p>如果当前项目设置了 <code>namespace</code>，则预览地址得加上 <code>namespace</code> 作为前缀。</p>
            <p>假如 <code>namespace</code> 为 <code>home</code>，预览地址则为：<code>/home/page/index</code></p>
        </div>

        <h2>页面转发</h2>
        <p class="text-warning">这里有个限制就是路径总是以 <code>/page</code> 打头, 且模板路径必须与访问路径一致。这肯定是不能接受的。</p>

        <p>针对这个问题，我们的解决方法是，提供<code>rewrite</code> 机制。</p>

        <p>在根目录下面新建一个 <code>server.conf</code> 文件，通过配置此文件来实现页面跳转。</p>

        <div class="highlight highlight-conf"><pre><span class="c"># 首页</span><span class="w"></span>
    rewrite<span class="w"> </span>\/$<span class="w"> </span>/page/index<span class="w"></span>

    <span class="c">#用户查看页面</span><span class="w"></span>
    rewrite<span class="w"> </span>\/user/view/(\d*)$<span class="w"> </span>/page/user/view?id=$1<span class="w"></span>

    <span class="c"># home 页面跳转首页</span><span class="w"></span>
    redirect<span class="w"> </span>\/home$<span class="w"> </span>/page/index<span class="w"></span>
    </pre></div>

        <p>server.conf 中支持两种指令。</p>
        <ul>
            <li><code>rewrite</code> 页面跳转，但是不改变浏览器地址</li>
            <li><code>redirect</code> 页面跳转，同时改变浏览器地址</li>
        </ul>

        <p>语法说明</p>
        <p>{{指定}} {{匹配正则}} {{目标地址}}</p>
        <p>server.conf 中，不是 <code>rewrite</code> 或者 <code>redirect</code> 打头的都被认为是注释。目标地址支持 $数字 来替换捕获结果。</p>

        <h2>jsp 页面转发</h2>

        <p>在 test 目录下面的 .jsp 文件，也是可以在直接在 jello 环境下预览的，如 test 目录下面的 file.jsp 文件可以通过 <code>/test/file.jsp</code> 路径预览。</p>

        <p>如果再配合<code>rewrite</code>, 在 jello 环境下就可以模拟任何后端输出。</p>

        <div class="highlight highlight-conf"><pre>rewrite<span class="w"> </span>\/testpage$<span class="w"> </span>/test/mock.jsp<span class="w"></span>
</pre></div>

        <div class="highlight highlight-jsp"><pre><span class="k">&lt;%@</span> <span class="n">page</span> <span class="n">contentType</span><span class="o">=</span><span class="s">"text/html;charset=UTF-8"</span> <span class="n">language</span><span class="o">=</span><span class="s">"java"</span> <span class="k">%&gt;</span>
<span class="k">&lt;%</span>
    <span class="n">response</span><span class="o">.</span><span class="na">getWriter</span><span class="o">().</span><span class="na">write</span><span class="o">(</span><span class="s">"hello world"</span><span class="o">);</span>
<span class="k">%&gt;</span>
</pre></div>

        <p><a href="${pageContext.request.contextPath}/testpage" target="_blank">示例</a></p>

        <h2>json 页面模拟</h2>

        <p>关于json 页面，其实可以用 jsp 页面模拟，如<a href="${pageContext.request.contextPath}/jsp" target="_blank">示例</a>，也可以直接在预览 json 文件，只要此文件放在 test 目录下面。如<a href="${pageContext.request.contextPath}/json" target="_blank">示例</a>。注意查看 <code>jello-demo</code> 项目下面的 test 目录和 server.conf 文件内容。</p>

    </fis:block>

</fis:extends>
