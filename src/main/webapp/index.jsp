<html>
<head lang="it">
    <jsp:include page="WEB-INF/views/parts/_header.jsp"></jsp:include>
    <title>Login</title>
</head>

<body class="login-body">
<div class="container">
    <form class="form-signin" action="Auth">
        <img class="mb-4" src="img/logo.png" alt="" width="300">
        <label for="inputEmail" class="sr-only">Email</label>
        <input type="email" id="inputEmail" class="form-control" placeholder="Email" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <button class="btn btn-lg btn-success btn-block" id="btn-signup" href="">Registrati</button>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Entra</button>
    </form>
</div>

<!-- Modal Registrazione -->
<div class="modal fade" id="signup-modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Registrati</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="" class="form-signin">
                    <div class="form-group">
                        <input type="email" class="form-control" id="email" placeholder="Email" name="email" required>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="pwd" placeholder="Password" name="pswd" required>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="name" placeholder="Nome" name="name" required>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="surname" placeholder="Cognome" name="surname" required>
                    </div>
                    <div class="form-group">
                        <input type="date" class="form-control" id="born-date" placeholder="Data di nascita" name="born-date">
                    </div>
                    <div class="form-group form-check">
                        <label class="form-check-label">
                            <input class="form-check-input" type="checkbox" name="superuser"> Super-User
                        </label>
                    </div>
                    <button type="submit" class="btn btn-primary">Registrati</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<jsp:include page="WEB-INF/views/parts/_footer.jsp"></jsp:include>
<script>
    $(document).ready(function(){
        $("#btn-signup").click(function(){
            $("#signup-modal").modal();
        });
    });
</script>

</body>
</html>
