using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Test.BLL.Controls;
using Test.Models;

/// <summary>
/// Page Load
/// - Gets the Required sessions for the page. These sessions are used to get the variables for running the 
/// </summary>
namespace Test
{
    public partial class FCompanyCS : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //DateTime? start = Session["StartDate"] as DateTime?;
            //DateTime? end = Session["EndDate"] as DateTime?;
            //Int64? company = Session["CompanyRef"] as Int64?;
            //int? branch = Session["Branch"] as int?;
            int? time = Session["Time"] as int?;

            //This loop will make radpanelitem visible if they are contained in the list below
            //and also adds tooltip to radpanelitem
            string userRef = Session["UserRef"] as string;
            ViewableKpiListBL viewableKpiListBL = new ViewableKpiListBL();
            List<usp_ViewableKpiList_Result> viewableKpiList = viewableKpiListBL.usp_ViewableKpiList(userRef, 1, "Company");
            foreach (var element in viewableKpiList)
            {
                string name = element.Name;
                string toolTip = element.Description;
                RadPanelBar1.FindItemByText(name).Visible = true;
                RadPanelBar1.FindItemByText(name).ToolTip = toolTip;
            }

            

            //addItem();
            //Format the label appearance of y-axis so the value will be display as 000s
            TotalSalesCompanyRHC1.PlotArea.YAxis.TitleAppearance.Text = "Total Sales";

                AvgDollarPerTransactionCompanyRHC1.PlotArea.YAxis.TitleAppearance.Text = "Average per Transaction";

                TransExcludeZeroTotalCompanyRHC1.PlotArea.YAxis.TitleAppearance.Text = "No of Transactions ";

                RetailOnlySalesCompanyRHC1.PlotArea.YAxis.TitleAppearance.Text = "Retail Sales";

                ServiceOnlySalesCompanyRHC1.PlotArea.YAxis.TitleAppearance.Text = "Service Sales";

                //Tiitle of x-axis changes accordingly to the selection of timetype dropdown list
                if (time == 1)
                {
                    TotalSalesCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Month";
                    AvgDollarPerTransactionCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Month";
                    TransExcludeZeroTotalCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Month";
                    RetailOnlySalesCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Month";
                    ServiceOnlySalesCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Month";
                }
                else if (time == 2)
                {
                    TotalSalesCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Year";
                    AvgDollarPerTransactionCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Year";
                    TransExcludeZeroTotalCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Year";
                    RetailOnlySalesCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Year";
                    ServiceOnlySalesCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Year";
                }
                else if (time == 3)
                {
                    TotalSalesCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Week";
                    AvgDollarPerTransactionCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Week";
                    TransExcludeZeroTotalCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Week";
                    RetailOnlySalesCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Week";
                    ServiceOnlySalesCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Week";
                }
        }

        protected void TotalSalesCompanyRHC1_Load(object sender, EventArgs e)
        {
            TotalSalesCompanyRHC1.DataBind();
        }


        protected void addItem()
        {
            string userRef = Session["UserRef"] as string;

            ViewableKpiListBL viewableKpiListBL = new ViewableKpiListBL();
            List<usp_ViewableKpiList_Result> viewableKpiList = viewableKpiListBL.usp_ViewableKpiList(userRef, 1, "Company");

            foreach (var element in viewableKpiList)
            {
                var name = element.Name;
                var controlName = "FCompanyKPIControls/" + element.Control_Name + ".ascx";
                var desc = element.Description;

                RadPanelItem item = new RadPanelItem();
                item.Text = name;
                item.Expanded = false;
                item.ToolTip = desc;
                RadPanelBar1.Items.Add(item);

                RadPanelItem childItem = new RadPanelItem();
                childItem.Controls.Add(LoadControl(controlName));
                item.Items.Add(childItem);
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