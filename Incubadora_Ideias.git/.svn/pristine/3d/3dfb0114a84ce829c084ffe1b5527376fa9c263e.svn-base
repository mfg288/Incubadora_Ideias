$(function () {
    var chat = $.connection.chatHub;

    chat.client.publicarMensagem = function (nome, mensagem) {
        var containerNome = $('<span/>').text(nome).html();
        var containerMensagem = $('<div/>').text(mensagem).html();

        $("#conversa").append(
            '<li><strong>'
                + containerNome +
                '</strong>: '
                + containerMensagem + '</li>');
    };

    $.connection.hub.start().done(function () {
        $("#enviar").click(function () {
            var nome = $("#nome").val();
            var mensagem = $("#mensagem").val();

            chat.server.enviarMensagem(nome, mensagem);

            $("#mensagem").val('');
        });
    });

});