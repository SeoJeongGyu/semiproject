<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="api.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
        $('#materialnote').materialnote({
            width: 860,
            height: 300
        });
    });
$(document).ready(function() {
    $('#materialnote').materialnote();
  });
</script>
	<textarea name="scontent" id="materialnote" ></textarea>
