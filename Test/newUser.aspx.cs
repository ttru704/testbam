using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Test.Models;

namespace Test
{
    public partial class newUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["IsAuthenticated"] = HttpContext.Current.User.Identity.IsAuthenticated;
            Boolean? authentication = Session["IsAuthenticated"] as Boolean?;
            if (authentication == true)
            {
                Int64? CompanyRef = Session["CompanyRef"] as Int64?;
                var a = CompanyRef.Value;
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx");
            }
        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            Int64? CompanyRef = Session["CompanyRef"] as Int64?;
            var a = CompanyRef.Value;

            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();

            //Commented this line out because it triggers logging in user after they have been registered sucessfully. It will cause exception when admin or clinic manager register a new user (it is triggered when result is succeeded)

            //var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();

            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text, Name = NameTextbox.Text, Company_Ref= a };
            IdentityResult result = manager.Create(user, Password.Text);
            var userID = user.Id;
            IdentityResult addrole = manager.AddToRole(userID, "Employee");

            if (result.Succeeded)
            {
                //Commented this line out because it triggers logging in user after they have been registered sucessfully. It will cause exception when admin or clinic manager register a new user (it is triggered when result is succeeded)
                //signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);

                //IdentityHelper.RedirectToReturnUrl("~/dashboard", Response);

                Message.Text = "A new user has been sucessfully created";
            }
            else
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }

        }
    }
}