<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var='root' value='${pageContext.request.contextPath }/' />
<script>
	alert('수정완료!')
	location.href = '${root}board/read?b_no=${modifyBean.board_num}'
</script>


