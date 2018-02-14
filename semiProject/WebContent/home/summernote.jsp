<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="api.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
        $('#materialnote').materialnote({
            height: 350
        });
    });
$(document).ready(function() {
    $('#materialnote').materialnote();
  });
</script>
	<textarea name="content" id="materialnote" value=""></textarea>
