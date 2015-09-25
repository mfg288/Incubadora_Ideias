using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.UI.HtmlControls;
using Incubadora_Ideias.Models;
using Microsoft.AspNet.Identity;

namespace Incubadora_Ideias
{
	public partial class ShowProject : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{


            HtmlGenericControl ul = new HtmlGenericControl("ul");
            ul.Attributes.Add("id", "comments");
            comments_div.Controls.Add(ul);

            DataTable dt = new DataTable();
            DataTable dt_slave = new DataTable();
            string idideiaUrl = Request.QueryString["idideia"];


            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("select Comentarios.Id,Comentario,Data,Anonimo,IdMaster,IdIdeia,Email ,Foto from Comentarios, AspNetUsers where IdIdeia=@idIdeia and AspNetUsers.id=Comentarios.IdUser and IdMaster is NULL order by Data", con))
                    {
                        cmd.Parameters.AddWithValue("@idIdeia", idideiaUrl);
                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        da.Fill(dt);
                        con.Close();
                    }
                    foreach (DataRow row in dt.Rows)
                    {

                        add_Comment(ul, row[0].ToString(), row[7].ToString(), row[6].ToString(), row[2].ToString(), row[1].ToString(), false, false);

                        using (SqlCommand cmd = new SqlCommand("select Comentarios.Id,Comentario,Data,Anonimo,IdMaster,IdIdeia,Email,Foto from Comentarios, AspNetUsers where IdIdeia=@idIdeia and AspNetUsers.id=Comentarios.IdUser and IdMaster =@idMaster order by Data", con))
                        {
                            cmd.Parameters.AddWithValue("@idIdeia", idideiaUrl);
                            cmd.Parameters.AddWithValue("@idMaster", row[0].ToString());

                            con.Open();
                            SqlDataAdapter da = new SqlDataAdapter(cmd);
                            da.Fill(dt_slave);
                            con.Close();
                        }
                        foreach (DataRow row_slave in dt_slave.Rows)
                        {

                            add_Comment(ul, row_slave[0].ToString(), row_slave[7].ToString(), row_slave[6].ToString(), row_slave[2].ToString(), row_slave[1].ToString(), true, false);

                        }
                        dt_slave.Clear();

                    }
                }
            }
            catch (Exception ex)
            {

            }
            
            
            //heart
			if (true)
			{
				heart_glyp.Attributes.Add("class", "fa fa-heart fa-stack-2x  heart-activate");
				ban_glyp.Attributes.Add("class", "fa fa-ban fa-stack-3x  fav-activate");
			}
			//else
			//{
			//	heart_glyp.Attributes.Add("class", "fa fa-heart fa-stack-2x  heart-deactivate");
			//	ban_glyp.Attributes.Add("class", "fa fa-ban fa-stack-3x  fav-deactivate");
			//}


			//tags
			var button = new HtmlButton();
			button.Attributes.Add("class", "btn btn-default");
			button.Attributes.Add("value", "asdasd");
			button.InnerText = "asd";


			tagstest.Controls.Add(button);














		}

		[WebMethod]
		public static Ideia ObterIdeia(int id)
		{
			var formIdeia = new Ideia();
			formIdeia.Tags = new List<string>();

			try
			{
				using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
				{
					using (var cmd = new SqlCommand("SELECT i.Nome, i.Publica, p.Pontuação, SUM(i.Visualizacoes) sumVisualizacoes, i.Descricao " +
													"FROM Ideias i " +
													"LEFT JOIN Pontação p ON (i.Id = p.IdIdeia) " +
													"WHERE i.Id = @id " +
													"GROUP BY i.Nome, i.Publica, p.Pontuação, i.Descricao", con))
					{
						cmd.Parameters.AddWithValue("@id", id);
						con.Open();

						using (var reader = cmd.ExecuteReader())
						{
							if (reader.Read())
							{
								formIdeia.Titulo = reader[0].ToString();
								formIdeia.Tipo = reader[1].ToString() == "True" ? "Pública" : "Privada";
								formIdeia.Pontuacao = String.IsNullOrEmpty(reader[2].ToString()) ? 0 : Int32.Parse(reader[2].ToString());
								formIdeia.SomaVisualizacoes = String.IsNullOrEmpty(reader[3].ToString()) ? 0 : Int32.Parse(reader[3].ToString());
								formIdeia.Descricao = reader[4].ToString();
							}
						}
					}

					using (var cmd = new SqlCommand("SELECT i.Imagem " +
													"FROM IdeiasImagens i " +
													"WHERE i.IdIdeia = @id", con))
					{
						cmd.Parameters.AddWithValue("@id", id);

						using (var reader = cmd.ExecuteReader())
						{
							if (reader.Read())
							{
								formIdeia.Imagens = new List<string> { reader[0].ToString() };
							}
						}
					}


					using (var cmd = new SqlCommand("SELECT ta.Tag " +
													"FROM TagsIdeia t " +
													"LEFT JOIN Tags ta ON (ta.Id = t.IdTag)" +
													"WHERE t.IdIdeia = @id", con))
					{
						cmd.Parameters.AddWithValue("@id", id);

						using (var reader = cmd.ExecuteReader())
						{
							if (reader.Read())
							{
								formIdeia.Tags = new List<string> { reader[0].ToString() };
							}
						}
						con.Close();
					}
				}
			}
			catch (Exception ex)
			{

			}

			return formIdeia;
		}

		protected void SetFavorito(object sender, EventArgs e)
		{
			try
			{
				using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
				{
					using (var cmd = new SqlCommand("dbo.setIdeiaFavorito", con))
					{

						//antes ver se o nome é usado
						cmd.CommandType = CommandType.StoredProcedure;//dizer que é stored procedure
						cmd.Parameters.AddWithValue("@idIdeia", 1);
						cmd.Parameters.AddWithValue("@idUser", User.Identity.GetUserId());
						con.Open();
					}

					con.Close();
				}
			}
			catch (Exception ex)
			{

			}
		}
        public void add_Comment(HtmlGenericControl parent, string id, string avatarSrc, string userName, string time, string comentraio, bool isMaster, bool anonimo)
        {
            HtmlGenericControl li;
            if (isMaster == true)
            {
                HtmlGenericControl ul = new HtmlGenericControl("ul");
                ul.Attributes.Add("id", "replies");
                parent.Controls.Add(ul);

                li = new HtmlGenericControl("li");
                li.Attributes.Add("class", "cmmnt");
                ul.Controls.Add(li);
            }
            else
            {
                li = new HtmlGenericControl("li");
                li.Attributes.Add("class", "cmmnt");
                parent.Controls.Add(li);
            }


            //avatar
            HtmlGenericControl avatar = new HtmlGenericControl("div");
            avatar.Attributes.Add("class", "avatar");
            li.Controls.Add(avatar);

            HtmlGenericControl a = new HtmlGenericControl("a");
            a.Attributes.Add("href", "javascript:void(0)");
            avatar.Controls.Add(a);

            HtmlGenericControl img = new HtmlGenericControl("img");
            img.Attributes.Add("src", "/Content/Images/users_Avatars" + avatarSrc);
            img.Attributes.Add("width", "55");
            img.Attributes.Add("height", "55");
            img.Attributes.Add("alt", "blabla");
            a.Controls.Add(img);

            //comment
            HtmlGenericControl comment = new HtmlGenericControl("div");
            comment.Attributes.Add("class", "cmmnt-content");
            li.Controls.Add(comment);

            HtmlGenericControl header = new HtmlGenericControl("header");
            comment.Controls.Add(header);

            HtmlGenericControl a_comment = new HtmlGenericControl("a");
            a_comment.Attributes.Add("class", "userlink");
            if (anonimo == false)
            {
                a_comment.Attributes.Add("href", "#");
                a_comment.InnerText = userName;
            }
            else
            {
                a_comment.InnerText = "Anonimo";
            }


            header.Controls.Add(a_comment);

            HtmlGenericControl span_comment = new HtmlGenericControl("span");
            span_comment.Attributes.Add("class", "pubdate");
            span_comment.InnerText = " - " + time;
            header.Controls.Add(span_comment);

            HtmlGenericControl p_comment = new HtmlGenericControl("p");
            p_comment.InnerText = comentraio;
            comment.Controls.Add(p_comment);

        }


	}
}