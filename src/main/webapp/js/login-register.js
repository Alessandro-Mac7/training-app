$(document).ready(function(){

    $("#btn-signup").on('click', function(){
        $("#signup-modal").modal();
    });
    
    $("#signup-form").on('submit', function(e) {
        e.preventDefault();
        var form = $('#signup-form').serialize();

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
            $('#signup-modal').modal('hide');
            $('#modal-response-title').text("Successo");
            $('#modal-response-body').text("Utente registrato con successo!");
            $('#success-modal').modal();
        }, error: function (request, status, error) {
            $('#modal-response-title').text("Errore");
            $('#modal-response-body').text("Utente non registrato!");
            $('#success-modal').modal();
        }
    });
}