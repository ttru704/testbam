using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System.Linq;
using Owin;
using Test.Models;
using Test.BLL;
using Test.BLL.User;
using System.Collections.Generic;

namespace Test.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void LogIn(object sender, EventArgs e)

        {
            GetUserInfoBL getUserInfoBL1 = new GetUserInfoBL();
            var a = getUserInfoBL1.usp_GetUserInfo(Email.Text);
            DateTime? accessStart = a[0].AccessStart;
            DateTime? accessEnd = a[0].AccessEnd;
            string status = a[0].Status;
            Boolean? isAdmin = a[0].Is_Admin;
            
            if(accessStart < DateTime.Now && DateTime.Now < accessEnd && status == "A" || isAdmin == true)
            {
                
                if (IsValid)
                {
                    // Validate the user password
                    var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                    var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();

                    // This doesn't count login failures towards account lockout
                    // To enable password failures to trigger lockout, change to shouldLockout: true
                    var result = signinManager.PasswordSignIn(Email.Text, Password.Text, RememberMe.Checked, shouldLockout: false);

                    switch (result)
                    {
                        case SignInStatus.Success:
                            GetUserInfoBL getUserInfoBL2 = new GetUserInfoBL();
                            var b = getUserInfoBL2.usp_GetUserInfo(Email.Text);
                            Session["CompanyRef"] = a[0].Company_Ref;
                            Session["UserRef"] = a[0].Ref_Number;
                            Session["Name"] = a[0].Name;
                            Session["UserName"] = Email.Text;
                            Session["AccessStart"] = a[0].AccessStart;
                            Session["AccessEnd"] = a[0].AccessEnd;
                            Session["Status"] = a[0].Status;

                            Response.Redirect("~/dashboard.aspx");
                            break;
                        case SignInStatus.LockedOut:
                            Response.Redirect("/Account/Lockout");
                            break;
                        case SignInStatus.RequiresVerification:
                            Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}",
                                                            Request.QueryString["ReturnUrl"],
                                                            RememberMe.Checked),
                                              true);
                            break;
                        case SignInStatus.Failure:
                        default:
                            FailureText.Text = "Invalid login attempt";
                            ErrorMessage.Visible = true;
                            break;
                    }
                }
            }
            else
            {
                Session.Abandon();
                Response.Redirect("~/Account/Login.aspx");
            }
        }
    }
}