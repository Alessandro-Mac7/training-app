<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="parts/_header.jsp"></jsp:include>
    <title>Parco auto</title>
</head>
<body>

<jsp:include page="parts/_nav-user.jsp"></jsp:include>
<!-- Page Content -->
<div class="container">

    <div class="row pt-4">
        <div class="col-sm-6">
            <h4>Parco auto</h4>
        </div>
    </div>

    <div class="row pt-4">
        <c:if test="${not empty eventi}">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">Tipo</th>
                    <th scope="col">Prenotazione</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${eventi}" var="evento">
                    <tr>
                        <td>${evento.tipo}</td>
                        <td>${evento.prenotazione.data_inizio}&ensp;${evento.prenotazione.data_fine}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>

        <c:if test="${ empty eventi}">
            <div class="col-sm-12 text-center">
                <h4>Nessun evento presente!</h4>
            </div>
        </c:if>
    </div>
    <!-- /.row -->

</div>
<!-- /.container -->
<!-- Scripts -->
<jsp:include page="parts/_footer.jsp"></jsp:include>
<script type="application/javascript" src="js/customer.js"></script>

</body>
</html>
