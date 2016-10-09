using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System.Threading.Tasks;
using Test.Models;
using Test.Models.Interface.User;
using Test.BLL.User;
using Telerik.Web.UI;

namespace Test
{
    public partial class addPhoneNumber : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
                Response.Redirect("~/Account/Login.aspx");

            if (!IsPostBack)
            {
                string userName = Session["UserName"] as string;
                GetUserInfoBL getUserInfoBL = new GetUserInfoBL();
                List<usp_GetUserInfo_Result> getUserInfoList = getUserInfoBL.usp_GetUserInfo(userName);
                FullName.Text = getUserInfoList[0].Name;
                ContactNumber.Text = getUserInfoList[0].PhoneNumber;
                EmailAddress.Text = getUserInfoList[0].Email;
            }
        }
        protected void SubmitEdit_Click(object sender, EventArgs e)
        {
            string userRef = Session["UserRef"] as string;
            UpdateUserProfileBL updateUserProfile = new UpdateUserProfileBL();
            updateUserProfile.usp_UpdateUserProfile(userRef, FullName.Text, EmailAddress.Text, ContactNumber.Text);
            Message.Text = "You have successfully edited your profile";
        }
        
        
    }
}