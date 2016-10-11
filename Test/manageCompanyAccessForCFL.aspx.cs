using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Test.BLL.User;

namespace Test
{
    public partial class manageCompanyAccessForCFL : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetCompanyAccessDetailG1.DataBind();
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            long companyRef = Convert.ToInt64(CompanyDDL1.SelectedItem.Value);
            DateTime startDate = StartDate.SelectedDate.GetValueOrDefault();
            DateTime endDate = EndDate.SelectedDate.GetValueOrDefault();

            UpdateCompanyAccessDetailBL updateCompanyAccessDetailBL = new UpdateCompanyAccessDetailBL();
            updateCompanyAccessDetailBL.usp_UpdateCompanyAccessDetail(startDate, endDate, companyRef);

            GetCompanyAccessDetailG1.DataBind();
        }
    }
}