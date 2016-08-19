using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Telerik.Web.UI;
using Test.Models;
using Telerik.Web.UI.HtmlChart;
using System.ComponentModel;
using Test.BLL.Financial;
using System.Reflection;
using Test.BLL;

namespace Test
{
    public partial class financialkpi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //DropDownListItem item = new DropDownListItem();
            //item.Text = "All Branches";
            //item.Value = "0";
            //BranchDDL1.Items.Add(item);
        }
        


        protected void Button1_Click(object sender, EventArgs e)
        {
            

            BranchDropDownListBL branchDropDownListBL = new BranchDropDownListBL();
            List<usp_BranchDropDownList_Result> a = branchDropDownListBL.usp_BranchDropDownList(1);
            
            DateTime? start = DatePicker1.SelectedDate.GetValueOrDefault();
            DateTime? end = DatePicker2.SelectedDate.GetValueOrDefault();
            int company = Convert.ToInt32(CompanyDDL1.SelectedItem.Value);
            int branch = Convert.ToInt32(BranchDDL1.SelectedItem.Value);
            int time = Convert.ToInt16(TimeDDL1.SelectedItem.Value);
            ListtoDataTableConverter converter = new ListtoDataTableConverter();

            //String.Format("{0: mmm yy}", dt.Columns["Year_Month"]);
            //DateTime.ParseExact(dt.Columns["Year_Month"])



            TotalSalesCompanyRHC1.DataBind();
            //string labelsFormatString = "{0:n0}";
            if (TimeDDL1.SelectedValue == "1")
            {
                //DateTime dateformat = Convert.ToDateTime(dt);
                TotalSalesBranchRHC1.PlotArea.XAxis.LabelsAppearance.DataFormatString = "MMM yyyy";
                TotalSalesBranchRHC1.ChartTitle.Text = "Total Sales Branch Comparison";
                TotalSalesBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Time Period";


                TotalSalesBranchRHC1.PlotArea.YAxis.TitleAppearance.Text = "Total Sales (000s)";
                //TotalSalesBranchRHC1.PlotArea.YAxis.LabelsAppearance.DataFormatString = labelsFormatString;
                TotalSalesBranchRHC1.PlotArea.YAxis.LabelsAppearance.ClientTemplate = "#= value / 1000# ";
                TotalSalesBranchRHC1.PlotArea.YAxis.LabelsAppearance.DataFormatString = "{0:N0}";


                
                //AvgPerTransactionBranchRHC1.PlotArea.XAxis.LabelsAppearance.DataFormatString = "MMM";
                AvgDollarPerTransactionBranchRHC1.ChartTitle.Text = "Average per Transaction Branch Comparison";
                AvgDollarPerTransactionBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Time Period";
                AvgDollarPerTransactionBranchRHC1.PlotArea.YAxis.TitleAppearance.Text = "Average per Transaction";
                RetailOnlySalesBranchRHC1.PlotArea.YAxis.TitleAppearance.Text = "$";
                ServiceOnlySalesBranchRHC1.PlotArea.YAxis.TitleAppearance.Text = "$";
                RetailOnlySalesBranchRHC1.ChartTitle.Text = "Retail Only Sales Branch Comparison";
                ServiceOnlySalesBranchRHC1.ChartTitle.Text = "Service Only Sales Branch Comparison";
                
                //AvgPerTransactionBranchRHC1.PlotArea.XAxis.LabelsAppearance.ClientTemplate = "#=kendo.parseDate(value, \'yyyy/MM/dd\')#"; -disappears and all the graphs below it too

                //AvgPerTransactionBranchRHC1.PlotArea.XAxis.BaseUnit = "months";

            }
            else
            {
                TotalSalesCompanyRHC1.PlotArea.XAxis.LabelsAppearance.DataFormatString = "yyyy";
                TotalSalesCompanyRHC1.ChartTitle.Text = "Total Yearly Sales";
                TotalSalesCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Year";

                AvgDollarPerTransactionBranchRHC1.PlotArea.XAxis.LabelsAppearance.DataFormatString = "yyyy";
                AvgDollarPerTransactionBranchRHC1.ChartTitle.Text = "Total Yearly Sales";
                AvgDollarPerTransactionBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Year";
            };

            
            

            TotalSalesBranchBL totalSalesBranchBL = new TotalSalesBranchBL();
            List<usp_TotalSalesBranch_Result> totalSalesBranchList = totalSalesBranchBL.usp_TotalSalesBranch(start, end, company, branch, time);
            DataTable totalSalesBranchDT = converter.ToDataTable(totalSalesBranchList);
            RadHtmlChartGroupDataSource.GroupDataSource(TotalSalesBranchRHC1, totalSalesBranchDT, "Branch_Name", "ColumnSeries", "Total_Sales", "TimePeriod");

            AvgDollarPerTransactionCompanyRHC1.DataBind();

            AvgDollarPerTransactionBranchBL avgDollarPerTransactionBranchBL = new AvgDollarPerTransactionBranchBL();
            List<usp_AvgDollarPerTransactionBranch_Result> avgDollarPerTransactionBranchList = avgDollarPerTransactionBranchBL.usp_AvgDollarPerTransactionBranch(start, end, company, branch, time);
            DataTable avgDollarPerTransactionBranchDT = converter.ToDataTable(avgDollarPerTransactionBranchList);
            RadHtmlChartGroupDataSource.GroupDataSource(AvgDollarPerTransactionBranchRHC1, avgDollarPerTransactionBranchDT, "Branch_Name", "ColumnSeries", "Average_Dollar_per_Transaction", "TimePeriod");

            TransExcludeZeroTotalCompanyRHC1.DataBind();

            TransExcludeZeroTotalBranchBL transExcludeZeroTotalBranchBL = new TransExcludeZeroTotalBranchBL();
            List<usp_TransExcludeZeroTotalBranch_Result> transExcludeZeroTotalBranchList = transExcludeZeroTotalBranchBL.usp_TransExcludeZeroTotalBranch(start, end, company, branch, time);
            DataTable transExcludeZeroTotalBranchDT = converter.ToDataTable(transExcludeZeroTotalBranchList);
            RadHtmlChartGroupDataSource.GroupDataSource(TransExcludeZeroTotalBranchRHC1, transExcludeZeroTotalBranchDT, "Branch_Name", "ColumnSeries", "No_of_transactions_excluding_zero_total_bill", "TimePeriod");

            RetailOnlySalesCompanyRHC1.DataBind();

            ServiceOnlySalesCompanyRHC1.DataBind();

            RetailOnlySalesBranchBL retailOnlySalesBranchBL = new RetailOnlySalesBranchBL();
            List<usp_RetailOnlySalesBranch_Result> retailOnlySalesBranchList = retailOnlySalesBranchBL.usp_RetailOnlySalesBranch(start, end, company, branch, time);
            DataTable retailOnlySalesBranchDT = converter.ToDataTable(retailOnlySalesBranchList);
            RadHtmlChartGroupDataSource.GroupDataSource(RetailOnlySalesBranchRHC1, retailOnlySalesBranchDT, "Branch_Name", "LineSeries", "Retail_Total_Only", "TimePeriod");


            ServiceOnlySalesBranchBL serviceOnlySalesComBL = new ServiceOnlySalesBranchBL();
            List<usp_ServiceOnlySalesBranch_Result> serviceOnlySalesBranchList = serviceOnlySalesComBL.usp_ServiceOnlySalesBranch(start, end, company, branch, time);

            DataTable serviceOnlySalesBranchDT = converter.ToDataTable(serviceOnlySalesBranchList);
            RadHtmlChartGroupDataSource.GroupDataSource(ServiceOnlySalesBranchRHC1, serviceOnlySalesBranchDT, "Branch_Name", "LineSeries", "Service_Total_Only", "TimePeriod");

           
            


        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void AvgPerTransactionComODS1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {

        }



        protected void Company_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {

        }


    }

}