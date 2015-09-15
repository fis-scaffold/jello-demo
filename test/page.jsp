<%!
    // 将 menus 中当前 url 标记为 active
    public Boolean markActiveMenus(JSONArray menus, String path) {
        Boolean hasActive = false;

        for (int i = 0, len = menus.size(); i < len; i++) {
            JSONObject item = menus.getJSONObject(i);

            Boolean childActive = false;
            if (item.containsKey("children")) {
                childActive = markActiveMenus(item.getJSONArray("children"), path);
            }

            if (childActive || item.containsKey("href") && path.startsWith(item.getString("href"))) {
                item.put("active", true);
                hasActive = true;
            }
        }

        return hasActive;
    }

%><%@ page import="org.apache.velocity.context.Context" %>
<%@ page import="com.alibaba.fastjson.JSONArray" %>
<%@ page import="com.alibaba.fastjson.JSONObject" %>
<%

    Context context = (Context)request.getAttribute("context");


    JSONArray menus = (JSONArray)context.get("menus");
    String path = request.getAttribute("javax.servlet.forward.request_uri").toString();
    if (path == null) {
        path = request.getServletPath();
    }

    path = path.substring(request.getContextPath().length());

    context.put("currentUrl", path);

    if (menus != null && path != null) {
        markActiveMenus(menus, path);
    }
%>
