$(document).ready(function(){

    $('[data-toggle="tooltip"]').tooltip();

    $("#filterPrenotazioniTable").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#prenotazioniTable tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });

    $("#filterMezziTable").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#mezziTable tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });

    $("#errorModal").modal();

    // INS Form
    $(".insPrenotazioneForm").on('submit', function(e) {
        e.preventDefault();
        var form = $('.insPrenotazioneForm');
        var disabled = form.find(':input:disabled').removeAttr('disabled');
        var serialized = form.serialize();
        disabled.attr('disabled','disabled');
        insertPrenotazione(serialized);
    });

    //EDIT Form

    $(".editCustomerForm").on('submit', function (e) {
        e.preventDefault();
        var form = $('.editCustomerForm');
        var disabled = form.find(':input:disabled').removeAttr('disabled');
        var serialized = form.serialize();
        disabled.attr('disabled','disabled');
        editCustomer(serialized);

    })

    $(".editPrenotazioneForm").on('submit', function (e) {
        e.preventDefault();
        var form = $('.editPrenotazioneForm');
        var disabled = form.find(':input:disabled').removeAttr('disabled');
        var serialized = form.serialize();
        disabled.attr('disabled','disabled');
        editPrenotazione(serialized);
    })

    //DELETE Modal

    $(".deletePrenotazione").on('click', function(e) {
        var id = $(this).data('id');
        $("#deleteButtonPrenotazione").data("id", id);
        $(".confirmModal").modal();
    });

    $("#deleteButtonPrenotazione").on('click', function () {
        var id = $(this).data('id');
        deletePrenotazione(id);
    });

});

//INSERT
function insertPrenotazione(form) {
    $.ajax({
        type: "POST",
        url: 'prenotazioni',
        data: form,
        success: function(data) {
            $('.insPrenotazioneModal').modal('hide');
            $(".modalColorHeader").css("background-color", "green");
            $('.modalResponseTitle').text("Successo");
            $('.modalResponseBody').text("Prenotazione effettuata con successo!");
            $('.successModal').modal();
            window.location.reload();
        }, error: function (request, status, error) {
            $('.insPrenotazioneModal').modal('hide');
            $(".modalColorHeader").css("background-color", "red");
            $('.modalResponseTitle').text("Errore");
            $('.modalResponseBody').text("Prenotazione non effettuata!");
            $('.successModal').modal();
        }
    });
}

//EDIT

function editCustomer(form){
    $.ajax({
        type: "POST",
        url: 'customers',
        data: form,
        success: function(data) {
            $(".modalColorHeader").css("background-color", "green");
            $('.modalResponseTitle').text("Successo");
            $('.modalResponseBody').text("Customer modificato con successo!");
            $('.successModal').modal();
        }, error: function (request, status, error) {
            $(".modalColorHeader").css("background-color", "red");
            $('.modalResponseTitle').text("Errore");
            $('.modalResponseBody').text("Customer non modificato!");
            $('.successModal').modal();
        }
    });
}

function editPrenotazione(form){
    $.ajax({
        type: "POST",
        url: 'prenotazioni',
        data: form,
        success: function(data) {
            $(".modalColorHeader").css("background-color", "green");
            $('.modalResponseTitle').text("Successo");
            $('.modalResponseBody').text("Prenotazione modificata con successo!");
            $('.successModal').modal();
        }, error: function (request, status, error) {
            $(".modalColorHeader").css("background-color", "red");
            $('.modalResponseTitle').text("Errore");
            $('.modalResponseBody').text("Prenotazione non modificata!");
            $('.successModal').modal();
        }
    });
}

//DELETE

function deletePrenotazione(id) {
    $.ajax({
        type: "get",
        url: 'prenotazioni?action=deleteCustomer&Id='+id,
        success: function(data) {
            $('.confirmModal').modal('hide');
            $(".modalColorHeader").css("background-color", "green");
            $('.modalResponseTitle').text("Successo");
            $('.modalResponseBody').text("Prenotazione eliminata!");
            $('.successModal').modal();
            window.location.reload();
        }, error: function (request, status, error) {
            $('.confirmModal').modal('hide');
            $(".modalColorHeader").css("background-color", "red");
            $('.modalResponseTitle').text("Errore");
            $('.modalResponseBody').text("Prenotazione non eliminata!");
            $('.successModal').modal();
        }
    });
}
