<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BackOffice.aspx.cs" Inherits="Incubadora_Ideias.BackOffice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--------------------------------------------Editar utilizador---------------------------------------------->
    <div class="modal fade" id="user_edit_model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-id="5" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Editar utilizador</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-sm-4 control-label">User ID</asp:Label>
                            <div class="col-sm-6 ">
                                <asp:TextBox runat="server" ReadOnly="true" ClientIDMode="Static" ID="tb_id_user" CssClass="form-control" />
                                <%tb_id_user.Attributes.Add("readonly", "readonly"); %>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
                                    CssClass="text-danger" ErrorMessage="The email field is required." Display="Dynamic" ValidationGroup="editUtil" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-sm-4 control-label">Email</asp:Label>
                            <div class="col-sm-6 ">
                                <asp:TextBox runat="server" ClientIDMode="Static" ID="txtEmail" CssClass="form-control" TextMode="Email" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
                                    CssClass="text-danger" ErrorMessage="The email field is required." Display="Dynamic" ValidationGroup="editUtil" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" CssClass="col-sm-4 control-label">   
                                        <strong>Tipo Utilizador</strong></asp:Label>
                            <div class="col-sm-6">
                                <div class="btn-group" id="rb_tipe" data-toggle="buttons" runat="server">
                                    <label class="btn btn-primary active" id="btn_pessoal">
                                        <asp:RadioButton ClientIDMode="Static" ID="rb_pessoal" runat="server" />
                                        Pessoal
                                    </label>
                                    <label class="btn btn-primary" id="btn_empresa">
                                        <asp:RadioButton ClientIDMode="Static" ID="rb_empresa" runat="server" />
                                        Empresa
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="ddl_pais" CssClass="col-sm-4 control-label">Pais</asp:Label>
                            <div class="col-sm-6  ">
                                <asp:DropDownList ID="ddl_pais" ClientIDMode="Static" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="Pais" DataValueField="Id" AppendDataBoundItems="True">
                                </asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT * FROM [Pais] ORDER BY [Pais]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="ddl_secret" CssClass="col-sm-4 control-label">Pergunta Secreta</asp:Label>
                            <div class="col-sm-6  ">
                                <asp:DropDownList ID="ddl_secret" runat="server" ClientIDMode="Static" CssClass="form-control" AppendDataBoundItems="True" DataSourceID="secret_sql" DataTextField="secret" DataValueField="Id">
                                </asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="secret_sql" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT * FROM [Perguntas] ORDER BY [secret]"></asp:SqlDataSource>
                                <asp:RequiredFieldValidator ValidationGroup="editUtil" Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddl_secret" ErrorMessage="Value Required!" InitialValue="0"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="tb_scrt_resp" CssClass="col-sm-4 control-label">Resposta Secreta</asp:Label>
                            <div class="col-sm-6   ">
                                <asp:TextBox runat="server" ID="tb_scrt_resp" ClientIDMode="Static" CssClass="form-control" />
                                <asp:RequiredFieldValidator ValidationGroup="editUtil" runat="server" ControlToValidate="tb_scrt_resp"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="tb_phone" CssClass="col-sm-4 control-label">Número Telefone</asp:Label>
                            <div class="col-sm-6  ">
                                <asp:TextBox runat="server" ID="tb_phone" type="tel" ClientIDMode="Static" CssClass="form-control" />
                                <asp:RequiredFieldValidator ValidationGroup="editUtil" runat="server" ControlToValidate="tb_phone"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Número de telefone é necessário."></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" CssClass="col-sm-4 control-label"><strong>Fotografia</strong></asp:Label>
                            <div class="col-sm-7  ">
                                <asp:FileUpload ID="tb_fi_user" runat="server" ClientIDMode="Static" CssClass="file-loading" />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <asp:Button ValidationGroup="editUtil" ID="Save" runat="server" Text="Gravar" CssClass="btn btn-primary" OnClick="bt_grava_edit_user" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-----------------------------------------Banit User---------------------------------------------------------->
    <div class="modal fade" id="user_actDesact_model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-id="5" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Ativar ou Desativar Utilizador</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="ddl_secret" CssClass="col-sm-4 control-label"> Banir </asp:Label>
                                <div class="col-sm-6  ">
                                    <select id="SB_BanitUser" class="form-control">
                                        <option id="one">1 mês</option>
                                        <option id="three">3 mês</option>
                                        <option id="six">6 mês</option>
                                        <option id="perman">Definitivo</option>
                                        <option id="apagar">Apagar</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Canselar</button>
                    <asp:Button ID="BanirSim" runat="server" Text="Guardar" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
    </div>


    <!---------------------------------------------editar Ideia---------------------------------------------------------->
    <div class="modal fade" id="EditarIdeia" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-id="5" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Editar Tag</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-4 control-label" for="Nome">Nome</label>
                                <div class="col-sm-6 ">
                                    <asp:TextBox runat="server" ClientIDMode="Static" ID="tb_nome" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">Tipo Ideia</label>
                                <div class="">
                                    <div class="col-sm-6 " data-toggle="buttons">
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
                                <label class="col-sm-4 control-label" for="inpTags">Tags</label>
                                <div class="col-sm-6 ">
                                    <input id="inpTags" class="form-control" runat="server" clientidmode="Static" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label" for="asdasd">Descrição</label>
                                <div class="col-sm-6 ">

                                    <textarea class="form-control" clientidmode="Static" rows="10" id="taDesc" runat="server"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Canselar</button>
                    <asp:Button ID="BTBanirtag" runat="server" Text="Banir" CssClass="btn btn-primary" />
                </div>

            </div>
        </div>
    </div>
    <!--------------------------------------------------EstadoTag----------------------------------------------------->
    <div class="modal fade" id="EstadoTag" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-id="5" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Estado utilizador</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="ddl_secret" CssClass="col-sm-4 control-label"> Duração  </asp:Label>
                                <div class="col-sm-6  ">
                                    <select id="SB_EstadoTag" class="form-control">
                                        <option id="oneEstadoTag">1 mês</option>
                                        <option id="threeEstadoTag">3 mês</option>
                                        <option id="sixEstadoTag">6 mês</option>
                                        <option id="permanEstadoTag">Definitivo</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Canselar</button>
                    <asp:Button ID="BTEstadoGravar" runat="server" Text="Gravar" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
    </div>

    <!-------------------------------------------EditarErros------------------------------------------------------------>
    <div class="modal fade" id="EditarErros" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-id="5" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Editar Erros</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="form-horizontal">

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-sm-4 control-label">ID</asp:Label>
                                <div class="col-sm-6 ">
                                    <asp:TextBox runat="server" ClientIDMode="Static" ID="TB_id_erro" CssClass="form-control" TextMode="Email" />
                                    <asp:RequiredFieldValidator ValidationGroup="edit error" runat="server" ControlToValidate="txtEmail"
                                        CssClass="text-danger" ErrorMessage="The email field is required." Display="Dynamic" />
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-sm-4 control-label">Titulo</asp:Label>
                                <div class="col-sm-6 ">
                                    <asp:TextBox runat="server" ClientIDMode="Static" ID="TB_Titulo_erros" CssClass="form-control" TextMode="Email" />
                                    <asp:RequiredFieldValidator ValidationGroup="edit error" runat="server" ControlToValidate="txtEmail"
                                        CssClass="text-danger" ErrorMessage="The email field is required." Display="Dynamic" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="ta_descript" class="col-sm-4 control-label">Descrição</label>
                                <div class="col-sm-6">
                                    <textarea class="form-control" clientidmode="Static" rows="10" id="TB_descript_erros" runat="server"></textarea>

                                    <asp:RequiredFieldValidator ValidationGroup="edit error"
                                        ControlToValidate="TB_descript_erros"
                                        Text="Por favor insira uma Descrição"
                                        runat="server"
                                        ForeColor="#c60000"
                                        Display="Dynamic" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-sm-4 control-label">User</asp:Label>
                                <div class="col-sm-6 ">
                                    <asp:TextBox runat="server" ID="TB_user_erros" ClientIDMode="Static" CssClass="form-control" TextMode="Email" />
                                    <asp:RequiredFieldValidator ValidationGroup="edit error" runat="server" ControlToValidate="txtEmail"
                                        CssClass="text-danger" ErrorMessage="The email field is required." Display="Dynamic" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-sm-4 control-label">User Name</asp:Label>
                                <div class="col-sm-6 ">
                                    <asp:TextBox runat="server" ID="TB_UserName_erros" ClientIDMode="Static" CssClass="form-control" TextMode="Email" />
                                    <asp:RequiredFieldValidator ValidationGroup="edit error" runat="server" ControlToValidate="txtEmail"
                                        CssClass="text-danger" ErrorMessage="The email field is required." Display="Dynamic" />
                                </div>
                            </div>
                            <asp:HyperLink ID="HLErros" CssClass="col-sm-6 control-label" runat="server">HyperLink</asp:HyperLink>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Canselar</button>
                    <asp:Button ID="Button1" runat="server" Text="Banir" CssClass="btn btn-primary" ValidationGroup="edit error" />
                </div>
            </div>
        </div>
    </div>

    <!---------------------------------------------EditarTag---------------------------------------------------------->
    <div class="modal fade" id="EditarrTag" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-id="5" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Editar Tag</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="form-horizontal">
                            <div></div>
                            <a class="btn btn-primary col-sm-4" role="button" data-toggle="collapse" href="#CEditar" aria-expanded="false" aria-controls="collapseExample">Editar
                            </a>
                            <button class="btn btn-primary col-sm-4" type="button" data-toggle="collapse" data-target="#CSelecionar" aria-expanded="false" aria-controls="collapseExample">
                                Selecionar
                            </button>
                            <button class="btn btn-primary col-sm-4" type="button" data-toggle="collapse" data-target="#CApagar" aria-expanded="false" aria-controls="collapseExample">
                                Apagar
                            </button>
                            <div class="collapse " id="CEditar">
                                <div class="form-group">
                                    <div class="col-sm-4 control-label  ">
                                        <asp:Button ID="Button2" runat="server" Text="Editar" CssClass="btn btn-success" />
                                    </div>
                                </div>
                            </div>
                            <div class="collapse" id="CSelecionar">
                                <div class="form-group">
                                    <div class="col-sm-4 control-label  ">
                                        <asp:Button ID="BT_unir_tag" runat="server" Text="Junção" CssClass="btn btn-info" />
                                    </div>
                                    <div class="col-sm-6 control-label ">
                                        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" DataSourceID="sql_tag" DataTextField="Tag" DataValueField="Id" AppendDataBoundItems="True">
                                            <asp:ListItem Value="0" Selected="True" Text="--Select--"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="sql_tag" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT * FROM [Tags] ORDER BY [Tag]"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                            <div class="collapse" id="CApagar">
                                <div class="form-group">

                                    <div class="col-sm-4 control-label">

                                        <asp:Button ID="Bt_Apagarr_tag" runat="server" Text="Apagar" class="btn btn-danger" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Canselar</button>
                    <asp:Button ID="BT_banir_tag" runat="server" Text="Banir" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
    </div>






    <asp:Button ID="Button3" runat="server" Text="Button" OnClick="Button3_Click"/>


    <input type="button" id="testeburon" value="dasdasd" />

    <div class="container">
        <ul class="nav nav-tabs" id="ul_tabs">
            <li class="active"><a data-toggle="tab" href="#users_tab">Utilizadores</a></li>
            <li><a data-toggle="tab" href="#ideias_tab">Ideias</a></li>
            <li><a data-toggle="tab" href="#errors_tab">Erros</a></li>
            <li><a data-toggle="tab" href="#tags_tab">Tags</a></li>
            <li><a data-toggle="tab" <%--href="#menu4"--%>>Administradores</a></li>
        </ul>

        <div class="tab-content">
            <!--------------------------------------------Users----------------------------------------------------------------------------------->
            <div id="users_tab" class="tab-pane fade in active">
                <h3>Utilizadores</h3>
                <div class="form-group">
                    <div class="form-inline">
                        <div class="input-group">
                            <div class="form-group">
                                <asp:TextBox ID="txtSearch_user" CssClass="form-control" runat="server" />
                            </div>
                            <div class="form-group">
                                <asp:DropDownList ID="ddl_user_s" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="id_user_s">Id</asp:ListItem>
                                    <asp:ListItem Value="email_user_s">Email</asp:ListItem>
                                    <asp:ListItem Value="tele_user_s">Telemovel</asp:ListItem>
                                    <asp:ListItem Value="pais_user_s">Pais</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <asp:Button Text="Search" runat="server" CssClass="btn btn-primary " OnClick="Search_User" />
                            </div>
                        </div>

                    </div>
                </div>
                <asp:Panel runat="server" CssClass="form-group" ScrollBars="Auto">
                    <asp:GridView OnPageIndexChanging="gv_users_PageIndexChanging" runat="server" ID="gv_users" CssClass="table table-bordered" AutoGenerateColumns="False" AllowPaging="true" PageSize="10">
                        <Columns>
                            <asp:TemplateField HeaderText="Foto" SortExpression="Foto" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%# (Eval("Foto")!=DBNull.Value ) ? "<img Height=\"25\" src=\"/Content/Images/users_Avatars/"+Eval("Foto").ToString()+"\">   " : "<img Height=\"25\" src=\"/Content/Images/User.png\">" %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" ReadOnly="True"></asp:BoundField>
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
                            <asp:TemplateField HeaderText="Pessoal" SortExpression="Pessoal">
                                <ItemTemplate><%# (Boolean.Parse(Eval("Pessoal").ToString())) ? "Sim   " : "Não" %></ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="PhoneNumber" HeaderText="Telemovel" SortExpression="PhoneNumber"></asp:BoundField>
                            <asp:BoundField DataField="Pais" HeaderText="Pais" SortExpression="Pais"></asp:BoundField>
                            <asp:TemplateField HeaderText="Activo" SortExpression="Activo">
                                <ItemTemplate>
                                    <%# (Boolean.Parse(Eval("Activo").ToString())) ? "<label style=\"color:green\">Sim</label>" : "<label style=\"color:red\">Não</label>" %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Editar">
                                <ItemTemplate>
                                    <button type="button" class="btn btn-primary" id="bt_editar_user" data-toggle="modal" data-target="#user_edit_model" onclick="EditarUser('<%# Eval("Id") %>')">
                                        Editar  
                                    </button>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ativar/Desativar">
                                <ItemTemplate>
                                    <button type="button" class="btn btn-primary" id="bt_ban_user" data-toggle="modal" data-target="#user_actDesact_model">
                                        Ativar/Desativar  
                                    </button>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="pagination-GW" />
                        <PagerStyle HorizontalAlign="Center" />
                        <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" />
                    </asp:GridView>
                </asp:Panel>
            </div>

            <!--------------------------------------------Ideias----------------------------------------------------------------------------------->
            <div id="ideias_tab" class="tab-pane fade">
                <h3>Ideias</h3>
                <div class="form-group">
                    <div class="form-inline">
                        <div class="input-group">
                            <div class="form-group">
                                <asp:TextBox ID="txtSearch_ideia" CssClass="form-control" runat="server" />
                            </div>
                            <div class="form-group">
                                <asp:DropDownList ID="ddl_ideias_s" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="id_ideia_s">Id</asp:ListItem>
                                    <asp:ListItem Value="nome_ideia_s">Nome</asp:ListItem>
                                    <asp:ListItem Value="criador_ideia_s">Criador</asp:ListItem>
                                    <asp:ListItem Value="visuals_ideia_s">Visualizações</asp:ListItem>
                                    <asp:ListItem Value="data_ideia_s">Data</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <button type="submit" id="buttonSearchIdeia" runat="server" class="btn btn-default" onclick="Search_Ideia" >Submit</button>
                                <%--<asp:Button id="buttonSearchIdeia" Text="Search" runat="server" CssClass="btn btn-primary " OnClick="Search_Ideia" />--%>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:Panel runat="server" CssClass="form-group" ScrollBars="Auto">
                    <asp:GridView ID="gv_ideias" runat="server" CssClass="table table-bordered" OnPageIndexChanging="gv_ideias_PageIndexChanging" AutoGenerateColumns="False" AllowPaging="true" PageSize="10">
                        <Columns>
                            <asp:TemplateField HeaderText="Capa" SortExpression="Capa">
                                <ItemTemplate>
                                    <%# (Eval("Cover")!=DBNull.Value ) ? "<img Height=\"25\" src=\"/Files/Ideas/"+Eval("Id").ToString()+"/"+Eval("Cover").ToString()+"\">   " : "<img Height=\"25\" src=\"/Content/Images/Logos/idea_original.png\">" %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id"></asp:BoundField>
                            <asp:BoundField DataField="Nome" HeaderText="Nome Ideia" SortExpression="Nome"></asp:BoundField>
                            <asp:BoundField DataField="Email" HeaderText="Criador" SortExpression="Email"></asp:BoundField>
                            <asp:TemplateField HeaderText="Descricao" SortExpression="Descricao">
                                <ItemTemplate>
                                    <asp:Label Style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;" ID="review" runat="server" Text='<%# Bind("Descricao") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="100px"></ControlStyle>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Visualizacoes" HeaderText="Visualizacoes" SortExpression="Visualizacoes"></asp:BoundField>
                            <asp:TemplateField HeaderText="Publica" SortExpression="Publica">
                                <ItemTemplate><%# (Boolean.Parse(Eval("Publica").ToString())) ? "Sim   " : "Não" %></ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Data" HeaderText="Data" DataFormatString="{0:MM-dd-yyyy HH:mm }" />
                            <asp:TemplateField ShowHeader="False" HeaderText="Editar">
                                <ItemTemplate>
                                    <button type="button" class="btn btn-primary" id="bt_editar_ideia" data-toggle="modal" data-target="#EditarIdeia" onclick="EditarIdeia('<%# Eval("Id") %>')">
                                        Editar  
                                    </button>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False" HeaderText="Estado">
                                <ItemTemplate>
                                    <asp:Button ID="actDesact" runat="server" data-activo='<%# Eval("Activo") %>' data-id='<%# Eval("Id") %>' OnClick="actDesact_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </div>

            <!--------------------------------------------Erros----------------------------------------------------------------------------------->
            <div id="errors_tab" class="tab-pane fade">
                <h3>Erros</h3>

                <asp:GridView ID="GVErros" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false" DataSourceID="sql_erros">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
                        <asp:BoundField DataField="Titulo" HeaderText="Titulo" SortExpression="Titulo"></asp:BoundField>
                        <asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao"></asp:BoundField>
                        <asp:TemplateField HeaderText="Descrição">
                            <ItemTemplate>
                                <button type="button" class="btn btn-primary " id="bt_editar_erros" data-toggle="modal" data-target="#EditarErros" onclick="Errosedit('<%# Eval("Id") %>')">
                                    Ver  
                                </button>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="sql_erros" runat="server" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT Erros.*, AspNetUsers.Email FROM Erros INNER JOIN AspNetUsers ON Erros.IdUser = AspNetUsers.Id"></asp:SqlDataSource>
            </div>


            <!--------------------------------------------Menu tags----------------------------------------------------------------------------------->
            <div id="tags_tab" class="tab-pane fade">
                <h3>Tags</h3>

                <asp:GridView ID="GVTags" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SQLDS_Tags">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                        <asp:BoundField DataField="Tag" HeaderText="Tag" SortExpression="Tag"></asp:BoundField>
                        <asp:BoundField DataField="Ideias" HeaderText="Ideias" ReadOnly="True" SortExpression="Ideias"></asp:BoundField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <button type="button" class="btn btn-primary " data-toggle="modal" data-target="#EditarrTag">
                                    Editar 
                                </button>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SQLDS_Tags" runat="server" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT Tags.Id, Tags.Tag, COUNT(TagsIdeia.IdTag) AS Ideias FROM Tags LEFT OUTER JOIN TagsIdeia ON Tags.Id = TagsIdeia.IdTag GROUP BY Tags.Tag, Tags.Id"></asp:SqlDataSource>
            </div>
        </div>
    </div>

</asp:Content>
