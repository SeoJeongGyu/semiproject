<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="api.jsp" %>
	<textarea name="scontent" id="materialnote" value="" ></textarea>
<script type="text/javascript">
	$(document).ready(function() {
        $('#materialnote').materialnote({
            width: 860,
            height: 350
        });
    });
$(document).ready(function() {
    $('#materialnote').materialnote();
  });
</script>
