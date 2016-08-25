using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI.GridExcelBuilder;
using Test.BLL.Customer;
using Test.Models;

namespace Test
{
    public partial class CBranchCS : System.Web.UI.UserControl
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

                UniqueCustomersSeenBranchBL uniqueCustomersSeenBranchBL = new UniqueCustomersSeenBranchBL();
                List<usp_UniqueCustomersSeenBranch_Result> uniqueCustomersSeenBranchList = uniqueCustomersSeenBranchBL.usp_UniqueCustomersSeenBranch(start, end, company, branch, time);
                DataTable uniqueCustomersSeenBranchDT = converter.ToDataTable(uniqueCustomersSeenBranchList);
                RadHtmlChartGroupDataSource.GroupDataSource(UniqueCustomersSeenBranchRHC1, uniqueCustomersSeenBranchDT, "Branch_Name", "LineSeries", "Number_of_Unique_Clients", "TimePeriod");



                AnimalsSeenBranchBL animalsSeenBranchBL = new AnimalsSeenBranchBL();
                List<usp_AnimalsSeenBranch_Result> animalsSeenBranchList = animalsSeenBranchBL.usp_AnimalsSeenBranch(start, end, company, branch, time);
                DataTable animalsSeenBranchDT = converter.ToDataTable(animalsSeenBranchList);
                RadHtmlChartGroupDataSource.GroupDataSource(AnimalsSeenBranchRHC1, animalsSeenBranchDT, "Branch_Name", "BarSeries", "Number_of_Animals_Seen", "TimePeriod");

                AvgDollarPerCustomerBranchBL avgDollarPerCustomerBranchBL = new AvgDollarPerCustomerBranchBL();
                List<usp_AvgDollarPerCustomerBranch_Result> avgDollarPerCustomerBranchList = avgDollarPerCustomerBranchBL.usp_AvgDollarPerCustomerBranch(start, end, company, branch, time);
                DataTable avgDollarPerCustomerBranchDT = converter.ToDataTable(avgDollarPerCustomerBranchList);
                RadHtmlChartGroupDataSource.GroupDataSource(AvgDollarPerCustomerBranchRHC1, avgDollarPerCustomerBranchDT, "Branch_Name", "BarSeries", "Average_Dollar_per_Customer", "TimePeriod");

                

                NewCustomersBranchBL newCustomersBranchBL = new NewCustomersBranchBL();
                List<usp_NewCustomersBranch_Result> newCustomersBranchList = newCustomersBranchBL.usp_NewCustomersBranch(start, end, company, branch, time);

                DataTable newCustomersBranchDT = converter.ToDataTable(newCustomersBranchList);
                RadHtmlChartGroupDataSource.GroupDataSource(NewCustomersBranchRHC1, newCustomersBranchDT, "Branch_Name", "BarSeries", "Number_of_New_Customers", "TimePeriod");
                NewCustomersBranchRHC1.ChartTitle.Text = "No of New Customers Branch Comparison";
                NewCustomersBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Time Period";
                NewCustomersBranchRHC1.PlotArea.YAxis.TitleAppearance.Text = "No of New Customers";



                SmallAnimalsBranchBL smallAnimalsBranchBL = new SmallAnimalsBranchBL();
                List<usp_SmallAnimalsBranch_Result> smallAnimalsBranchList = smallAnimalsBranchBL.usp_SmallAnimalsBranch(start, end, company, branch, time);
                DataTable smallAnimalsBranchDT = converter.ToDataTable(smallAnimalsBranchList);
                RadHtmlChartGroupDataSource.GroupDataSource(SmallAnimalsBranchRHC1, smallAnimalsBranchDT, "Branch_Name", "LineSeries", "Number_of_Small_Animals", "TimePeriod");

                SmallAnimalsBranchRHC1.ChartTitle.Text = "Number of Small Animals Branch Comparison";
                SmallAnimalsBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Time Period";
                SmallAnimalsBranchRHC1.PlotArea.YAxis.TitleAppearance.Text = "No of Small Animals";



                LargeAnimalsBranchBL largeAnimalsBranchBL = new LargeAnimalsBranchBL();
                List<usp_LargeAnimalsBranch_Result> largeAnimalsBranchlist = largeAnimalsBranchBL.usp_LargeAnimalsBranch(start, end, company, branch, time);
                DataTable largeAnimalsBranchDT = converter.ToDataTable(largeAnimalsBranchlist);
                RadHtmlChartGroupDataSource.GroupDataSource(LargeAnimalsBranchRHC1, largeAnimalsBranchDT, "Branch_Name", "LineSeries", "Number_of_Large_Animals", "TimePeriod");

            }
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