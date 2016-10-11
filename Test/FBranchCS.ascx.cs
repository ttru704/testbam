using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Test.BLL.Controls;
using Test.BLL.Financial;
using Test.Models;

/// <summary>
/// - These Sessions are still defined here because the variables are needed to form the datasource for the Chart. 
/// - The Datasource for chart is done here, so that the GroupDataSource can be used to group the data for the branches. 
/// - This allows us to graph the data in separates lines/bars/series for the charts
/// 
/// - Only tries to set the variables from session when session variables have been stored. Uses StartDate session as a check
/// 
/// KPIs
/// - On this page, it checks which KPIs a user can see via a stored procedure.
/// - For each KPI the user is allowed to see, the tooltip is set, and the KPI radpanel item is set to visible
/// - The 1 in (userRef, 1, "Branch Comparison") represents the KPI type (hardcoded).
///     1 = Financial
///     2 = Customer
///     3 = Employee
/// 
/// 
/// GroupDataSource + List to Datatable converter ( in the Models Folder) is used to group data for the branch KPIs
/// List to DataTable converter is necessary to convert the output of the stored procedure to a format that is useable by the chartgroup data source
/// 
/// Other Formatting of charts are done below
/// 
/// Export for the Grid is done here in the codebehind as normal.
/// </summary>

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
                Int64? company = Session["CompanyRef"] as Int64?;
                Int64? branch = Convert.ToInt64(BranchCB1.SelectedItem.Value);
                int? time = Session["Time"] as int?;

                //addItem();
                string userRef = Session["UserRef"] as string;
                ViewableKpiListBL viewableKpiListBL = new ViewableKpiListBL();
                List<usp_ViewableKpiList_Result> viewableKpiList = viewableKpiListBL.usp_ViewableKpiList(userRef, 1, "Branch Comparison");
                foreach (var element in viewableKpiList)
                {
                    string name = element.Name;
                    string toolTip = element.Description;
                    RadPanelBar1.FindItemByText(name).Visible = true;
                    RadPanelBar1.FindItemByText(name).ToolTip = toolTip;
                }

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

                //Format Total sales branch chart
                TotalSalesBranchRHC1.ChartTitle.Text = "Total Sales - Branch";
                TotalSalesBranchRHC1.PlotArea.YAxis.TitleAppearance.Text = "Total Sales";

                //Format Avereage Dollar Per Transaction Branch chart
                AvgDollarPerTransactionBranchRHC1.ChartTitle.Text = "Averegae Dollar per Transaction - Branch";
                AvgDollarPerTransactionBranchRHC1.PlotArea.YAxis.TitleAppearance.Text = "Average per Transaction";

                //Format Transaction excluding zero total bill branch comparison chart
                TransExcludeZeroTotalBranchRHC1.ChartTitle.Text = "Number of Transactions excluding zero total bills - Branch";
                TransExcludeZeroTotalBranchRHC1.PlotArea.YAxis.TitleAppearance.Text = "No of Transactions";

                //Format Retail only sales branch comparison chart
                RetailOnlySalesBranchRHC1.ChartTitle.Text = "Retail Sales - Branch";
                RetailOnlySalesBranchRHC1.PlotArea.YAxis.TitleAppearance.Text = "Retail Sales";

                //Format Service only sales branch comparison chart
                ServiceOnlySalesBranchRHC1.ChartTitle.Text = "Service Sales - Branch";
                ServiceOnlySalesBranchRHC1.PlotArea.YAxis.TitleAppearance.Text = "Service Sales";

                //format x axis based on the selected time type
                if (time == 1)
                {
                    TotalSalesBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Month";
                    AvgDollarPerTransactionBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Month";
                    TransExcludeZeroTotalBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Month";
                    RetailOnlySalesBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Month";
                    ServiceOnlySalesBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Month";
                }
                else if (time == 2)
                {
                    TotalSalesBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Year";
                    AvgDollarPerTransactionBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Year";
                    TransExcludeZeroTotalBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Year";
                    RetailOnlySalesBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Year";
                    ServiceOnlySalesBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Year";
                }
                else if (time == 3)
                {
                    TotalSalesBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Week";
                    AvgDollarPerTransactionBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Week";
                    TransExcludeZeroTotalBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Week";
                    RetailOnlySalesBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Week";
                    ServiceOnlySalesBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Week";
                }
            }

        }
        

        protected void ExportGridCustomiser(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == Telerik.Web.UI.RadGrid.ExportToWordCommandName ||
                e.CommandName == Telerik.Web.UI.RadGrid.ExportToExcelCommandName || e.CommandName == Telerik.Web.UI.RadGrid.ExportToPdfCommandName)
                sender.ToString();
            
            RadGrid rg = (RadGrid)sender;
            string gridname = rg.DataSourceID;

            {
                //rg.ExportSettings.FileName ="chartname"; 
                rg.ExportSettings.ExportOnlyData = true;
                rg.ExportSettings.IgnorePaging = true;
                rg.ExportSettings.OpenInNewWindow = true;
                rg.ExportSettings.UseItemStyles = true;
            }
        }
        
    }
}