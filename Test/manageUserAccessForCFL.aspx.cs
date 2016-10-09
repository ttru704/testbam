using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Test.BLL.Controls;
using Test.BLL.User;


namespace Test
{
    public partial class manageUserAccessForCFL : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Update_Click(object sender, EventArgs e)
        {
            string userRef = UserDDL1.SelectedItem.Value.ToString();
            DateTime startDate = StartDate.SelectedDate.GetValueOrDefault();
            DateTime endDate = EndDate.SelectedDate.GetValueOrDefault();
            int status = Convert.ToInt32(StatusToggle.SelectedToggleState.Value);

            UpdateUserAccessDetailBL updateUserAccessDetailBL = new UpdateUserAccessDetailBL();
            updateUserAccessDetailBL.usp_UpdateUserAccessDetail(startDate, endDate, status, userRef);

            GetAllUserAccessInfoG1.DataBind();
        }

        protected void UserDDL1_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {
            
            //GetUserNameBL getUserNameBL = new GetUserNameBL();
            //var userName =  getUserNameBL.usp_GetUserName(e.Value);
            //GetUserInfoBL getUserInfoBL = new GetUserInfoBL();
            //var a = getUserInfoBL.usp_GetUserInfo(userName);
            //StartDate.SelectedDate = a[0].AccessStart;
            //EndDate.SelectedDate = a[0].AccessEnd;
            //if (a[0].Status == "I")
            //{
            //    StatusToggle.SelectedToggleStateIndex = 1;
            //}
            //else if (a[0].Status== "A")
            //{
            //    StatusToggle.SelectedToggleStateIndex = 0;
            //}
            
        }
    }
}