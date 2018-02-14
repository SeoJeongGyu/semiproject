<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/home/note.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
    $('#summernote').summernote({
        	width: 1200,
            height: 300,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true                  // set focus to editable area after initializing summernote
    });
});
$(document).ready(function() {
    $('#summernote').summernote();
  });
</script>
	<textarea name="content" id="summernote" value=""></textarea>
