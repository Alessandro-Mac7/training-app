<html>
<head lang="it">
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/training-app.css">

    <title>Index</title>
</head>

<body>
<div class="container">
    <form class="form-signin">
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
<div class="modal" id="signup-modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Registrati</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="" class="form-signin">
                    <div class="form-group">
                        <input type="email" class="form-control" id="email" placeholder="Inserisci Email" name="email" required>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="pwd" placeholder="Inserisci Password" name="pswd" required>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="name" placeholder="Inserisci nome" name="name" required>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="surname" placeholder="Inserisci cognome" name="surname" required>
                    </div>
                    <div class="form-group">
                        <input type="date" class="form-control" id="born-date" placeholder="Inserisci data di nascita" name="born-date">
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

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script>
    $(document).ready(function(){
        $("#btn-signup").click(function(){
            $("#signup-modal").modal();
        });
    });
</script>

</body>
</html>
