using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Test.Models;
using Test.BLL.Productivity;

namespace Test
{
    public partial class employeekpi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //This is a class that help displaying chart with multiple branches
        

        protected void Button1_Click(object sender, EventArgs e)
        {
            DateTime start = DatePicker1.SelectedDate.GetValueOrDefault();
            DateTime end = DatePicker2.SelectedDate.GetValueOrDefault();

            CustomersSeenByEmpComBL customersSeenByEmpComBL = new CustomersSeenByEmpComBL();
            List<usp_CustomersSeenByEmpCom_Result> customersSeenByEmpComList = customersSeenByEmpComBL.usp_CustomersSeenByEmpCom(start, end, 1, 2);

            ListtoDataTableConverter converter = new ListtoDataTableConverter();
            DataTable customersSeenByEmpComDT = converter.ToDataTable(customersSeenByEmpComList);


            RadHtmlChartGroupDataSource.GroupDataSource(CustomersSeenByEmpComRHC1, customersSeenByEmpComDT, "Employee_Name", "BarSeries", "Number_Of_Customers_Seen_By_An_Employee", "YearMonth");

            AnimalsSeenByEmpComBL animalsSeenByEmpComBL = new AnimalsSeenByEmpComBL();
            List <usp_AnimalsSeenByEmpCom_Result> animalsSeenByEmpComList = animalsSeenByEmpComBL.usp_AnimalsSeenByEmpCom(start, end, 1, 2);

            DataTable animalsSeenByEmpComDT = converter.ToDataTable(animalsSeenByEmpComList);
            RadHtmlChartGroupDataSource.GroupDataSource(AnimalsSeenByEmpComRHC1, animalsSeenByEmpComDT, "Employee_Name", "ColumnSeries", "Number_Of_Animals_Seen_By_An_Employee", "YearMonth");

        }
    }
}