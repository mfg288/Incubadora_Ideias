using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Incubadora_Ideias.Models;

namespace Incubadora_Ideias
{
    public partial class ShowProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //heart
            if (true)
            {
                heart_glyp.Attributes.Add("class", "fa fa-heart fa-stack-2x  heart-activate");
                ban_glyp.Attributes.Add("class", "fa fa-ban fa-stack-3x  fav-activate");
            }
            else
            {
                heart_glyp.Attributes.Add("class", "fa fa-heart fa-stack-2x  heart-deactivate");
                ban_glyp.Attributes.Add("class", "fa fa-ban fa-stack-3x  fav-deactivate");
            }


            //tags
            HtmlButton button = new HtmlButton();
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
                                formIdeia.Tags = new List<string> {reader[0].ToString()};
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
    }
}