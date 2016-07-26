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
            List<usp_CustomersSeenByEmpCom_Result> customersSeenByEmpComDS = customersSeenByEmpComBL.usp_CustomersSeenByEmpCom(start, end, 1, 1);

            ListtoDataTableConverter converter = new ListtoDataTableConverter();
            DataTable customersSeenByEmpComDT = converter.ToDataTable(customersSeenByEmpComDS);


            RadHtmlChartGroupDataSource.GroupDataSource(CustomersSeenByEmpComRHC1, customersSeenByEmpComDT, "column0", "BarSeries", "column2", "column1");


        }
        //This is a class that help displaying chart with multiple branches
    }
}