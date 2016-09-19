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
    public partial class FProduct_ServiceCS : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime? start = Session["StartDate"] as DateTime?;
            DateTime? end = Session["EndDate"] as DateTime?;
            Int64? company = Session["CompanyRef"] as Int64?;
            int? time = Session["Time"] as int?;
            Int64? serviceRef = Session["Service"] as Int64?;
            Int64? productRef = Session["Product"] as Int64?;

            //Format Income by Service Individual chart
            IncomeByServiceIndividualRHC1.ChartTitle.Text = "Income by Service";
            IncomeByServiceIndividualRHC1.PlotArea.YAxis.TitleAppearance.Text = "Income";

            //Format Income by Product Individual chart
            IncomeByProductIndividualRHC1.ChartTitle.Text = "Income by Product";
            IncomeByProductIndividualRHC1.PlotArea.YAxis.TitleAppearance.Text = "Income";

            //format x axis based on the selected time type
            if (time == 1)
            {
                IncomeByServiceIndividualRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                IncomeByProductIndividualRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
            }
            else if (time == 2)
            {
                IncomeByServiceIndividualRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                IncomeByProductIndividualRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
            }
            else if (time == 3)
            {
                IncomeByServiceIndividualRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                IncomeByProductIndividualRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
            }

            if (serviceRef != null)
            {
                ListtoDataTableConverter converter = new ListtoDataTableConverter();
                IncomeByServiceIndividualBL incomeByServiceIndividualBL = new IncomeByServiceIndividualBL();
                List<usp_IncomeByServiceIndividual_Result> incomeByServiceIndividualList = incomeByServiceIndividualBL.usp_IncomeByServiceIndividual_Result(start, end, company, serviceRef, time);
                DataTable incomeByServiceIndividualDT = converter.ToDataTable(incomeByServiceIndividualList);
                RadHtmlChartGroupDataSource.GroupDataSource(IncomeByServiceIndividualRHC1, incomeByServiceIndividualDT, "Service_Name", "BarSeries", "Income_By_Service", "TimePeriod");

                
            }

            if (productRef != null)
            {
                ListtoDataTableConverter converter = new ListtoDataTableConverter();

                IncomeByProductIndividualBL incomeByProductIndividualBL = new IncomeByProductIndividualBL();
                List<usp_IncomeByProductIndividual_Result> incomeByProductIndividualList = incomeByProductIndividualBL.usp_IncomeByProductIndividual_Result(start, end, company, productRef, time);
                DataTable incomeByProductIndividualDT = converter.ToDataTable(incomeByProductIndividualList);
                RadHtmlChartGroupDataSource.GroupDataSource(IncomeByProductIndividualRHC1, incomeByProductIndividualDT, "Product_Name", "BarSeries", "Income_By_Product", "TimePeriod");

                
            }

        }

        protected void ServiceSB1_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

            DateTime? start = Session["StartDate"] as DateTime?;
            DateTime? end = Session["EndDate"] as DateTime?;
            Int64? company = Session["CompanyRef"] as Int64?;
            int? time = Session["Time"] as int?;
            Int64? serviceRef = Convert.ToInt64(ServiceSB1.SelectedItem.Value);
            Session["Service"] = serviceRef;

            ListtoDataTableConverter converter = new ListtoDataTableConverter();

            IncomeByServiceIndividualBL incomeByServiceIndividualBL = new IncomeByServiceIndividualBL();
            List<usp_IncomeByServiceIndividual_Result> incomeByServiceIndividualList = incomeByServiceIndividualBL.usp_IncomeByServiceIndividual_Result(start, end, company, serviceRef, time);
            DataTable incomeByServiceIndividualDT = converter.ToDataTable(incomeByServiceIndividualList);
            RadHtmlChartGroupDataSource.GroupDataSource(IncomeByServiceIndividualRHC1, incomeByServiceIndividualDT, "Service_Name", "BarSeries", "Income_By_Service", "TimePeriod");

            
        }

        protected void ProductSB1_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            DateTime? start = Session["StartDate"] as DateTime?;
            DateTime? end = Session["EndDate"] as DateTime?;
            Int64? company = Session["CompanyRef"] as Int64?;
            int? time = Session["Time"] as int?;
            Int64? productRef = Convert.ToInt64(ProductSB1.SelectedItem.Value);
            Session["Product"] = productRef;

            ListtoDataTableConverter converter = new ListtoDataTableConverter();

            IncomeByProductIndividualBL incomeByProductIndividualBL = new IncomeByProductIndividualBL();
            List<usp_IncomeByProductIndividual_Result> incomeByProductIndividualList = incomeByProductIndividualBL.usp_IncomeByProductIndividual_Result(start, end, company, productRef, time);
            DataTable incomeByProductIndividualDT = converter.ToDataTable(incomeByProductIndividualList);
            RadHtmlChartGroupDataSource.GroupDataSource(IncomeByProductIndividualRHC1, incomeByProductIndividualDT, "Product_Name", "BarSeries", "Income_By_Product", "TimePeriod");

            
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