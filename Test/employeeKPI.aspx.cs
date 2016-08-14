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
            ListtoDataTableConverter converter = new ListtoDataTableConverter();

            //CustomersSeenByEmployeeCompanyBL customersSeenByEmployeeCompanyBL = new CustomersSeenByEmployeeCompanyBL();
            //List<usp_CustomersSeenByEmployeeCompany_Result> customersSeenByEmployeeCompanyList = customersSeenByEmployeeCompanyBL.usp_CustomersSeenByEmployeeCompany(start, end, 1, 2);


            //DataTable customersSeenByEmployeeCompanyDT = converter.ToDataTable(customersSeenByEmployeeCompanyList);


            //RadHtmlChartGroupDataSource.GroupDataSource(CustomersSeenByEmployeeCompanyRHC1, customersSeenByEmployeeCompanyDT, "Employee_Name", "BarSeries", "Number_Of_Customers_Seen_By_An_Employee", "TimePeriod");

            //AnimalsSeenByEmployeeCompanyBL animalsSeenByEmployeeCompanyBL = new AnimalsSeenByEmployeeCompanyBL();
            //List <usp_AnimalsSeenByEmployeeCompany_Result> animalsSeenByEmployeeCompanyList = animalsSeenByEmployeeCompanyBL.usp_AnimalsSeenByEmployeeCompany(start, end, 1, 2);

            //DataTable animalsSeenByEmployeeCompanyDT = converter.ToDataTable(animalsSeenByEmployeeCompanyList);
            //RadHtmlChartGroupDataSource.GroupDataSource(AnimalsSeenByEmployeeCompanyRHC1, animalsSeenByEmployeeCompanyDT, "Employee_Name", "ColumnSeries", "Number_Of_Animals_Seen_By_An_Employee", "TimePeriod");

            AnimalsSeenIndustryBL animalsSeenIndustryBL = new AnimalsSeenIndustryBL();
            List<usp_AnimalsSeenIndustry_Result> animalsSeenIndustryList = animalsSeenIndustryBL.usp_AnimalsSeenIndustry(start, end, 1, 1, 1);
            DataTable animalsSeenIndustryDT = converter.ToDataTable(animalsSeenIndustryList);
            RadHtmlChartGroupDataSource.GroupDataSource(AnimalsSeenIndustryRHC1, animalsSeenIndustryDT, "Name", "LineSeries", "Number_of_Animals_Seen", "TimePeriod");

            //var redraw = $(".chart").data("kendoChart").redraw();

        }
    }
}