<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="nav">
		<%@ include file="../include/nav.jsp"%>
	</div>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>작성자</th>
				<th>조회수</th>
			</tr>

		</thead>
		<tbody>
			<c:forEach items="${list }" var="list">
				<tr>
					<th>${list.bno }</th>
					<th><a href="/board/view?bno=${list.bno }">${list.title }</a></th>
					<th><fmt:formatDate value="${list.regDate }"
							pattern="yyyy-MM-dd" /></th>
					<th>${list.writer }</th>
					<th>${list.viewCnt }</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div>

		<c:if test="${prev}">
			<span>[ <a href="/board/listPage?num=${startPageNum - 1}">이전</a>
				]
			</span>
		</c:if>

		<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
			<span> <c:if test="${select != num}">
					<a href="/board/listPage?num=${num}">${num}</a>
				</c:if> <c:if test="${select == num}">
					<b>${num}</b>
				</c:if>

			</span>
		</c:forEach>

		<c:if test="${next}">
			<span>[ <a href="/board/listPage?num=${endPageNum + 1}">다음</a>
				]
			</span>
		</c:if>



		<%-- 		<c:forEach begin="1" end="${pageNum}" var="num"> --%>
		<%-- 			<span> <a href="/board/listPage?num=${num}">${num}</a> --%>
		<!-- 			</span> -->
		<%-- 		</c:forEach> --%>
	</div>
</body>
</html>