using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Test.BLL.Controls;

namespace Test
{
    public partial class userKpisForCFL : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool admin = Page.User.IsInRole("Admin");
            if (HttpContext.Current.User.Identity.IsAuthenticated == false || admin == false)
                Response.Redirect("~/Account/Login.aspx");
        }

        protected void kpiG1_SelectedCellChanged(object sender, EventArgs e)
        {

        }
        protected void userDDL1_OnClientSelectedIndexChanged(object sender, EventArgs e)
        {
            string userDDL1 = UserDDL1.SelectedItem.Value.ToString();
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            string userRef = UserDDL1.SelectedItem.Value.ToString();

            foreach (GridDataItem item in KPIListForUserG1.Items)
            {
                CheckBox checkBox = item["CheckBoxTemplateColumn"].FindControl("viewableCB") as CheckBox;
                if (checkBox.Checked)
                {
                    //checkedIDs.Add(Convert.ToInt32(item.GetDataKeyValue("Kpi_For_Company")));
                    int kpiRef = Convert.ToInt32(item.GetDataKeyValue("Kpi_For_Company"));
                    InsertIntoKpiForUserBL insertIntoKpiForUserBL = new InsertIntoKpiForUserBL();
                    insertIntoKpiForUserBL.usp_InsertIntoKpiForUser(kpiRef, userRef);
                }
                else
                {
                    int kpiRef = Convert.ToInt32(item.GetDataKeyValue("Kpi_For_Company"));
                    DeleteFromKpiForUserBL deleteFromKpiForUserBL = new DeleteFromKpiForUserBL();
                    deleteFromKpiForUserBL.usp_DeleteFromKpiForUser(kpiRef, userRef);
                }
            }
        }


    }
}