using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Test.BLL.Financial;
using Test.Models;

namespace Test
{
    public partial class FBranchCS : System.Web.UI.UserControl
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

                TotalSalesBranchBL totalSalesBranchBL = new TotalSalesBranchBL();
                List<usp_TotalSalesBranch_Result> totalSalesBranchList = totalSalesBranchBL.usp_TotalSalesBranch(start, end, company, branch, time);
                DataTable totalSalesBranchDT = converter.ToDataTable(totalSalesBranchList);
                RadHtmlChartGroupDataSource.GroupDataSource(TotalSalesBranchRHC1, totalSalesBranchDT, "Branch_Name", "ColumnSeries", "Total_Sales", "TimePeriod");


                AvgDollarPerTransactionBranchBL avgDollarPerTransactionBranchBL = new AvgDollarPerTransactionBranchBL();
                List<usp_AvgDollarPerTransactionBranch_Result> avgDollarPerTransactionBranchList = avgDollarPerTransactionBranchBL.usp_AvgDollarPerTransactionBranch(start, end, company, branch, time);
                DataTable avgDollarPerTransactionBranchDT = converter.ToDataTable(avgDollarPerTransactionBranchList);
                RadHtmlChartGroupDataSource.GroupDataSource(AvgDollarPerTransactionBranchRHC1, avgDollarPerTransactionBranchDT, "Branch_Name", "ColumnSeries", "Average_Dollar_per_Transaction", "TimePeriod");


                TransExcludeZeroTotalBranchBL transExcludeZeroTotalBranchBL = new TransExcludeZeroTotalBranchBL();
                List<usp_TransExcludeZeroTotalBranch_Result> transExcludeZeroTotalBranchList = transExcludeZeroTotalBranchBL.usp_TransExcludeZeroTotalBranch(start, end, company, branch, time);
                DataTable transExcludeZeroTotalBranchDT = converter.ToDataTable(transExcludeZeroTotalBranchList);
                RadHtmlChartGroupDataSource.GroupDataSource(TransExcludeZeroTotalBranchRHC1, transExcludeZeroTotalBranchDT, "Branch_Name", "ColumnSeries", "No_of_transactions_excluding_zero_total_bill", "TimePeriod");


                RetailOnlySalesBranchBL retailOnlySalesBranchBL = new RetailOnlySalesBranchBL();
                List<usp_RetailOnlySalesBranch_Result> retailOnlySalesBranchList = retailOnlySalesBranchBL.usp_RetailOnlySalesBranch(start, end, company, branch, time);
                DataTable retailOnlySalesBranchDT = converter.ToDataTable(retailOnlySalesBranchList);
                RadHtmlChartGroupDataSource.GroupDataSource(RetailOnlySalesBranchRHC1, retailOnlySalesBranchDT, "Branch_Name", "LineSeries", "Retail_Total_Only", "TimePeriod");


                ServiceOnlySalesBranchBL serviceOnlySalesComBL = new ServiceOnlySalesBranchBL();
                List<usp_ServiceOnlySalesBranch_Result> serviceOnlySalesBranchList = serviceOnlySalesComBL.usp_ServiceOnlySalesBranch(start, end, company, branch, time);

                DataTable serviceOnlySalesBranchDT = converter.ToDataTable(serviceOnlySalesBranchList);
                RadHtmlChartGroupDataSource.GroupDataSource(ServiceOnlySalesBranchRHC1, serviceOnlySalesBranchDT, "Branch_Name", "LineSeries", "Service_Total_Only", "TimePeriod");

                //Format yaxis of charts
                TotalSalesBranchRHC1.PlotArea.YAxis.TitleAppearance.Text = "Total Sales (000s)";
                TotalSalesBranchRHC1.PlotArea.YAxis.LabelsAppearance.ClientTemplate = "#= value / 1000#";

                AvgDollarPerTransactionBranchRHC1.PlotArea.YAxis.TitleAppearance.Text = "Average per Transaction (000s)";
                AvgDollarPerTransactionBranchRHC1.PlotArea.YAxis.LabelsAppearance.ClientTemplate = "#= value / 1000#";

                TransExcludeZeroTotalBranchRHC1.PlotArea.YAxis.TitleAppearance.Text = "No of Transactions";

                RetailOnlySalesBranchRHC1.PlotArea.YAxis.TitleAppearance.Text = "Retail Sales (000s)";
                RetailOnlySalesBranchRHC1.PlotArea.YAxis.LabelsAppearance.ClientTemplate = "#= value / 1000#";

                ServiceOnlySalesBranchRHC1.PlotArea.YAxis.TitleAppearance.Text = "Service Sales (000s)";
                ServiceOnlySalesBranchRHC1.PlotArea.YAxis.LabelsAppearance.ClientTemplate = "#= value / 1000#";

                //format x axis based on the selected time type
                if (time == 1)
                {
                    TotalSalesBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monlthy";
                    AvgDollarPerTransactionBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monlthy";
                    TransExcludeZeroTotalBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monlthy";
                    RetailOnlySalesBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monlthy";
                    ServiceOnlySalesBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monlthy";
                }
                else if (time == 2)
                {
                    TotalSalesBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                    AvgDollarPerTransactionBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                    TransExcludeZeroTotalBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                    RetailOnlySalesBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                    ServiceOnlySalesBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                }
                else if (time == 3)
                {
                    TotalSalesBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                    AvgDollarPerTransactionBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                    TransExcludeZeroTotalBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                    RetailOnlySalesBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                    ServiceOnlySalesBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                }
            }

        }

        

        protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {

        }
    }
}