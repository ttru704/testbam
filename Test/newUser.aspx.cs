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
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();

            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text, Name = NameTextbox.Text, Company_Ref= a };
            IdentityResult result = manager.Create(user, Password.Text);
            var userID = user.Id;
            IdentityResult addrole = manager.AddToRole(userID, "Employee");

            if (result.Succeeded)
            {
                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl("~/dashboard", Response);
            }
            else
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }

        }
    }
}