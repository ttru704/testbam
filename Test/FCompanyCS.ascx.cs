using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Test.BLL.Controls;
using Test.Models;

namespace Test
{
    public partial class FCompanyCS : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            DateTime? start = Session["StartDate"] as DateTime?;
            DateTime? end = Session["EndDate"] as DateTime?;
            Int64? company = Session["CompanyRef"] as Int64?;
            int? branch = Session["Branch"] as int?;
            int? time = Session["Time"] as int?;

            //This loop will make radpanelitem visible if they are contained in the list below
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

            RadPanelItem item = RadPanelBar1.FindItemByText("Total Sales - Company");
            if (item.Expanded == true)
            {
                BindTotalSalesCompany();
            }

            RadPanelItem item1 = RadPanelBar1.FindItemByText("Average Dollar per Transaction - Company");
            if (item1.Expanded == true)
            {
                BindAvgDollarPerTransactionCompany();
            }

            RadPanelItem item2 = RadPanelBar1.FindItemByText("Number of Transactions excluding zero total bills - Company");
            if (item2.Expanded == true)
            {
                BindTransExcludeZeroTotalCompany();
            }

            RadPanelItem item3 = RadPanelBar1.FindItemByText("Income by Product Category - Company");
            if (item3.Expanded == true)
            {
                BindIncomeByProductCategoryCompany();
            }

            RadPanelItem item4 = RadPanelBar1.FindItemByText("Income by Service Activity - Company");
            if (item4.Expanded == true)
            {
                BindIncomeByServiceActivityCompany();
            }

            RadPanelItem item5 = RadPanelBar1.FindItemByText("Retail Only Sales - Company");
            if (item5.Expanded == true)
            {
                BindRetailOnlySalesCompany();
            }

            RadPanelItem item6 = RadPanelBar1.FindItemByText("Service Only Sales - Company");
            if (item6.Expanded == true)
            {
                BindServiceOnlySalesCompany();
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
                else if (time == 3)
                {
                    TotalSalesCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                    AvgDollarPerTransactionCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                    TransExcludeZeroTotalCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                    RetailOnlySalesCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                    ServiceOnlySalesCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                }
        }

        protected void TotalSalesCompanyRHC1_Load(object sender, EventArgs e)
        {
            TotalSalesCompanyRHC1.DataBind();
        }


        //protected void addItem()
        //{
        //    /// //// //// ///// /////// /////////////////////////
        //    ///REPLACE THIS WITH THE STORED PROCEDURE KPI LIST///
        //    /////////////////////////////////////////////////////
        //    // Also needs the Tooltip to be inside! store it as//
        //    //var c or something                               //
        //    /////////////////////////////////////////////////////
        //    string userRef = Session["UserRef"] as string;

        //    ViewableKpiListBL viewableKpiListBL = new ViewableKpiListBL();
        //    List<usp_ViewableKpiList_Result> viewableKpiList = viewableKpiListBL.usp_ViewableKpiList(userRef, 1, "Company");

        //    foreach (var element in viewableKpiList)
        //    {
        //        var name = element.Name;
        //        var controlName = "FCompanyKPIControls/" + element.Control_Name + ".ascx";
        //        var desc = element.Description;

        //        RadPanelItem item = new RadPanelItem();
        //        item.Text = name;
        //        item.Expanded = false;
        //        item.ToolTip = desc;
        //        RadPanelBar1.Items.Add(item);

        //        RadPanelItem childItem = new RadPanelItem();
        //        childItem.Controls.Add(LoadControl(controlName));
        //        item.Items.Add(childItem);

        //        RadPanelBar1.FindItemByText(name).Visible=false;
        //    }
        //}

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

