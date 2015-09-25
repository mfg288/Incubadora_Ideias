<%@ Page Title="Ideias" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ideias.aspx.cs" Inherits="Incubadora_Ideias.Ideias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-inline">
        <div class="form-group">
            <h2><%: Title %></h2>

        </div>


    </div>

    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#ideia_my" aria-controls="home" role="tab" data-toggle="tab">Minhas</a></li>
        <li role="presentation"><a href="#ideia_fav" aria-controls="profile" role="tab" data-toggle="tab">Favoritas</a></li>
        <li role="presentation"><a href="#ideia_convit" aria-controls="messages" role="tab" data-toggle="tab">Convidadas</a></li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
        <%---------------------------------Minhas ideias--------------------------------------------------%>
        <div role="tabpanel" class="tab-pane  active" id="ideia_my">


            <div id="users_tab" class="tab-pane fade in active">
                <h3>Minhas ideias</h3>
                <div class="form-group">

                    <%---------------------------pesquisa -----------------------------%>
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
                                <asp:Button Text="Search" runat="server" CssClass="btn btn-primary " />
                            </div>
                        </div>

                    </div>
                    <%------------------------fim-pesquisa------------------------ --%>
                </div>
                <%------------------------------------gridview--------------------------------%>
                <asp:Panel runat="server" CssClass="form-group" ScrollBars="Auto">
                    <asp:GridView ID="gv_ideias" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" AllowPaging="true">
                        <Columns>
                            <asp:TemplateField HeaderText="Capa" SortExpression="Capa">
                                <ItemTemplate>
                                    <%# (Eval("Cover")!=DBNull.Value ) ? "<img Height=\"25\" src=\"/Files/Ideas/"+Eval("Id").ToString()+"/"+Eval("Cover").ToString()+"\">   " : "<img Height=\"25\" src=\"/Content/Images/Logos/idea_original.png\">" %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nome Ideia" SortExpression="Nome">
                                <ItemTemplate>
<asp:HyperLink NavigateUrl='<%# "~/ShowProject.aspx?idideia="+ Eval("Id") %>' I runat="server"><%# Eval("Nome")%></asp:HyperLink>                                </ItemTemplate>
                            </asp:TemplateField>

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
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <button type="button" class="btn btn-primary" id="bt_ideia_editarminhasideias" data-toggle="modal">
                                        Editar  
                                
                                    </button>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <button type="button" class="btn btn-primary" id="bt_ideia_convidarminhasideias" data-toggle="modal">
                                        Convites 
                    
                                    </button>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>

                </asp:Panel>
                <%-----------------------------------fim-gridview--------------------------------%>
            </div>
        </div>
        <%--------------------------------fim-Minhas ideias--------------------------------------------------%>
        <%---------------------------------Ideias favoritas--------------------------------------------------%>
        <div role="tabpanel" class="tab-pane fade" id="ideia_fav">




            <div id="users_tabfav" class="tab-pane fade in active">
                <h3>Ideias favoritas </h3>
                <div class="form-group">

                    <%---------------------------pesquisa -----------------------------%>
                    <div class="form-inline">
                        <div class="input-group">
                            <div class="form-group">
                                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" />
                            </div>
                            <div class="form-group">
                                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="id_user_s">Id</asp:ListItem>
                                    <asp:ListItem Value="email_user_s">Email</asp:ListItem>
                                    <asp:ListItem Value="tele_user_s">Telemovel</asp:ListItem>
                                    <asp:ListItem Value="pais_user_s">Pais</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <asp:Button Text="Search" runat="server" CssClass="btn btn-primary " />
                            </div>
                        </div>

                    </div>
                    <%------------------------fim-pesquisa------------------------ --%>
                </div>
                <%------------------------------------gridview--------------------------------%>
                <asp:Panel runat="server" CssClass="form-group" ScrollBars="Auto">
                    <asp:GridView ID="gw_fav" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" AllowPaging="true">
                        <Columns>
                            <asp:TemplateField HeaderText="Capa" SortExpression="Capa">
                                <ItemTemplate>
                                    <%# (Eval("Cover")!=DBNull.Value ) ? "<img Height=\"25\" src=\"/Files/Ideas/"+Eval("Id").ToString()+"/"+Eval("Cover").ToString()+"\">   " : "<img Height=\"25\" src=\"/Content/Images/Logos/idea_original.png\">" %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nome Ideia" SortExpression="Nome">
                                <ItemTemplate>
