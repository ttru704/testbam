using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Test.Models;
using Test.BLL.Productivity;
using System.Data;

namespace Test
{
    public partial class ECompanyCS : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
                if (Session["StartDate"] != null)
                {
                    DateTime? start = Session["StartDate"] as DateTime?;
                    DateTime? end = Session["EndDate"] as DateTime?;
                    int? company = Session["Company"] as int?;
                    int? branch = Session["Branch"] as int?;
                    int? time = Session["Time"] as int?;


                    ListtoDataTableConverter converter = new ListtoDataTableConverter();

                    CustomersSeenByEmployeeCompanyBL customersSeenByEmployeeCompanyBL = new CustomersSeenByEmployeeCompanyBL();
                    List<usp_CustomersSeenByEmployeeCompany_Result> customersSeenByEmployeeCompanyList = customersSeenByEmployeeCompanyBL.usp_CustomersSeenByEmployeeCompany(start, end, 1, 2);
                    DataTable customersSeenByEmployeeCompanyDT = converter.ToDataTable(customersSeenByEmployeeCompanyList);
                    RadHtmlChartGroupDataSource.GroupDataSource(CustomersSeenByEmployeeCompanyRHC1, customersSeenByEmployeeCompanyDT, "Employee_Name", "BarSeries", "Number_Of_Customers_Seen_By_An_Employee", "TimePeriod");

                    AnimalsSeenByEmployeeCompanyBL animalsSeenByEmployeeCompanyBL = new AnimalsSeenByEmployeeCompanyBL();
                    List<usp_AnimalsSeenByEmployeeCompany_Result> animalsSeenByEmployeeCompanyList = animalsSeenByEmployeeCompanyBL.usp_AnimalsSeenByEmployeeCompany(start, end, 1, 2);

                    DataTable animalsSeenByEmployeeCompanyDT = converter.ToDataTable(animalsSeenByEmployeeCompanyList);
                    RadHtmlChartGroupDataSource.GroupDataSource(AnimalsSeenByEmployeeCompanyRHC1, animalsSeenByEmployeeCompanyDT, "Employee_Name", "ColumnSeries", "Number_Of_Animals_Seen_By_An_Employee", "TimePeriod");

                }
            
        }
    }
}