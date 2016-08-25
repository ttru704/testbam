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
            }

        }

        

        protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {

        }
    }
}