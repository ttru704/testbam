using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Test.BLL.Controls;
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

                // call the session that stores the user ref
                string userRef = Session["UserRef"] as string;

                //Store the list of kpi that the current user is allowed to view
                ViewableKpiListBL viewableKpiListBL = new ViewableKpiListBL();
                List<usp_ViewableKpiList_Result> viewableKpiList = viewableKpiListBL.usp_ViewableKpiList(userRef, 2, "Peer Comparison");
                
                //loop through the list of kpi that current user is allowed to view then make these kpi visible to user
                foreach (var element in viewableKpiList)
                {
                    string name = element.Name;
                    string toolTip = element.Description;
                    RadPanelBar1.FindItemByText(name).Visible = true;
                    RadPanelBar1.FindItemByText(name).ToolTip = toolTip;
                }

                if (branch != null && branchType != null && country != null && state != null && region != null)
                {
                    ListtoDataTableConverter converter = new ListtoDataTableConverter();

                    AvgDollarPerCustomerPeerBL avgDollarPerCustomerPeerBL = new AvgDollarPerCustomerPeerBL();
                    List<usp_AvgDollarPerCustomerPeer_Result> avgDollarPerCustomerPeerList = avgDollarPerCustomerPeerBL.usp_AvgDollarPerCustomerPeer(start, end, branch, 4, time, 1, 1, 9);
                    DataTable avgDollarPerCustomerPeerDT = converter.ToDataTable(avgDollarPerCustomerPeerList);
                    RadHtmlChartGroupDataSource.GroupDataSource(AvgDollarPerCustomerPeerRHC1, avgDollarPerCustomerPeerDT, "Name", "LineSeries", "Average_Dollar_per_Customer", "TimePeriod");

                    AvgDollarPerCustomerPeerGridG1.DataBind();
                }
                //format Average Dollar per customer peer comparison chart
                AvgDollarPerCustomerPeerRHC1.ChartTitle.Text = "Average Dollar per Customer - Peer";
                AvgDollarPerCustomerPeerRHC1.PlotArea.YAxis.TitleAppearance.Text = "Average per Customer";

                //format xaxis based on selected time type
                if (time == 1)
                {
                    AvgDollarPerCustomerPeerRHC1.PlotArea.XAxis.TitleAppearance.Text = "Month";
                }
                else if (time == 2)
                {
                    AvgDollarPerCustomerPeerRHC1.PlotArea.XAxis.TitleAppearance.Text = "Year";
                }
                else if (time == 3)
                {
                    AvgDollarPerCustomerPeerRHC1.PlotArea.XAxis.TitleAppearance.Text = "Week";
                }
            }
        }

        protected void BranchCB1_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            Session["Branch"] = Convert.ToInt64(BranchCB1.SelectedItem.Value);
        }

        protected void BranchTypeDDL1_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            Session["BranchType"] = Convert.ToInt64(BranchTypeDDL1.SelectedItem.Value);
        }

        protected void CountryDDL1_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            Session["Country"] = Convert.ToInt64(CountryDDL1.SelectedItem.Value);
        }

        protected void StateDDL1_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            Session["State"] = Convert.ToInt64(StateDDL1.SelectedItem.Value);
        }

        protected void RegionDDL1_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            Session["Region"] = Convert.ToInt64(RegionDDL1.SelectedItem.Value);
        }

        //This is for grid exporting
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