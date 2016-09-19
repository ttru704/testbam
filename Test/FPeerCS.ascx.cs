using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Test.BLL.Financial;
using Test.Models;
using Test.BLL.Controls;
using Telerik.Web.UI;

namespace Test
{
    public partial class FPeerCS : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
             DateTime? start = Session["StartDate"] as DateTime?;
             DateTime? end = Session["EndDate"] as DateTime?;
             long? company = Session["CompanyRef"] as long?;
             long? branch = Session["Branch"] as long?;
             int? time = Session["Time"] as int?;
             long? country = Session["Country"] as long?;
             long? state = Session["State"] as long?;
             long? region = Session["Region"] as long?;
             long? branchType = Session["BranchType"] as long?;

            //Format Average dollar per transaction peer comparison chart
            AvgDollarPerTransactionPeerRHC1.ChartTitle.Text = "Average Dollar per Transaction - Peer";
            AvgDollarPerTransactionPeerRHC1.PlotArea.YAxis.TitleAppearance.Text = "Average per Transaction";

            //format x axis of chart
            if (time == 1)
            {
                AvgDollarPerTransactionPeerRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
            }
            else if (time == 2)
            {
                AvgDollarPerTransactionPeerRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
            }
            else if (time == 3)
            {
                AvgDollarPerTransactionPeerRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
            }

            //string userRef = Session["UserRef"] as string;
            //ViewableKpiListBL viewableKpiListBL = new ViewableKpiListBL();
            //List<usp_ViewableKpiList_Result> viewableKpiList = viewableKpiListBL.usp_ViewableKpiList(userRef, 1, "Peer Comparison");
            //foreach (var element in viewableKpiList)
            //{
            //    string name = element.Name;
            //    string toolTip = element.Description;
            //    RadPanelBar1.FindItemByText(name).Visible = true;
            //    RadPanelBar1.FindItemByText(name).ToolTip = toolTip;
            //}
            if (branch != null && branchType != null && country != null && state != null &&  region != null)
            {
                ListtoDataTableConverter converter = new ListtoDataTableConverter();

                AvgDollarPerTransactionPeerBL avgDollarPerTransactionPeerBL = new AvgDollarPerTransactionPeerBL();
                List<usp_AvgDollarPerTransactionPeer_Result> avgDollarPerTransactionPeerList = avgDollarPerTransactionPeerBL.usp_AvgDollarPerTransactionPeer(start, end, branch, branchType, time, country, state, region);
                DataTable avgDollarPerTransactionPeerDT = converter.ToDataTable(avgDollarPerTransactionPeerList);
                RadHtmlChartGroupDataSource.GroupDataSource(AvgDollarPerTransactionPeerRHC1, avgDollarPerTransactionPeerDT, "Name", "LineSeries", "Average_Dollar_per_Transaction", "TimePeriod");
                
            }
        }

        protected void ExportGridCustomiser(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == Telerik.Web.UI.RadGrid.ExportToWordCommandName ||
                e.CommandName == Telerik.Web.UI.RadGrid.ExportToExcelCommandName || e.CommandName == Telerik.Web.UI.RadGrid.ExportToPdfCommandName)
                sender.ToString();
            Type t = sender.GetType();
            t.Name.ToString();
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