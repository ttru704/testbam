using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Test.BLL.Customer;
using Test.Models;

namespace Test
{
    public partial class CPeerCS : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StartDate"] != null)
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

                if (branch != null && branchType != null && country != null && state != null && region != null)
                {
                    ListtoDataTableConverter converter = new ListtoDataTableConverter();

                    AvgDollarPerCustomerPeerBL avgDollarPerCustomerPeerBL = new AvgDollarPerCustomerPeerBL();
                    List<usp_AvgDollarPerCustomerPeer_Result> avgDollarPerCustomerPeerList = avgDollarPerCustomerPeerBL.usp_AvgDollarPerCustomerPeer(start, end, branch, 4, time, 1, 1, 9);
                    DataTable avgDollarPerCustomerPeerDT = converter.ToDataTable(avgDollarPerCustomerPeerList);
                    RadHtmlChartGroupDataSource.GroupDataSource(AvgDollarPerCustomerPeerRHC1, avgDollarPerCustomerPeerDT, "Name", "LineSeries", "Average_Dollar_per_Customer", "TimePeriod");

                    AvgDollarPerCustomerPeerG1.DataBind();
                }
                //format Average Dollar per customer peer comparison chart
                AvgDollarPerCustomerPeerRHC1.ChartTitle.Text = "Average Dollar per Customer - Peer";
                AvgDollarPerCustomerPeerRHC1.PlotArea.YAxis.TitleAppearance.Text = "Average per Customer";

                //format xaxis based on selected time type
                if (time == 1)
                {
                    AvgDollarPerCustomerPeerRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                }
                else if (time == 2)
                {
                    AvgDollarPerCustomerPeerRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                }
                else if (time == 3)
                {
                    AvgDollarPerCustomerPeerRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                }
            }
        }

        //This is for grid exporting
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