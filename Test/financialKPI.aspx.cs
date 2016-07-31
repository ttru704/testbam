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
namespace Test
{
    public partial class KPI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            


        }
        //public DataTable ConvertToDataTable<T>(IList<T> data)
        //{
        //    PropertyDescriptorCollection properties =
        //        TypeDescriptor.GetProperties(typeof(T));

        //    DataTable table = new DataTable();

        //    foreach (PropertyDescriptor prop in properties)
        //        table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);

        //    foreach (T item in data)
        //    {
        //        DataRow row = table.NewRow();
        //        foreach (PropertyDescriptor prop in properties)
        //            row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;
        //        table.Rows.Add(row);
        //    }
        //    return table;
        //}


        protected void Button1_Click(object sender, EventArgs e)
        {
            ////////// This is the inefficient solution of binding the graph it through the gridview)
            //DataTable dt = new DataTable();
            //for (int i = 0; i < AvgPerTransactionBranchG1.Columns.Count; i++)
            //{
            //    dt.Columns.Add("column" + i.ToString());
            //}
            //foreach (GridViewRow row in AvgPerTransactionBranchG1.Rows)
            //{
            //    DataRow dr = dt.NewRow();
            //    for (int j = 0; j < AvgPerTransactionBranchG1.Columns.Count; j++)
            //    {
            //        dr["column" + j.ToString()] = row.Cells[j].Text;
            //    }

            //    dt.Rows.Add(dr);
            //}

            AvgPerTransactionComRHC1.DataBind();
            

            DateTime? start = DatePicker1.SelectedDate.GetValueOrDefault();
            DateTime? end = DatePicker2.SelectedDate.GetValueOrDefault();
            int company = Convert.ToInt32(CompanyDDL1.SelectedItem.Value);
            int branch = Convert.ToInt32(BranchDDL1.SelectedItem.Value);
            int time = Convert.ToInt16(TimeDDL1.SelectedItem.Value);



            AvgPerTransactionBranchBL avgPerTransactionBranchBL = new AvgPerTransactionBranchBL();
            List<usp_AvgPerTransactionBranch_Result> t = avgPerTransactionBranchBL.usp_AvgPerTransactionBranch(start, end, company, branch, time);

            ListtoDataTableConverter converter = new ListtoDataTableConverter();
            DataTable dt = converter.ToDataTable(t);
            //String.Format("{0: mmm yy}", dt.Columns["Year_Month"]);
            //DateTime.ParseExact(dt.Columns["Year_Month"])
            RadHtmlChartGroupDataSource.GroupDataSource(AvgPerTransactionBranchRHC1, dt, "Branch_Name", "ColumnSeries", "Average_Dollar_per_Transaction", "Year_Month");


            TotalSalesComRHC1.DataBind();
            string labelsFormatString = "{0:N2}";
            if (TimeDDL1.SelectedValue == "1")
            {
                //DateTime dateformat = Convert.ToDateTime(dt);
                TotalSalesBranchRHC1.PlotArea.XAxis.LabelsAppearance.DataFormatString = "MMM yyyy";
                TotalSalesBranchRHC1.ChartTitle.Text = "Total Monthly Sales";
                TotalSalesBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Month";
                TotalSalesBranchRHC1.PlotArea.XAxis.LabelsAppearance.ClientTemplate = "#=kendo.format(\\'{0:MMM}\\',value)#";
                //TotalSalesBranchRHC1.PlotArea.XAxis.LabelsAppearance.ClientTemplate = "#=kendo.parseDate(\\'{MMM}\\', value)#";
                TotalSalesBranchRHC1.PlotArea.YAxis.TitleAppearance.Text = "Total Sales($)";
                TotalSalesBranchRHC1.PlotArea.YAxis.LabelsAppearance.DataFormatString = labelsFormatString;
                TotalSalesBranchRHC1.PlotArea.YAxis.LabelsAppearance.ClientTemplate = "#= value / 1000# ";



                AvgPerTransactionBranchRHC1.PlotArea.XAxis.LabelsAppearance.DataFormatString = "MMM";
                AvgPerTransactionBranchRHC1.ChartTitle.Text = "Total Monthly Sales";
                AvgPerTransactionBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Month";

                //AvgPerTransactionBranchRHC1.PlotArea.XAxis.BaseUnit = "months";
                
            }
            else
            {
                TotalSalesComRHC1.PlotArea.XAxis.LabelsAppearance.DataFormatString = "yyyy";
                TotalSalesComRHC1.ChartTitle.Text = "Total Yearly Sales";
                TotalSalesComRHC1.PlotArea.XAxis.TitleAppearance.Text = "Year";

                AvgPerTransactionBranchRHC1.PlotArea.XAxis.LabelsAppearance.DataFormatString = "yyyy";
                AvgPerTransactionBranchRHC1.ChartTitle.Text = "Total Yearly Sales";
                AvgPerTransactionBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Year";
            };

            
            //DataTable dt2 = new DataTable();
            //for (int i = 0; i < TotalSalesBranchG1.Columns.Count; i++)
            //{
            //    dt2.Columns.Add("column" + i.ToString());
            //}
            //foreach (GridViewRow row in TotalSalesBranchG1.Rows)
            //{
            //    DataRow dr = dt2.NewRow();
            //    for (int j = 0; j < TotalSalesBranchG1.Columns.Count; j++)
            //    {
            //        dr["column" + j.ToString()] = row.Cells[j].Text;
            //    }

            //    dt2.Rows.Add(dr);
            //}

            TotalSalesBranchBL totalSalesBranchBL = new TotalSalesBranchBL();
            List<usp_TotalSalesBranch_Result> totalSalesBranchList = totalSalesBranchBL.usp_TotalSalesBranch(start, end, company, branch, time);

            DataTable totalSalesBranchDT = converter.ToDataTable(totalSalesBranchList);
            RadHtmlChartGroupDataSource.GroupDataSource(TotalSalesBranchRHC1, totalSalesBranchDT, "Branch_Name", "ColumnSeries", string.Format("{0:0.00}","Total_Sales"), "YearMonth");

            TransExcludeZeroTotalComRHC1.DataBind();

            RetailOnlySalesComRHC1.DataBind();
            ServiceOnlySalesComRHC1.DataBind();

            RetailOnlySalesBranchBL retailOnlySalesBranchBL = new RetailOnlySalesBranchBL();
            List<usp_RetailOnlySalesBranch_Result> retailOnlySalesBranchList = retailOnlySalesBranchBL.usp_RetailOnlySalesBranch(start, end, company, branch, time);

            DataTable retailOnlySalesBranchDT = converter.ToDataTable(retailOnlySalesBranchList);
            RadHtmlChartGroupDataSource.GroupDataSource(RetailOnlySalesBranchRHC1, retailOnlySalesBranchDT, "Branch_Name", "AreaSeries", "Retail_Total_Only", "Year_Month");


            ServiceOnlySalesBranchBL serviceOnlySalesComBL = new ServiceOnlySalesBranchBL();
            List<usp_ServiceOnlySalesBranch_Result> serviceOnlySalesBranchList = serviceOnlySalesComBL.usp_ServiceOnlySalesBranch(start, end, company, branch, time);

            DataTable serviceOnlySalesBranchDT = converter.ToDataTable(serviceOnlySalesBranchList);
            RadHtmlChartGroupDataSource.GroupDataSource(ServiceOnlySalesBranchRHC1, serviceOnlySalesBranchDT, "Branch_Name", "AreaSeries", "Service_Total_Only", "Year_Month");


        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void AvgPerTransactionComODS1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {

        }

        protected void Branch_SelectedIndexChanged(object sender, EventArgs e)
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