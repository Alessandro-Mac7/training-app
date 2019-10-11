$(document).ready(function(){

    $('[data-toggle="tooltip"]').tooltip();

    $('.collapse').collapse('show');

    $('.showCollapsePrenotazioni').on('click' , function (t) {
        $('#collapsePrenotazione').collapse('toggle');
    });

    $('.showCollapseEventi').on('click' , function (t) {
        $('#collapseEvento').collapse('toggle');
    });

    $("#menu-toggle").on('click', function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });

    // INS Form
    $(".insCustomerForm").on('submit', function(e) {
        e.preventDefault();
        var form = $('.insCustomerForm').serialize();
        insertCustomer(form);
    });

    $(".insBuonoscontoForm").on('submit', function(e) {
        e.preventDefault();
        var form = $('.insBuonoscontoForm').serialize();
        insertBuono(form);
    });

    $(".insMezzoForm").on('submit', function(e) {
        e.preventDefault();
        var form = $('.insMezzoForm').serialize();
        insertMezzo(form);
    });

    $(".insEventoForm").on('submit', function(e) {
        e.preventDefault();
        var form = $('.insEventoForm').serialize();
        insertEvento(form);
    });

    //EDIT Form
    $(".editMezzoForm").on('submit', function (e) {
        e.preventDefault();
        var form = $('.editMezzoForm');
        var disabled = form.find(':input:disabled').removeAttr('disabled');
        var serialized = form.serialize();
        disabled.attr('disabled','disabled');
        editMezzo(serialized);

    })

    $(".editCustomerForm").on('submit', function (e) {
        e.preventDefault();
        var form = $('.editCustomerForm');
        var disabled = form.find(':input:disabled').removeAttr('disabled');
        var serialized = form.serialize();
        disabled.attr('disabled','disabled');
        editCustomer(serialized);

    })

    $(".editBuonoForm").on('submit', function (e) {
        e.preventDefault();
        var form = $('.editBuonoForm');
        var disabled = form.find(':input:disabled').removeAttr('disabled');
        var serialized = form.serialize();
        disabled.attr('disabled','disabled');
        editBuono(serialized);
    })

    $(".editEventoForm").on('submit', function (e) {
        e.preventDefault();
        var form = $('.editEventoForm');
        var disabled = form.find(':input:disabled').removeAttr('disabled');
        var serialized = form.serialize();
        disabled.attr('disabled','disabled');
        editEvento(serialized);
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
    $(".deleteCustomer").on('click', function(e) {
        var id = $(this).data('id');
        $("#deleteButton").data("id", id);
        $(".confirmModal").modal();
    });

    $("#deleteButton").on('click', function () {
        var id = $(this).data('id');
        deleteCustomer(id);
    });

    $(".deleteMezzo").on('click', function(e) {
        var id = $(this).data('id');
        $("#deleteButtonMezzo").data("id", id);
        $(".confirmModal").modal();
    });

    $("#deleteButtonMezzo").on('click', function () {
        var id = $(this).data('id');
        deleteMezzo(id);
    });

    $(".deleteBuono").on('click', function(e) {
        var id = $(this).data('id');
        $("#deleteButtonBuono").data("id", id);
        $(".confirmModal").modal();
    });

    $("#deleteButtonBuono").on('click', function () {
        var id = $(this).data('id');
        deleteBuono(id);
    });

    $(".deleteEvento").on('click', function(e) {
        var id = $(this).data('id');
        $("#deleteButtonEvento").data("id", id);
        $(".confirmModal").modal();
    });

    $("#deleteButtonEvento").on('click', function () {
        var id = $(this).data('id');
        deleteEvento(id);
    });

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
function insertBuono(form) {
    $.ajax({
        type: "POST",
        url: 'buonisconto',
        data: form,
        success: function(data) {
            $('.insBuonosconto').modal('hide');
            $(".modalColorHeader").css("background-color", "green");
            $('.modalResponseTitle').text("Successo");
            $('.modalResponseBody').text("Buono inserito con successo!");
            $('.successModal').modal();
        }, error: function (request, status, error) {
            $('.insBuonosconto').modal('hide');
            $(".modalColorHeader").css("background-color", "red");
            $('.modalResponseTitle').text("Errore");
            $('.modalResponseBody').text("Buono non inserito correttamente!");
            $('.successModal').modal();
        }
    });
}

function insertCustomer(form) {
    $.ajax({
        type: "POST",
        url: 'sign-up',
        data: form,
        success: function(data) {
            $('.insCustomerModal').modal('hide');
            $(".modalColorHeader").css("background-color", "green");
            $('.modalResponseTitle').text("Successo");
            $('.modalResponseBody').text("Customer inserito con successo!");
            $('.successModal').modal();
            window.location.reload();
        }, error: function (request, status, error) {
            $('.insCustomerModal').modal('hide');
            $(".modalColorHeader").css("background-color", "red");
            $('.modalResponseTitle').text("Errore");
            $('.modalResponseBody').text("Customer non inserito correttamente!");
            $('.successModal').modal();
        }
    });
}

function insertMezzo(form) {
    $.ajax({
        type: "POST",
        url: 'mezzi',
        data: form,
        success: function(data) {
            $('.insMezzoModal').modal('hide');
            $(".modalColorHeader").css("background-color", "green");
            $('.modalResponseTitle').text("Successo");
            $('.modalResponseBody').text("Mezzo inserito con successo!");
            $('.successModal').modal();
            window.location.reload();
        }, error: function (request, status, error) {
            $('.insMezzoModal').modal('hide');
            $(".modalColorHeader").css("background-color", "red");
            $('.modalResponseTitle').text("Errore");
            $('.modalResponseBody').text("Mezzo non inserito correttamente!");
            $('.successModal').modal();
        }
    });
}

function insertEvento(form) {
    $.ajax({
        type: "POST",
        url: 'eventi',
        data: form,
        success: function(data) {
            $('.insEventoModal').modal('hide');
            $(".modalColorHeader").css("background-color", "green");
            $('.modalResponseTitle').text("Successo");
            $('.modalResponseBody').text("Evento inserito con successo!");
            $('.successModal').modal();
            window.location.reload();
        }, error: function (request, status, error) {
            $('.insEventoModal').modal('hide');
            $(".modalColorHeader").css("background-color", "red");
            $('.modalResponseTitle').text("Errore");
            $('.modalResponseBody').text("Evento non inserito correttamente!");
            $('.successModal').modal();
        }
    });
}

//EDIT
function editMezzo(form){
    $.ajax({
        type: "POST",
        url: 'mezzi',
        data: form,
        success: function(data) {
            $(".modalColorHeader").css("background-color", "green");
            $('.modalResponseTitle').text("Successo");
            $('.modalResponseBody').text("Mezzo modificato con successo!");
            $('.successModal').modal();
        }, error: function (request, status, error) {
            $(".modalColorHeader").css("background-color", "red");
            $('.modalResponseTitle').text("Errore");
            $('.modalResponseBody').text("Mezzo non modificato!");
            $('.successModal').modal();
        }
    });
}

function editBuono(form){
    $.ajax({
        type: "POST",
        url: 'buonisconto',
        data: form,
        success: function(data) {
            $(".modalColorHeader").css("background-color", "green");
            $('.modalResponseTitle').text("Successo");
            $('.modalResponseBody').text("Buono modificato con successo!");
            $('.successModal').modal();
        }, error: function (request, status, error) {
            $(".modalColorHeader").css("background-color", "red");
            $('.modalResponseTitle').text("Errore");
            $('.modalResponseBody').text("Buono non modificato!");
            $('.successModal').modal();
        }
    });
}

function editCustomer(form){
    $.ajax({
        type: "POST",
        url: 'sign-up',
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

function editEvento(form){
    $.ajax({
        type: "POST",
        url: 'eventi',
        data: form,
        success: function(data) {
            $(".modalColorHeader").css("background-color", "green");
            $('.modalResponseTitle').text("Successo");
            $('.modalResponseBody').text("Evento modificato con successo!");
            $('.successModal').modal();
        }, error: function (request, status, error) {
            $(".modalColorHeader").css("background-color", "red");
            $('.modalResponseTitle').text("Errore");
            $('.modalResponseBody').text("Mezzo non modificato!");
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
function deleteMezzo(id) {
    $.ajax({
        type: "get",
        url: 'mezzi?action=delete&Id='+id,
        success: function(data) {
            $('.confirmModal').modal('hide');
            $(".modalColorHeader").css("background-color", "green");
            $('.modalResponseTitle').text("Successo");
            $('.modalResponseBody').text("Mezzo eliminato!");
            $('.successModal').modal();
            window.location.reload();
        }, error: function (request, status, error) {
            $('.confirmModal').modal('hide');
            $(".modalColorHeader").css("background-color", "red");
            $('.modalResponseTitle').text("Errore");
            $('.modalResponseBody').text("Mezzo non eliminato!");
            $('.successModal').modal();
        }
    });
}

function deleteCustomer(id) {
    $.ajax({
        type: "get",
        url: 'customers?action=delete&Id='+id,
        success: function(data) {
            $('.confirmModal').modal('hide');
            $(".modalColorHeader").css("background-color", "green");
            $('.modalResponseTitle').text("Successo");
            $('.modalResponseBody').text("Customer eliminato!");
            $('.successModal').modal();
            window.location.reload();
        }, error: function (request, status, error) {
            $('.confirmModal').modal('hide');
            $(".modalColorHeader").css("background-color", "red");
            $('.modalResponseTitle').text("Errore");
            $('.modalResponseBody').text("Customer non eliminato!");
            $('.successModal').modal();
        }
    });

}

function deleteBuono(id) {
    $.ajax({
        type: "get",
        url: 'buonisconto?action=delete&Id='+id,
        success: function(data) {
            $('.confirmModal').modal('hide');
            $(".modalColorHeader").css("background-color", "green");
            $('.modalResponseTitle').text("Successo");
            $('.modalResponseBody').text("Buono eliminato!");
            $('.successModal').modal();
            window.location.reload();
        }, error: function (request, status, error) {
            $('.confirmModal').modal('hide');
            $(".modalColorHeader").css("background-color", "red");
            $('.modalResponseTitle').text("Errore");
            $('.modalResponseBody').text("Buono non eliminato!");
            $('.successModal').modal();
        }
    });
}

function deletePrenotazione(id) {
    $.ajax({
        type: "get",
        url: 'prenotazioni?action=delete&Id='+id,
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

function deleteEvento(id) {
    $.ajax({
        type: "get",
        url: 'eventi?action=delete&Id='+id,
        success: function(data) {
            $('.confirmModal').modal('hide');
            $(".modalColorHeader").css("background-color", "green");
            $('.modalResponseTitle').text("Successo");
            $('.modalResponseBody').text("Evento eliminato!");
            $('.successModal').modal();
            window.location.reload();
        }, error: function (request, status, error) {
            $('.confirmModal').modal('hide');
            $(".modalColorHeader").css("background-color", "red");
            $('.modalResponseTitle').text("Errore");
            $('.modalResponseBody').text("Evento non eliminato!");
            $('.successModal').modal();
        }
    });
}