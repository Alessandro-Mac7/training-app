<html>
<head lang="it">
    <jsp:include page="WEB-INF/views/parts/_header.jsp"></jsp:include>
    <title>Login</title>
</head>

<body class="login-body">
<div class="container">
    <form class="form-signin" action="auth" method="post">
        <img class="mb-4" src="img/logo.png" alt="" width="300">
        <label for="inputEmail" class="sr-only">Email</label>
        <input type="email" id="inputEmail" class="form-control" name="mail" placeholder="Email" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" name="password" placeholder="Password" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Entra</button>
        <button class="btn btn-lg btn-success btn-block" id="btn-signup" type="button">Registrati</button>

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
                <form class="form-signin" id="signup-form" method="post">
                    <div class="form-group">
                        <input type="email" class="form-control" id="email" placeholder="Email" name="email" required>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="pwd" placeholder="Password" name="pwd" required>
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


<div class="modal fade" id="success-modal" tabindex="-1" role="dialog" aria-labelledby="success-modal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color: forestgreen; color: white">
                <h5 class="modal-title" id="modal-response-title">Successo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="modal-response-body">
                <h4>Utente registrato con successo!</h4>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<jsp:include page="WEB-INF/views/parts/_footer.jsp"></jsp:include>
<script type="application/javascript" src="js/login-register.js"></script>

</body>
</html>
