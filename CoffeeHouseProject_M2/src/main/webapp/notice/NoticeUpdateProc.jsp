<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.Timestamp, chboard.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="mem_id" value="${sessionScope.idKey}" />
<fmt:requestEncoding value="utf-8" />

<c:if test="${check==1}">
<meta http-equiv="Refresh" content="0;url=NoticeList.do?pageNum=${pageNum}">
</c:if>
<c:if test="${check==0}">
	<script>
		alert("비밀번호가 일치하지 않습니다.");
		history.go(-1);
	</script>
</c:if>