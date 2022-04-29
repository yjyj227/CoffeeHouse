<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.Timestamp, chboard.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8" />
<c:set var="mem_id" value="${sessionScope.idKey}" />
<c:set var="mem_passwd" value="${sessionScope.pwKey}" />

<meta http-equiv="Refresh" content="0;url=NoticeList.do">