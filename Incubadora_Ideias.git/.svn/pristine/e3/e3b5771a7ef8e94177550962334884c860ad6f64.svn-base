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
using System.Collections;

namespace Incubadora_Ideias
{
    public partial class CriarIdeia : System.Web.UI.Page
    {
        protected void create_Idea(object sender, EventArgs e)
        {
            var publica = true;
            if (rbPublica.Checked)
            {
                publica = true;
            }
            else if (rbPrivada.Checked)
            {
                publica = false;
            }

            string[] tags = inpTags.Value.Split(',');
            string[] convits = getListBoxItems(lb_covit);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + lb_covit.Attributes["data-selected"] + "')", true);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + convits + "')", true);

            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("dbo.addIdea", con))
                    {

                        //antes ver se o nome é usado
                        cmd.CommandType = CommandType.StoredProcedure;//dizer que é stored procedure
                        //parametros
                        cmd.Parameters.AddWithValue("@nome", inpName.Value);
                        cmd.Parameters.AddWithValue("@descript", taDesc.Value);
                        cmd.Parameters.AddWithValue("@publica", publica);
                        cmd.Parameters.AddWithValue("@iduser", User.Identity.GetUserId());
                        if (fu_cover.HasFiles)
                        {
                            cmd.Parameters.AddWithValue("@cover", fu_cover.FileName);
                        }



                        //tags
                        DataTable tagsTable = new DataTable();
                        tagsTable.Columns.Add("column");
                        foreach (string tag in tags)
                        {
                            tagsTable.Rows.Add(tag);
                        }
                        SqlParameter tagsParam = cmd.Parameters.AddWithValue("@tags", tagsTable);
                        tagsParam.SqlDbType = SqlDbType.Structured;




                        //convits
                        DataTable convitTable = new DataTable();
                        convitTable.Columns.Add("column");
                        foreach (string convit in convits)
                        {
                            convitTable.Rows.Add(convit);
                        }
                        SqlParameter convParam = cmd.Parameters.AddWithValue("@convt", convitTable);
                        convParam.SqlDbType = SqlDbType.Structured;





                        //Gallery
                        DataTable galleryTable = new DataTable();
                        galleryTable.Columns.Add("column");
                        if (fu_gallery.HasFiles)
                        {
                            foreach (HttpPostedFile file in fu_gallery.PostedFiles)
                            {
                                galleryTable.Rows.Add(file.FileName);
                            }
                        }
                        SqlParameter ImageParam = cmd.Parameters.AddWithValue("@gallery", galleryTable);
                        ImageParam.SqlDbType = SqlDbType.Structured;




                        //anexs
                        DataTable anexTable = new DataTable();
                        anexTable.Columns.Add("column");
                        if (fu_attach.HasFiles)
                        {
                            foreach (HttpPostedFile file in fu_attach.PostedFiles)
                            {
                                anexTable.Rows.Add(file.FileName);
                            }
                        }
                        SqlParameter anexParam = cmd.Parameters.AddWithValue("@anex", anexTable);
                        anexParam.SqlDbType = SqlDbType.Structured;







                        //get output
                        SqlParameter existsIdea = new SqlParameter();
                        existsIdea.ParameterName = "@exists";
                        existsIdea.SqlDbType = SqlDbType.Bit;
                        existsIdea.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(existsIdea);








                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (SqlException ex)
            {
                //Log exception
                //Display Error message
            }
            finally
            {

            }
        }

        protected void testb_Click(object sender, EventArgs e)
        {

            IEnumerator keys = lb_covit.Attributes.Keys.GetEnumerator();
            String bla = "";
            while (keys.MoveNext())
            {

                String key = (String)keys.Current;
                bla += key + "=" + lb_covit.Attributes[key];

            }

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + bla + "')", true);

        }

        public string[] getListBoxItems(ListBox lb_covit)
        {
            string[] arr = new string[lb_covit.Items.Count];
            for (int i = 0; i < lb_covit.Items.Count; i++)
            {
                arr[i] = lb_covit.Items[i].ToString();
            }
            return arr;
        }
    }
}
