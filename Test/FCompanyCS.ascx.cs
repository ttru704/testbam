using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Test
{
    public partial class FCompanyCS : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime? start = Session["StartDate"] as DateTime?;
            DateTime? end = Session["EndDate"] as DateTime?;
            int? company = Session["Company"] as int?;
            int? branch = Session["Branch"] as int?;
            int? time = Session["Time"] as int?;

            //Format the label appearance of y-axis so the value will be display as 000s
                TotalSalesCompanyRHC1.PlotArea.YAxis.TitleAppearance.Text = "Total Sales (000s)";
                TotalSalesCompanyRHC1.PlotArea.YAxis.LabelsAppearance.ClientTemplate = "#= value / 1000# ";

            AvgDollarPerTransactionCompanyRHC1.PlotArea.YAxis.TitleAppearance.Text = "Average per Transaction (000s)";
            AvgDollarPerTransactionCompanyRHC1.PlotArea.YAxis.LabelsAppearance.ClientTemplate = "#= value / 1000# ";

            TransExcludeZeroTotalCompanyRHC1.PlotArea.YAxis.TitleAppearance.Text = "No of Transactions ";

            RetailOnlySalesCompanyRHC1.PlotArea.YAxis.TitleAppearance.Text = "Retail Sales (000s)";
            RetailOnlySalesCompanyRHC1.PlotArea.YAxis.LabelsAppearance.ClientTemplate = "#= value / 1000#";

            ServiceOnlySalesCompanyRHC1.PlotArea.YAxis.TitleAppearance.Text = "Service Sales (000s)";
            ServiceOnlySalesCompanyRHC1.PlotArea.YAxis.LabelsAppearance.ClientTemplate = "#= value / 1000#";


            //Tiitle of x-axis changes accordingly to the selection of timetype dropdown list
            if (time == 1)
            {
                TotalSalesCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                AvgDollarPerTransactionCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                TransExcludeZeroTotalCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                RetailOnlySalesCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                ServiceOnlySalesCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
            }
            else if (time == 2)
            {
                TotalSalesCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                AvgDollarPerTransactionCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                TransExcludeZeroTotalCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                RetailOnlySalesCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                ServiceOnlySalesCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
            }
            else if (time ==3)
            {
                TotalSalesCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                AvgDollarPerTransactionCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                TransExcludeZeroTotalCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                RetailOnlySalesCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                ServiceOnlySalesCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
            }

            if (1 > 0)
            {
                RetailOnlySalesCompanyUC.Visible = true;
            }
            
        }

        protected void AvgPerTransactionComODS1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {

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