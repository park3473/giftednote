<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
	

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	

    
</script>

	<form name="updateScoreform" id="updateScoreform">
		<input type="hidden" id="MEMBER_IDX" name="MEMBER_IDX" value="${ssion_user_id }"/>
		<input type="hidden" id="SCORE" name="SCORE"/>
		<input type="hidden" id="TYPE" name="TYPE"/>
	</form>