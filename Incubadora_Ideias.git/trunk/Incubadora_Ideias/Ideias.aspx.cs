using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace Incubadora_Ideias
{
    public partial class Ideias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid_Ideia();
            BindGrid_fav();
            BindGrid_cov();
        }

        protected void gv_ideias_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_ideias.PageIndex = e.NewPageIndex;
        }

        private void BindGrid_Ideia()//preenche gridview
        {
            string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {

                    cmd.CommandText = "SELECT        Ideias.Nome, Ideias.Descricao, Ideias.Visualizacoes, Ideias.Publica, Ideias.Data, Ideias.Id, Ideias.Activo, AspNetUsers.Email, Ideias.Cover FROM            Ideias INNER JOIN  AspNetUsers ON Ideias.IdUser = AspNetUsers.Id WHERE        (AspNetUsers.Id = @idUser)";
                    cmd.Parameters.AddWithValue("@idUser", User.Identity.GetUserId());
                    cmd.Connection = con;

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
        private void BindGrid_fav()//preenche gridview
        {
            string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {

                    cmd.CommandText = "SELECT Ideias.Nome, Ideias.Descricao, Ideias.Visualizacoes, Ideias.Publica, Ideias.Data, Ideias.Id, Ideias.Activo, AspNetUsers.Email, Ideias.Cover FROM Ideias INNER JOIN Favoritos ON Ideias.Id = Favoritos.IdIdeia INNER JOIN AspNetUsers ON Favoritos.IdUser = AspNetUsers.Id WHERE (AspNetUsers.Id = @idUser)";
                    cmd.Parameters.AddWithValue("@idUser", User.Identity.GetUserId());

                    cmd.Connection = con;

                    DataTable dt = new DataTable();
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt); 
                        gw_fav.DataSource = dt;
                        gw_fav.DataBind();
                    }
                }
            }
        }

        private void BindGrid_cov()//preenche gridview
        {
            string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {


                    cmd.CommandText = "SELECT        Ideias.Nome, Ideias.Descricao, Ideias.Visualizacoes, Ideias.Publica, Ideias.Data, Ideias.Id, Ideias.Activo, AspNetUsers.Email, Ideias.Cover, AspNetUsers.Id AS Expr1 FROM Ideias INNER JOIN  Convites ON Ideias.Id = Convites.IdIdeia INNER JOIN AspNetUsers ON Convites.IdUser = AspNetUsers.Id where (AspNetUsers.Id =@iduser)";
                    cmd.Parameters.AddWithValue("@iduser", User.Identity.GetUserId());
                    cmd.Connection = con;

                    DataTable dt = new DataTable();
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt);
                        gw_cov.DataSource = dt;
                        gw_cov.DataBind();
                    }
                }
            }
        }


        //public static Ideia EditarIdeia(string id)
        //{

        //    var userForm = new Ideia();
        //    userForm.Tags = new List<string>();

        //    try
        //    {

        //        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
        //        {
        //            using (SqlCommand cmd = new SqlCommand("SELECT * FROM Ideias WHERE Id = @id", con))
        //            {
        //                cmd.Parameters.AddWithValue("@id", id);
        //                con.Open();

        //                using (SqlDataReader reader = cmd.ExecuteReader())
        //                {
        //                    if (reader.Read())
        //                    {
        //                        userForm.Titulo = reader[1].ToString();

        //                        userForm.Descricao = reader[2].ToString();



        //                    }
        //                }
        //                con.Close();
        //            }

        //            using (SqlCommand cmd = new SqlCommand("SELECT Tag FROM Tags, TagsIdeia WHERE  id=IdTag and IdIdeia = @id", con))
        //            {
        //                cmd.Parameters.AddWithValue("@id", id);
        //                con.Open();

        //                using (SqlDataReader reader = cmd.ExecuteReader())
        //                {

        //                    while (reader.Read())
        //                    {

        //                        userForm.Tags.Add(reader[0].ToString());
        //                    }
        //                } con.Close();

        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //    }

        //    return userForm;


        //}
    }
}