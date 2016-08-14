using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Telerik.Web.UI.GridExcelBuilder;
using Test.BLL.Customer;
using Test.Models;
using xi = Telerik.Web.UI.ExportInfrastructure;
using System.Drawing;


namespace Test
{
    public partial class customerkpi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

        protected void Button1_Click(object sender, EventArgs e)
        {
            UniqueCustomersSeenCompanyRHC1.DataBind();

            DateTime start = DatePicker1.SelectedDate.GetValueOrDefault();
            DateTime end = DatePicker2.SelectedDate.GetValueOrDefault();
            int company = Convert.ToInt32(CompanyDDL1.SelectedItem.Value);
            int branch = Convert.ToInt32(BranchDDL1.SelectedItem.Value);
            int time = Convert.ToInt32(TimeDDL1.SelectedItem.Value);


            UniqueCustomersSeenBranchBL uniqueCustomersSeenBranchBL = new UniqueCustomersSeenBranchBL();
            List<usp_UniqueCustomersSeenBranch_Result> uniqueCustomersSeenBranchList = uniqueCustomersSeenBranchBL.usp_UniqueCustomersSeenBranch(start, end, company, branch, time);

            ListtoDataTableConverter converter = new ListtoDataTableConverter();
            DataTable uniqueCustomersSeenBranchDT = converter.ToDataTable(uniqueCustomersSeenBranchList);

            RadHtmlChartGroupDataSource.GroupDataSource(UniqueCustomersSeenBranchRHC1, uniqueCustomersSeenBranchDT, "Branch_Name", "LineSeries", "Number_of_Unique_Clients", "TimePeriod");

            AnimalsSeenCompanyRHC1.DataBind();

            AnimalsSeenBranchBL animalsSeenBranchBL = new AnimalsSeenBranchBL();
            List<usp_AnimalsSeenBranch_Result> animalsSeenBranchList = animalsSeenBranchBL.usp_AnimalsSeenBranch(start, end, company, branch, time);

            DataTable animalsSeenBranchDT = converter.ToDataTable(animalsSeenBranchList);

            RadHtmlChartGroupDataSource.GroupDataSource(AnimalsSeenBranchRHC1, animalsSeenBranchDT, "Branch_Name", "BarSeries", "Number_of_Animals_Seen", "TimePeriod");

            AvgDollarPerCustomerCompanyRHC1.DataBind();

            AvgDollarPerCustomerBranchBL avgDollarPerCustomerBranchBL = new AvgDollarPerCustomerBranchBL();
            List<usp_AvgDollarPerCustomerBranch_Result> avgDollarPerCustomerBranchList = avgDollarPerCustomerBranchBL.usp_AvgDollarPerCustomerBranch(start, end, company, branch, time);

            DataTable avgDollarPerCustomerBranchDT = converter.ToDataTable(avgDollarPerCustomerBranchList);
            RadHtmlChartGroupDataSource.GroupDataSource(AvgDollarPerCustomerBranchRHC1, avgDollarPerCustomerBranchDT, "Branch_Name", "BarSeries", "Average_Dollar_per_Customer", "TimePeriod");

            NewCustomersBranchBL newCustomersBranchBL = new NewCustomersBranchBL();
            List<usp_NewCustomersBranch_Result> newCustomersBranchList = newCustomersBranchBL.usp_NewCustomersBranch(start, end, company, branch, time);

            DataTable newCustomersBranchDT = converter.ToDataTable(newCustomersBranchList);
            RadHtmlChartGroupDataSource.GroupDataSource(NewCustomersBranchRHC1, newCustomersBranchDT, "Branch_Name", "BarSeries", "Number_of_New_Customers", "TimePeriod");

            NewCustomersCompanyRHC1.DataBind();

            SmallAnimalsCompanyRHC1.DataBind();

            LargeAnimalsCompanyRHC1.DataBind();
            
        }

        protected void RadGrid2_ExcelMLWorkBookCreated(object sender, GridExcelMLWorkBookCreatedEventArgs e)
        {
                foreach (RowElement row in e.WorkBook.Worksheets[0].Table.Rows)
                {
                    row.Cells[0].StyleValue = "Style1";
                }

                StyleElement style = new StyleElement("Style1");
                style.InteriorStyle.Pattern = InteriorPatternType.Solid;
                style.InteriorStyle.Color = System.Drawing.Color.LightGray;
                e.WorkBook.Styles.Add(style);
        }

        protected void RadButton1_Click(object sender, EventArgs e)
        {
            RadGrid2.MasterTableView.ExportToExcel();
        }
    }
}