        protected void RadPanelBar1_ItemClick(object sender, RadPanelBarEventArgs e)
        {
            RadPanelItem itemClicked = e.Item;
            if (itemClicked.Expanded == true)
            {
                if (itemClicked.Text == "Total Sales - Company")
                {
                    BindTotalSalesCompany();
                }
                else if (itemClicked.Text == "Average Dollar per Transaction - Company")
                {
                    BindAvgDollarPerTransactionCompany();
                }
                else if (itemClicked.Text == "Number of Transactions excluding zero total bills -Company")
                {
                    BindTransExcludeZeroTotalCompany();
                }
                else if (itemClicked.Text == "Income by Product Category - Company")
                {
                    BindIncomeByProductCategoryCompany();
                }
                else if(itemClicked.Text == "Income by Service Activity - Company")
                {
                    BindIncomeByServiceActivityCompany();
                }
                else if(itemClicked.Text == "Retail Only Sales - Company")
                {
                    BindRetailOnlySalesCompany();
                }
                else if(itemClicked.Text == "Service Only Sales - Company")
                {
                    BindServiceOnlySalesCompany();
                }
            }
        }

        protected void BindTotalSalesCompany()
        {
            DateTime? start = Session["StartDate"] as DateTime?;
            DateTime? end = Session["EndDate"] as DateTime?;
            Int64? company = Session["CompanyRef"] as Int64?;
            int? time = Session["Time"] as int?;

            var startValue = start.ToString();
            var endValue = end.ToString();
            var companyValue = company.ToString();
            var timeValue = time.ToString();

            TotalSalesCompanyODS.SelectParameters.Clear();
            TotalSalesCompanyODS.SelectParameters.Add("start", TypeCode.DateTime, startValue);
            TotalSalesCompanyODS.SelectParameters.Add("end", TypeCode.DateTime, endValue);
            TotalSalesCompanyODS.SelectParameters.Add("companyRef", TypeCode.Int64, companyValue);
            TotalSalesCompanyODS.SelectParameters.Add("timeType", TypeCode.Int32, timeValue);
            TotalSalesCompanyRHC1.DataBind();
            TotalSalesComG1.DataBind();
        }

        protected void BindAvgDollarPerTransactionCompany()
        {
            DateTime? start = Session["StartDate"] as DateTime?;
            DateTime? end = Session["EndDate"] as DateTime?;
            Int64? company = Session["CompanyRef"] as Int64?;
            int? time = Session["Time"] as int?;

            var startValue = start.ToString();
            var endValue = end.ToString();
            var companyValue = company.ToString();
            var timeValue = time.ToString();

            AvgDollarPerTransactionCompanyODS1.SelectParameters.Clear();
            AvgDollarPerTransactionCompanyODS1.SelectParameters.Add("start", TypeCode.DateTime, startValue);
            AvgDollarPerTransactionCompanyODS1.SelectParameters.Add("end", TypeCode.DateTime, endValue);
            AvgDollarPerTransactionCompanyODS1.SelectParameters.Add("companyRef", TypeCode.Int64, companyValue);
            AvgDollarPerTransactionCompanyODS1.SelectParameters.Add("timeType", TypeCode.Int32, timeValue);
            AvgDollarPerTransactionCompanyRHC1.DataBind();
            AvgPerTransactionComG1.DataBind();
        }

        protected void BindTransExcludeZeroTotalCompany()
        {
            DateTime? start = Session["StartDate"] as DateTime?;
            DateTime? end = Session["EndDate"] as DateTime?;
            Int64? company = Session["CompanyRef"] as Int64?;
            int? time = Session["Time"] as int?;

            var startValue = start.ToString();
            var endValue = end.ToString();
            var companyValue = company.ToString();
            var timeValue = time.ToString();

            TransExcludeZeroTotalCompanyODS1.SelectParameters.Clear();
            TransExcludeZeroTotalCompanyODS1.SelectParameters.Add("start", TypeCode.DateTime, startValue);
            TransExcludeZeroTotalCompanyODS1.SelectParameters.Add("end", TypeCode.DateTime, endValue);
            TransExcludeZeroTotalCompanyODS1.SelectParameters.Add("companyRef", TypeCode.Int64, companyValue);
            TransExcludeZeroTotalCompanyODS1.SelectParameters.Add("timeType", TypeCode.Int32, timeValue);
            TransExcludeZeroTotalCompanyRHC1.DataBind();
            TransExcludeZeroTotalComG1.DataBind();
        }

