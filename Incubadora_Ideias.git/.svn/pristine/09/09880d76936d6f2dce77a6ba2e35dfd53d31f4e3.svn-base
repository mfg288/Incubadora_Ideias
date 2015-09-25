using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Incubadora_Ideias.Models;
using System.IO;

namespace Incubadora_Ideias.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var avatarName = Email.Text + Path.GetExtension(fu_register.FileName);
            var tipoUser = true;

            if (rb_empresa.Checked)
            {
                tipoUser = false;
            }

            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text, IdSecret = Int32.Parse(ddl_secret.SelectedValue), SecretAnswer = tb_scrt_resp.Text, Foto = fu_register.HasFile?avatarName:"", Pessoal = tipoUser, IdPais = Int32.Parse(ddl_pais.SelectedValue), PhoneNumber = tb_phone.Text, Activo = true };



            IdentityResult result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {
                manager.AddToRole(user.Id, "User");
                if (fu_register.HasFile)
                {
                    string tempVar = "~/Content/Images/users_Avatars/" + avatarName;
                    fu_register.PostedFile.SaveAs(Server.MapPath(tempVar));
                }
                // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else
            {
                //ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}