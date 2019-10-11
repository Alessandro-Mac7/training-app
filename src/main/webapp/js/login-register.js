$(document).ready(function(){

    $("#btnSignup").on('click', function(){
        $("#signupModal").modal();
    });
    
    $("#signupForm").on('submit', function(e) {
        e.preventDefault();
        var form = $('#signupForm').serialize();

        registerUser(form);
    })
});

function registerUser(form) {
    //alert("Si");

    $.ajax({
        type: "POST",
        url: 'sign-up',
        data: form,
        success: function(data) {
            $('#signupModal').modal('hide');
            $("#modalColorHeader").css("background-color", "green");
            $('#modalResponseTitle').text("Successo");
            $('#modalResponseBody').text("Utente registrato con successo!");
            $('#successModal').modal();
        }, error: function (request, status, error) {
            $("#modalColorHeader").css("background-color", "red");
            $('#modalResponseTitle').text("Errore");
            $('#modalResponseBody').text("Utente non registrato!");
            $('#successModal').modal();
        }
    });
}