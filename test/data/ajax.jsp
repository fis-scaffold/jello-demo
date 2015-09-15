<%@ page contentType="application/json; charset=UTF-8" import="java.util.Date" %>{
    "code": 0,
    "message": "成功",
    "data": {
        "username": "admin",
        "role": "admin",
        "nickname": "诸多借口",
        "time": "<%= new Date()%>",
        "description": "这个是动态的数据，因为是用 jsp 输出的，可以按自己的需求模拟。"
    }
}