<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${param.success == 1}">
	<div class="noti-success">
        <i class="fas fa-check-circle noti_icon"></i>
        <p>${param.noti}</p>
    </div>
</c:if>
<c:if test="${param.success == 0}">
	<div class="noti-fail">
        <i class="fas fa-exclamation-circle noti_icon"></i>
        <p>${param.noti}</p>
    </div>
</c:if>