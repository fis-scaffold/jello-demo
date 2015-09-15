<%@ page contentType="text/html;charset=utf-8" %><%@ taglib uri="/fis" prefix="fis"%><fis:extends name="./frame.jsp">

    <fis:block name="body">

        <fis:block name="header">
            <fis:widget name="/widget/header/header.jsp" />
        </fis:block>

        <fis:block name="content"></fis:block>

        <fis:block name="footer">
            <fis:widget name="/widget/footer/footer.vm" />
        </fis:block>

    </fis:block>

    <fis:require name="./front.jsp" />
</fis:extends>