<asp:HyperLink NavigateUrl='<%# "~/ShowProject.aspx?idideia="+ Eval("Id") %>' I runat="server"><%# Eval("Nome")%></asp:HyperLink>                                </ItemTemplate>
                            </asp:TemplateField>
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
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <button type="button" class="btn btn-primary" id="bt_ideia_editarminhasideias" data-toggle="modal">
                                        Editar  
                                
                                    </button>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <button type="button" class="btn btn-primary" id="bt_ideia_convidarminhasideias" data-toggle="modal">
                                        Convites 
                    
                                    </button>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>

                </asp:Panel>
                <%-----------------------------------fim-gridview--------------------------------%>
            </div>
        </div>
        <%--------------------------------fim-Ideias favoritas--------------------------------------------------%>


        <%---------------------------------Convites --------------------------------------------------%>
        <div role="tabpanel" class="tab-pane fade" id="ideia_convit">
            <%---------------------------------Ideias favoritas--------------------------------------------------%>

            <div id="users_tabcov" class="tab-pane fade in active">
                <h3>Ideias favoritas </h3>
                <div class="form-group">
                    <%---------------------------pesquisa -----------------------------%>
                    <div class="form-inline">
                        <div class="input-group">
                            <div class="form-group">
                                <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" />
                            </div>
                            <div class="form-group">
                                <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="id_user_s">Id</asp:ListItem>
                                    <asp:ListItem Value="email_user_s">Email</asp:ListItem>
                                    <asp:ListItem Value="tele_user_s">Telemovel</asp:ListItem>
                                    <asp:ListItem Value="pais_user_s">Pais</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <asp:Button Text="Search" runat="server" CssClass="btn btn-primary " />
                            </div>
                        </div>

                    </div>
                    <%------------------------fim-pesquisa------------------------ --%>
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                <%------------------------------------gridview--------------------------------%>
                <asp:Panel runat="server" CssClass="form-group" ScrollBars="Auto">
                    <asp:GridView ID="gw_cov" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" AllowPaging="true">
                        <Columns>
                            <asp:TemplateField HeaderText="Capa" SortExpression="Capa">
                                <ItemTemplate>
                                    <%# (Eval("Cover")!=DBNull.Value ) ? "<img Height=\"25\" src=\"/Files/Ideas/"+Eval("Id").ToString()+"/"+Eval("Cover").ToString()+"\">   " : "<img Height=\"25\" src=\"/Content/Images/Logos/idea_original.png\">" %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nome Ideia" SortExpression="Nome">
                                <ItemTemplate>
<asp:HyperLink NavigateUrl='<%# "~/ShowProject.aspx?idideia="+ Eval("Id") %>' I runat="server"><%# Eval("Nome")%></asp:HyperLink>                                </ItemTemplate>
                            </asp:TemplateField>
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
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <button type="button" class="btn btn-primary" id="bt_ideia_editarminhasideias" data-toggle="modal">
                                        Editar  
                                
                                    </button>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <button type="button" class="btn btn-primary" id="bt_ideia_convidarminhasideias" data-toggle="modal">
                                        Convites 
                    
                                    </button>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>

                </asp:Panel>
                <%-----------------------------------fim-gridview--------------------------------%>
            </div>
        </div>
        <%--------------------------------fim-Convites--------------------------------------------------%>
    </div>
    <hr />
    <a href="/CriarIdeia.aspx" class="btn btn-lg btn-primary">Criar Nova Ideia</a>

</asp:Content>
