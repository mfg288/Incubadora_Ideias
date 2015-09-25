<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CriarIdeia.aspx.cs" Inherits="Incubadora_Ideias.CriarIdeia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-horizontal">
        <h1>Criar Ideia</h1>
        <hr />
        <div class="form-group">
            <label class="control-label col-sm-2" runat="server">Nome</label>
            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
	            <input class="form-control" id="inpName" runat="server" />
                <%-- min 5 chars, can enter A-Za-z0-9, required,max 25? --%>
                <asp:RequiredFieldValidator
                    ControlToValidate="inpName"
                    runat="server"
                    ForeColor="#c60000"
                    Display="Dynamic"
                    Text="Por favor insira um Nome"
                    ValidationGroup="create_project" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2">Tipo Ideia</label>
            <div class="">
                <div class="btn-group col-xs-4 col-sm-4 col-md-4 col-lg-4" data-toggle="buttons">
                    <label class="btn btn-primary active">
	                    <input type="radio" name="options" id="rbPublica" checked runat="server" />
                        Publica
                    </label>
                    <label class="btn btn-primary">
	                    <input type="radio" name="options" id="rbPrivada" runat="server" />
                        Privada       
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="inpTags">Tags</label>
            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
	            <input id="inpTags" class="form-control" runat="server" clientidmode="Static" />
                <asp:RequiredFieldValidator
                    ControlToValidate="inpTags"
                    runat="server"
                    ForeColor="#c60000"
                    Display="Dynamic"
                    Text="Por favor insira um ou mais Tags"
                    ValidationGroup="create_project" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2">Descrição</label>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <textarea class="form-control" rows="10" id="taDesc" runat="server"></textarea>
                <asp:RequiredFieldValidator
                    ControlToValidate="taDesc"
                    runat="server"
                    ForeColor="#c60000"
                    Display="Dynamic"
                    Text="Por favor insira uma descrição"
                    ValidationGroup="create_project" />
            </div>
        </div>
        <div class="form-group">



            <label class="control-label col-sm-2" for="inpTags">Convidar</label>
            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                <%--                <input id="inpConvt" class="form-control" runat="server" clientidmode="Static">--%>
                <asp:ListBox runat="server" data-selected="" SelectionMode="Multiple" ID="lb_covit" name="state[]" ClientIDMode="Static" DataSourceID="sql_user" DataTextField="Email" DataValueField="Email"></asp:ListBox>
                <asp:SqlDataSource runat="server" ID="sql_user" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT AspNetUsers.Email FROM AspNetUsers INNER JOIN AspNetUserRoles ON AspNetUsers.Id = AspNetUserRoles.UserId INNER JOIN AspNetRoles ON AspNetUserRoles.RoleId = AspNetRoles.Id WHERE (AspNetRoles.Name LIKE 'user')"></asp:SqlDataSource>


            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2">Capa</label>
            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                <asp:FileUpload ID="fu_cover" runat="server" AllowMultiple="true" ClientIDMode="Static" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2">Galeria</label>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <asp:FileUpload ID="fu_gallery" runat="server" AllowMultiple="true" ClientIDMode="Static" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2">Anexos</label>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <asp:FileUpload ID="fu_attach" runat="server" AllowMultiple="true" ClientIDMode="Static" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <asp:Button ID="bt_criar" ClientIDMode="Static" runat="server" Text="Criar" CssClass="btn btn-default" OnClick="create_Idea" />
                <asp:Button ID="testb" runat="server" ClientIDMode="Static" data-asd="asd" Text="Criarasda" CssClass="btn btn-default" OnClick="testb_Click" />
            </div>
        </div>
    </div>






</asp:Content>