        protected void BindIncomeByProductCategoryCompany()
        {
            DateTime? start = Session["StartDate"] as DateTime?;
            DateTime? end = Session["EndDate"] as DateTime?;
            Int64? company = Session["CompanyRef"] as Int64?;

            var startValue = start.ToString();
            var endValue = end.ToString();
            var companyValue = company.ToString();

            IncomeByProductCategoryCompanyODS1.SelectParameters.Clear();
            IncomeByProductCategoryCompanyODS1.SelectParameters.Add("start", TypeCode.DateTime, startValue);
            IncomeByProductCategoryCompanyODS1.SelectParameters.Add("end", TypeCode.DateTime, endValue);
            IncomeByProductCategoryCompanyODS1.SelectParameters.Add("companyRef", TypeCode.Int64, companyValue);
            IncomeByProductCategoryCompanyRHC1.DataBind();
            IncomeByProductCategoryCompanyG1.DataBind();
        }

        protected void BindIncomeByServiceActivityCompany()
        {
            DateTime? start = Session["StartDate"] as DateTime?;
            DateTime? end = Session["EndDate"] as DateTime?;
            Int64? company = Session["CompanyRef"] as Int64?;

            var startValue = start.ToString();
            var endValue = end.ToString();
            var companyValue = company.ToString();

            IncomeByServiceActivityCompanyODS1.SelectParameters.Clear();
            IncomeByServiceActivityCompanyODS1.SelectParameters.Add("start", TypeCode.DateTime, startValue);
            IncomeByServiceActivityCompanyODS1.SelectParameters.Add("end", TypeCode.DateTime, endValue);
            IncomeByServiceActivityCompanyODS1.SelectParameters.Add("companyRef", TypeCode.Int64, companyValue);
            IncomeByServiceActivityCompanyRHC1.DataBind();
            IncomeByServiceActivityCompanyG1.DataBind();
        }

        protected void BindRetailOnlySalesCompany()
        {
            DateTime? start = Session["StartDate"] as DateTime?;
            DateTime? end = Session["EndDate"] as DateTime?;
            Int64? company = Session["CompanyRef"] as Int64?;
            int? time = Session["Time"] as int?;

            var startValue = start.ToString();
            var endValue = end.ToString();
            var companyValue = company.ToString();
            var timeValue = time.ToString();

            RetailOnlySalesCompanyODS1.SelectParameters.Clear();
            RetailOnlySalesCompanyODS1.SelectParameters.Add("start", TypeCode.DateTime, startValue);
            RetailOnlySalesCompanyODS1.SelectParameters.Add("end", TypeCode.DateTime, endValue);
            RetailOnlySalesCompanyODS1.SelectParameters.Add("companyRef", TypeCode.Int64, companyValue);
            RetailOnlySalesCompanyODS1.SelectParameters.Add("timeType", TypeCode.Int32, timeValue);
            RetailOnlySalesCompanyRHC1.DataBind();
            RetailOnlySalesComG1.DataBind();
        }

        protected void BindServiceOnlySalesCompany()
        {
            DateTime? start = Session["StartDate"] as DateTime?;
            DateTime? end = Session["EndDate"] as DateTime?;
            Int64? company = Session["CompanyRef"] as Int64?;
            int? time = Session["Time"] as int?;

            var startValue = start.ToString();
            var endValue = end.ToString();
            var companyValue = company.ToString();
            var timeValue = time.ToString();

            ServiceOnlySalesCompanyODS1.SelectParameters.Clear();
            ServiceOnlySalesCompanyODS1.SelectParameters.Add("start", TypeCode.DateTime, startValue);
            ServiceOnlySalesCompanyODS1.SelectParameters.Add("end", TypeCode.DateTime, endValue);
            ServiceOnlySalesCompanyODS1.SelectParameters.Add("companyRef", TypeCode.Int64, companyValue);
            ServiceOnlySalesCompanyODS1.SelectParameters.Add("timeType", TypeCode.Int32, timeValue);
            ServiceOnlySalesCompanyRHC1.DataBind();
            ServiceOnlySalesComG1.DataBind();
        }
    }
}