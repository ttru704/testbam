using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Test.Models;
using System.Collections.Generic;
using Microsoft.AspNet.Identity.EntityFramework;
using Test.BLL.Controls;

namespace Test
{
    public partial class createUserforCFL : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool admin = Page.User.IsInRole("Admin");
            if (HttpContext.Current.User.Identity.IsAuthenticated == false || admin == false)
                Response.Redirect("~/Account/Login.aspx");
        }
        protected void CreateUser_Click(object sender, EventArgs e)
        {

            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();

            //Commented this line out because it triggers logging in user after they have been registered sucessfully. It will cause exception when admin or clinic manager register a new user (it is triggered when result is succeeded)
            //var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();

            var user = new ApplicationUser() { UserName = Username.Text, Email = Email.Text, Name = NameTextbox.Text, Company_Ref = Convert.ToInt64(companyIdDropdown.SelectedItem.Value) };
            IdentityResult result = manager.Create(user, Password.Text);
            var userID = user.Id;
            IdentityResult addrole = manager.AddToRole(userID, RoleDDL.SelectedItem.Text);
            UpdateIsAdminStatusBL updateIsAdminStatusBL = new UpdateIsAdminStatusBL();
            updateIsAdminStatusBL.usp_UpdateIsAdminStatus(Username.Text, RoleDDL.SelectedItem.Text);
            //Almost worked. BUt gets the logged in user's ID
            //User.Identity.GetUserId()

            //string email = Email.Text;
            //UserIdBL userIdBL = new UserIdBL();
            //var UserId = userIdBL.usp_UserId(email);

            //DropDownList1.DataBind();
            //var RoleId = DropDownList1.SelectedValue;

            //UserRoleInsertBL userRoleInsertBL = new UserRoleInsertBL();
            //List<usp_UserRoleInsert_Result> userRoleInsertList = userRoleInsertBL.usp_UserRoleInsert(UserId, RoleId);

            // entity framework insert

            //var companyNumber = int.Parse(companyNumberTextbox.Text);
            //var companyName = companyNameTextbox.Text;
            //var businessType = int.Parse(BusinessTypeTextbox.Text);


            //CompanyInfoInsertBL companyInfoInsertBL = new CompanyInfoInsertBL();
            //companyInfoInsertBL.usp_CompanyInfoInsert(companyNumber, companyName, businessType);



            if (result.Succeeded)
            {
                // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                //Commented this line out because it triggers logging in user after they have been registered sucessfully. It will cause exception when admin or clinic manager register a new user (it is triggered when result is succeeded)
                //signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);

                Message.Text = "A new user has been sucessfully created";
                //IdentityHelper.RedirectToReturnUrl("~/dashboard", Response);

            }
            else
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }

        }
    }
}