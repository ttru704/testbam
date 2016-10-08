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
    public partial class companyKpis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool admin = Page.User.IsInRole("Admin");
            if (HttpContext.Current.User.Identity.IsAuthenticated == false || admin == false)
                Response.Redirect("~/Account/Login.aspx");
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            long companyRef = Convert.ToInt64(CompanyListCB1.SelectedItem.Value);

            foreach (GridDataItem item in kpiG1.Items)
            {
                CheckBox checkBox = item["CheckBoxTemplateColumn"].FindControl("viewableCB") as CheckBox;
                if (checkBox.Checked)
                {
                    //checkedIDs.Add(Convert.ToInt32(item.GetDataKeyValue("Kpi_For_Company")));
                    int kpiRef = Convert.ToInt32(item.GetDataKeyValue("Kpi_For_Business"));
                    InsertIntoKpiForCompanyBL insertIntoKpiForCompanyBL = new InsertIntoKpiForCompanyBL();
                    insertIntoKpiForCompanyBL.usp_InsertIntoKpiForCompany(kpiRef, companyRef);
                }
                else
                {
                    int kpiRef = Convert.ToInt32(item.GetDataKeyValue("Kpi_For_Business"));
                    DeleteFromKpiForCompanyBL deleteFromKpiForCompanyBL = new DeleteFromKpiForCompanyBL();
                    deleteFromKpiForCompanyBL.usp_DeleteFromKpiForCompany(kpiRef, companyRef);
                }
            }
        }
    }
}