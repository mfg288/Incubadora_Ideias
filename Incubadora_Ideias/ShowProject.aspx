<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShowProject.aspx.cs" Inherits="Incubadora_Ideias.ShowProject" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
        $("#input-22").rating({
            showClear: false,
            showCaption: false,
            size: "sm"
        });
        //ghfyfygf

        $(document).ready(function () {

            var id = 1;

            $.ajax({
                url: "ShowProject.aspx/ObterIdeia",
                type: "POST",
                contentType: 'application/json; charset=utf-8',
                datatype: "json",
                data: "{ 'id':'" + id + "' }",
                success: function (result) {
                    console.log(result);
                    $("#MainContent_Image1").prop("src", "Files/Ideas/" + id + "/mystats.png");
                    $("#title_show").text(result.d.Titulo);
                    $("#input-22").text(result.d.Pontuacao);
                    $("#inp_tags").val(result.d.Tags);
                    $("#TextArea1").val(result.d.Descricao);
                    $("#MainContent_tb_type").val(result.d.Tipo);
                    $("#MainContent_tb_visuals").val(result.d.SomaVisualizacoes);
                },
                error: function (result) {
                    console.log(result);
                }
            });

        });

    </script>

    <div class="container">

        <div class="form-inline">
            <div class="form-group">
                <button class="fav-icon">
                    <span class="fa-stack fa-lg" style="">
                        <i id="heart_glyp" runat="server" onclick="SetFavorito"></i>
                        <i id="ban_glyp" runat="server"></i>
                    </span>
                </button>

                <h1 id="title_show" style="display: inline; vertical-align: middle;">Título</h1>

            </div>
            <div class="form-group">
                <input id="input-22" data-min="0" data-max="10" data-step="1">
            </div>
        </div>
        <div id="tagstest" runat="server">
        </div>
        <div class="row">
            <div class="col-sm-4">
                <div class="container-fluid">
                    <div class="row">
                        <asp:Image ID="Image1" BackColor="Aqua" Width="100%" Height="250px" runat="server" />
                    </div>
                    <div class="row">
                        <asp:Label AssociatedControlID="tb_type" CssClass="col-md-12" runat="server" Text="Tipo Ideia"></asp:Label>
                        <div class="col-md-4 col-md-offset-1 ">
                            <asp:TextBox ID="tb_type" CssClass="form-control " runat="server" Text="Publica" Enabled="false"></asp:TextBox>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <asp:Label AssociatedControlID="tb_visuals" CssClass="col-md-12" runat="server" Text="Visualizações"></asp:Label>
                        <div class="col-md-4 col-md-offset-1 ">
                            <asp:TextBox ID="tb_visuals" CssClass="form-control" runat="server" Text="145" Enabled="false"></asp:TextBox>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <asp:Label AssociatedControlID="tb_visuals" CssClass="col-md-12" runat="server" Text="Visualizações"></asp:Label>
                        <div class="col-md-4 col-md-offset-1 ">
                            <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Text="145" Enabled="false"></asp:TextBox>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <asp:Label AssociatedControlID="tb_visuals" CssClass="col-md-12" runat="server" Text="Visualizações"></asp:Label>
                        <div class="col-md-4 col-md-offset-1 ">
                            <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" Text="145" Enabled="false"></asp:TextBox>
                        </div>
                    </div>
                </div>


            </div>
            <div class="col-sm-8" style="background-color: lavenderblush;">
                <label class="control-label col-sm-2" for="inpTags">Tags</label>
                <input id="inp_tags" class="form-control" runat="server" clientidmode="Static">
                    <br />
                    <textarea id="TextArea1" class="form-control" cols="20" rows="5"></textarea>
                    <br />
                    <br />
                    anexos:<br />
                    <asp:HyperLink ID="HyperLink1" runat="server">HyperLink</asp:HyperLink><br />
                    <asp:HyperLink ID="HyperLink2" runat="server">HyperLink</asp:HyperLink><br />
                    <asp:HyperLink ID="HyperLink3" runat="server">HyperLink</asp:HyperLink><br />
                </input>
             <asp:Panel ID="comments_div" runat="server"></asp:Panel>
            </div>
       
        </div>


    </div>
</asp:Content>
