using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Incubadora_Ideias.Models;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Collections.Generic;
using System.Diagnostics;
using System.Data;
using System.Text.RegularExpressions;

namespace Incubadora_Ideias
{
    public partial class BackOffice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid_User();
            BindGrid_Ideia();
            ideia_act_des_refresh();

        }

        //-------------------------------------U-S-E-R-S----------------------------------------------------
        private void BindGrid_User()//preenche gridview
        {
            string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    string user_field = "";
                    switch (ddl_user_s.SelectedValue)
                    {
                        case "id_user_s":
                            user_field = "AspNetUsers.Id";
                            break;
                        case "email_user_s":
                            user_field = "AspNetUsers.Email";
                            break;
                        case "tele_user_s":
                            user_field = "AspNetUsers.PhoneNumber";
                            break;
                        case "pais_user_s":
                            user_field = "Pais.Pais";
                            break;
                    }
                    cmd.CommandText = "SELECT Pais.Pais, AspNetUsers.Id, AspNetUsers.Pessoal, AspNetUsers.Email, AspNetUsers.PhoneNumber, AspNetUsers.IdSecret, AspNetUsers.SecretAnswer, Perguntas.Secret, AspNetUsers.Foto, AspNetUsers.Activo FROM AspNetUsers INNER JOIN Pais ON AspNetUsers.IdPais = Pais.Id INNER JOIN Perguntas ON AspNetUsers.IdSecret = Perguntas.Id where " + user_field + " LIKE '%'+@field+'%'";
                    cmd.Connection = con;
                    cmd.Parameters.AddWithValue("@field", txtSearch_user.Text.Trim());

                    DataTable dt = new DataTable();
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt);
                        gv_users.DataSource = null;
                        gv_users.DataSourceID = null;
                        gv_users.DataKeyNames = null;

                        gv_users.DataSource = dt;
                        gv_users.DataBind();
                    }
                }
            }

        }

        protected void Search_User(object sender, EventArgs e)
        {
            BindGrid_User();
            if (txtSearch_user.Text != "")
            {
                foreach (GridViewRow row in gv_users.Rows)
                {
                    switch (ddl_user_s.SelectedValue)
                    {
                        case "id_user_s": highlight(row, 1, txtSearch_user);
                            break;
                        case "email_user_s": highlight(row, 2, txtSearch_user);
                            break;
                        case "tele_user_s": highlight(row, 4, txtSearch_user);
                            break;
                        case "pais_user_s": highlight(row, 5, txtSearch_user);
                            break;
                    }
                }
            }
        }

        protected void gv_users_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_users.PageIndex = e.NewPageIndex;
            BindGrid_User();
        }

        [WebMethod]
        public static User EditarUser(string id)
        {
            var usersForm = new User();
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT  Id,IdPais, Pessoal, Email, PhoneNumber, IdSecret, SecretAnswer, Foto FROM AspNetUsers where  Id=@id", con))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        con.Open();

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                usersForm.Id = reader[0].ToString();
                                usersForm.Pais = (int)reader[1];
                                usersForm.Pessoal = (bool)reader[2];
                                usersForm.Email = reader[3].ToString();
                                usersForm.Telefone = reader[4].ToString();
                                usersForm.PerguntaSecreta = (int)reader[5];
                                usersForm.RespostaSecreta = reader[6].ToString();
                                usersForm.Foto = reader[7].ToString();
                            }
                        }
                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return usersForm;
        }

        protected void bt_grava_edit_user(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("UPDATE AspNetUsers SET IdSecret = @secret, SecretAnswer = @secretResp, Foto = @foto, Pessoal = @pessoal, IdPais = @pais, Email = @email , PhoneNumber = @tele , UserName = @email Where Id = @id", con))
                    {
                        cmd.Parameters.AddWithValue("@id", tb_id_user.Text);
                        cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                        if (rb_pessoal.Checked)
                            cmd.Parameters.AddWithValue("@pessoal", true);

                        else if (rb_empresa.Checked)
                            cmd.Parameters.AddWithValue("@pessoal", false);

                        cmd.Parameters.AddWithValue("@pais", ddl_pais.SelectedValue);
                        cmd.Parameters.AddWithValue("@secret", ddl_secret.SelectedValue);
                        cmd.Parameters.AddWithValue("@secretResp", tb_scrt_resp.Text);
                        cmd.Parameters.AddWithValue("@tele", tb_phone.Text);

                        if (tb_fi_user.PostedFile != null && tb_fi_user.HasFile)
                            cmd.Parameters.AddWithValue("@foto", txtEmail.Text + Path.GetExtension(tb_fi_user.FileName));


                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        if (tb_fi_user.PostedFile != null && tb_fi_user.HasFile)
                        {
                            tb_fi_user.PostedFile.SaveAs(Server.MapPath("/Content/Images/users_Avatars/" + txtEmail.Text + Path.GetExtension(tb_fi_user.FileName)));
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
            finally
            {
                BindGrid_User();
            }
        }


        //-------------------------------------I-D-E-I-A-S-----------------------------------------------------
        private void BindGrid_Ideia()//preenche gridview
        {
            string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    string user_field = "";
                    switch (ddl_ideias_s.SelectedValue)
                    {
                        case "id_ideia_s":
                            user_field = "Ideias.Id";
                            break;
                        case "nome_ideia_s":
                            user_field = "Ideias.Nome";
                            break;
                        case "criador_ideia_s":
                            user_field = "AspNetUsers.Email";
                            break;
                        case "visuals_ideia_s":
                            user_field = "Ideias.Visualizacoes";
                            break;
                        case "data_ideia_s":
                            user_field = "Ideias.Data";
                            break;
                    }
                    cmd.CommandText = "SELECT Ideias.Nome, Ideias.Descricao, Ideias.Visualizacoes, Ideias.Publica, Ideias.Data, Ideias.Id, Ideias.Activo, AspNetUsers.Email, Ideias.Cover FROM Ideias INNER JOIN AspNetUsers ON Ideias.IdUser = AspNetUsers.Id where " + user_field + " LIKE '%'+@field+'%'";
                    cmd.Connection = con;
                    cmd.Parameters.AddWithValue("@field", txtSearch_ideia.Text.Trim());

                    DataTable dt = new DataTable();
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt);
                        gv_ideias.DataSource = null;
                        gv_ideias.DataSourceID = null;
                        gv_ideias.DataKeyNames = null;

                        gv_ideias.DataSource = dt;
                        gv_ideias.DataBind();
                    }
                }
            }
        }
        protected void Search_Ideia(object sender, EventArgs e)
        {
            //BindGrid_Ideia();
            if (txtSearch_ideia.Text != "")
            {
                foreach (GridViewRow row in gv_ideias.Rows)
                {
                    switch (ddl_ideias_s.SelectedValue)
                    {
                        case "id_ideia_s": highlight(row, 1, txtSearch_ideia);
                            break;
                        case "nome_ideia_s": highlight(row, 2, txtSearch_ideia);
                            break;
                        case "criador_ideia_s": highlight(row, 3, txtSearch_ideia);
                            break;
                        case "visuals_ideia_s": highlight(row, 5, txtSearch_ideia);
                            break;
                        case "data_ideia_s": highlight(row, 7, txtSearch_ideia);
                            break;
                    }
                }
            }
        }
        protected void gv_ideias_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_ideias.PageIndex = e.NewPageIndex;
            BindGrid_Ideia();
        }

        [WebMethod]
        public static Ideia EditarIdeia(string id)
        {

            var userForm = new Ideia();
            userForm.Tags = new List<string>();

            try
            {

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM Ideias WHERE Id = @id", con))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        con.Open();

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                userForm.Titulo = reader[1].ToString();

                                userForm.Descricao = reader[2].ToString();



                            }
                        }
                        con.Close();
                    }

                    using (SqlCommand cmd = new SqlCommand("SELECT Tag FROM Tags, TagsIdeia WHERE  id=IdTag and IdIdeia = @id", con))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        con.Open();

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {

                            while (reader.Read())
                            {

                                userForm.Tags.Add(reader[0].ToString());
                            }
                        } con.Close();

                    }
                }
            }
            catch (Exception ex)
            {

            }

            return userForm;


        }



        protected void actDesact_Click(object sender, EventArgs e)
        {
            //  ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);

            Button bt_mudar = (Button)sender;
            var id = bt_mudar.Attributes["data-id"];
            var estdado = bt_mudar.Attributes["data-activo"];

            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("update Ideias set Activo=@activo where id=@id", con))
                    {
                        //parametros
                        cmd.Parameters.AddWithValue("@id", id);


                        if (estdado == "True")
                        {
                            cmd.Parameters.AddWithValue("@activo", false);

                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@activo", true);
                        }

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (SqlException ex)
            {
                //Display Error message

            }
            finally
            {
                gv_ideias.DataBind();
                foreach (GridViewRow row in gv_ideias.Rows)
                {
                    Button actdesactbtn = (Button)row.FindControl("actDesact");
                    if (actdesactbtn.Attributes["data-activo"] == "True")
                    {
                        actdesactbtn.CssClass = "btn btn-danger";
                        actdesactbtn.Text = "Desativar";
                    }
                    else
                    {
                        actdesactbtn.CssClass = "btn btn-success";
                        actdesactbtn.Text = "Ativar";
                    }

                }





            }
        }
        public void ideia_act_des_refresh()
        {


            if (gv_ideias.Rows.Count != 0)
            {
                foreach (GridViewRow row in gv_ideias.Rows)
                {
                    Button actdesactbtn = (Button)row.FindControl("actDesact");
                    if (actdesactbtn.Attributes["data-activo"] == "True")
                    {
                        actdesactbtn.CssClass = "btn btn-danger";
                        actdesactbtn.Text = "Desativar";
                    }
                    else
                    {
                        actdesactbtn.CssClass = "btn btn-success";
                        actdesactbtn.Text = "Ativar";
                    }

                }
            }
        }



        //-------------------------------------E-R-R-O-R-S-----------------------------------------------------
        [WebMethod]
        public static EditarErros Errosedit(string Id)
        {

            var userForm = new EditarErros();
            try
            {

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT A.Id AS ERROID, Email, A.Descricao, Url, IdUser, Titulo, AspNetUsers.Email FROM Erros A, AspNetUsers  WHERE AspNetUsers.Id=A.IdUser and a.Id=@id", con))
                    {
                        cmd.Parameters.AddWithValue("@id", Id);
                        con.Open();

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {

                                userForm.Descricao = reader[2].ToString();
                                userForm.ID = (int)reader[0];
                                userForm.Titulo = reader[5].ToString();
                                userForm.User = reader[4].ToString();
                                userForm.UserName = reader[6].ToString();

                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }

            return userForm;


        }









        private void highlight(GridViewRow row, int field, TextBox tb)
        {
            row.Cells[field].Text = Regex.Replace(row.Cells[field].Text, tb.Text.Trim(), delegate(Match match)
            {
                return string.Format("<span style = 'background-color:yellow'>{0}</span>", match.Value);
            }, RegexOptions.IgnoreCase);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterClientScriptBlock(GetType(), "Email", "selecttab();", true);

        }
    }
}