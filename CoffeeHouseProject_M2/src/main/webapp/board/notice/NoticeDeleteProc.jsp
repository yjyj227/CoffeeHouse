<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="chboard.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8" />
<c:set var="mem_id" value="${sessionScope.idKey}" />
<c:set var="mem_passwd" value="${sessionScope.pwKey}" />


<c:if test="${check==1}">
<meta http-equiv="Refresh" content="0;url=NoticeList.do?pageNum=${pageNum}">
</c:if>
<c:if test="${check==0}">
	<script>
	  alert("다시 시도해주십시오.");
	  history.go(-1);
	</script>
</c:if>
	  
	  