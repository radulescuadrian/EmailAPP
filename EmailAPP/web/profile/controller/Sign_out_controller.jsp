<%
    session.removeAttribute("user_session");
    session.invalidate();
%>
<script type="text/javascript">
    window.location.href="http://localhost:8080/intro";
</script>