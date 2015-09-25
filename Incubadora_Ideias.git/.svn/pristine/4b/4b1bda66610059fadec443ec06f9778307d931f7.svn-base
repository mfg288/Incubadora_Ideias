function EditarUser(id) {
    $.ajax({
        url: "BackOffice.aspx/EditarUser",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        datatype: "json",
        data: "{ 'id':'" + id + "' }",
        success: function (result) {
            console.log(result),

            $("#tb_id_user").val(result.d.Id);
            $("#txtEmail").val(result.d.Email);
            $("#ddl_pais").val(result.d.Pais);
            $("#ddl_secret").val(result.d.PerguntaSecreta);
            $("#tb_scrt_resp").val(result.d.RespostaSecreta);


            if (result.d.Pessoal == true) {
                $("#btn_pessoal").button('toggle');
                $("#btn_empresa").button('reset')
            } else {
                $("#btn_empresa").button('toggle');
                $("#btn_pessoal").button('reset')
            }
            $("#tb_phone").val(result.d.Telefone);
            $('#tb_fi_user').fileinput('refresh', { initialPreview: [(result.d.Foto == "") ? '<img src="/Content/Images/User.png" class="file-preview-image">' : '<img src="/Content/Images/users_Avatars/' + result.d.Foto + '" class="file-preview-image">'] });
        },
        error: function (result) {
        }
    });

}






















/*--------------------------------------------------------------------------------------------------------------------*/





function EditarIdeia(id) {
    console.log(id);
    $.ajax({
        url: "BackOffice.aspx/EditarIdeia",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        datatype: "json",
        data: "{ 'id':'" + id + "' }",
        success: function (result) {
            console.log(result);
            $("#tb_nome").val(result.d.Nome);
            $("#taDesc").val(result.d.Descricao);
            $('#inpTags').val(result.d.Tags);
            $('#inpTags').selectize({});

        },
        error: function (result) {

            console.log(result);
        }
    });

}




/*--------------------------------------------------------------------------------------------------------------------*/

function Errosedit(id) {
    console.log(id);
    $.ajax({
        url: "BackOffice.aspx/Errosedit",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        datatype: "json",
        data: "{ 'Id':'" + id + "' }",
        success: function (result) {
            console.log(result);
            $("#TB_Titulo_erros").val(result.d.Titulo);
            $("#TB_id_erro").val(result.d.ID);
            $("#TB_descript_erros").val(result.d.Descricao);
            $("#TB_user_erros").val(result.d.User);
            $("#TB_UserName_erros").val(result.d.UserName);
        },
        error: function (result) {

            console.log(result);
        }
    });

}
/*--------------------------------------------------------------------------------------------------------------------*/
function Gravar_user() {
    console.log(id);
    var pessoal;

    if ($('#rb_pessoal').is(':checked'))
        pessoal = true;
    else
        pessoal = false;


    $.ajax({
        url: "BackOffice.aspx/Gravar_user",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        datatype: "json",
        data: {
            email: $("#txtEmail").val(),
            password: stringToMd5($("#Password").val()),
            Pais: $("#ddl_pais option:selected").val(),
            PSecreta: $("#ddl_secret").val(),
            RSecreta: $("#tb_scrt_resp").val(),
            Telefone: $("#tb_phone").val(),


        },
        success: function (result) {

        },
        error: function (result) {

        }
    });

}


