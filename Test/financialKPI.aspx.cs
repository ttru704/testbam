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
            Session["IsAuthenticated"] = HttpContext.Current.User.Identity.IsAuthenticated;
            Boolean? authentication = Session["IsAuthenticated"] as Boolean?;
            if (authentication == true)
            {

                Session["StartDate"] = DatePicker1.SelectedDate.GetValueOrDefault();
                Session["EndDate"] = DatePicker2.SelectedDate.GetValueOrDefault();
                Session["Company"] = Convert.ToInt32(CompanyDDL1.SelectedItem.Value);
                Session["Branch"] = Convert.ToInt32(BranchDDL1.SelectedItem.Value);
                Session["Time"] = Convert.ToInt32(TimeDDL1.SelectedItem.Value);
                Int64? productSerivce = Session["ProductService"] as Int64?;

                if (!Page.IsPostBack)
                {
                    AddTab("Company");
                    AddPageView(RadTabStrip1.FindTabByText("Company"));
                    AddTab("Branch");
                    AddTab("Peer");
                    AddTab("Product&Service");
                }
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx");
            }
        }

        //This is for the RadTabStrip to work
        private void AddTab(string tabName)
        {
            RadTab tab = new RadTab();
            tab.Text = tabName;
            tab.Width = Unit.Pixel(200);
            RadTabStrip1.Tabs.Add(tab);
        }

        protected void RadMultiPage1_PageViewCreated(object sender, RadMultiPageEventArgs e)
        {
            string userControlName = "F" + e.PageView.ID + "CS.ascx";

            Control userControl = Page.LoadControl(userControlName);
            userControl.ID = "F" + e.PageView.ID + "_userControl";

            e.PageView.Controls.Add(userControl);
        }

        private void AddPageView(RadTab tab)
        {
            RadPageView pageView = new RadPageView();
            pageView.ID = tab.Text;
            pageView.CssClass = "contentWrapper" + tab.Index;
            RadMultiPage1.PageViews.Add(pageView);
            tab.PageViewID = pageView.ID;
        }

        protected void RadTabStrip1_TabClick(object sender, RadTabStripEventArgs e)
        {
            AddPageView(e.Tab);
            e.Tab.PageView.Selected = true;
        }

        //This is a class that help displaying chart with multiple branches

        protected void Button1_Click(object sender, EventArgs e)
        {

            //BranchDropDownListBL branchDropDownListBL = new BranchDropDownListBL();
            //List<usp_BranchDropDownList_Result> a = branchDropDownListBL.usp_BranchDropDownList(1);



            //String.Format("{0: mmm yy}", dt.Columns["Year_Month"]);
            //DateTime.ParseExact(dt.Columns["Year_Month"])

            //TotalSalesCompanyRHC1.DataBind();
            //RetailOnlySalesCompanyRHC1.DataBind();
            //AvgDollarPerTransactionCompanyRHC1.DataBind();
            //TransExcludeZeroTotalCompanyRHC1.DataBind();
            //ServiceOnlySalesCompanyRHC1.DataBind();

            //string labelsFormatString = "{0:n0}";
            //if (TimeDDL1.SelectedValue == "1")
            //{
            //    //DateTime dateformat = Convert.ToDateTime(dt);
            //    TotalSalesBranchRHC1.PlotArea.XAxis.LabelsAppearance.DataFormatString = "MMM yyyy";
            //    TotalSalesBranchRHC1.ChartTitle.Text = "Total Sales Branch Comparison";
            //    TotalSalesBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Time Period";


            //    TotalSalesBranchRHC1.PlotArea.YAxis.TitleAppearance.Text = "Total Sales (000s)";
            //    //TotalSalesBranchRHC1.PlotArea.YAxis.LabelsAppearance.DataFormatString = labelsFormatString;
            //    TotalSalesBranchRHC1.PlotArea.YAxis.LabelsAppearance.ClientTemplate = "#= value / 1000# ";
            //    TotalSalesBranchRHC1.PlotArea.YAxis.LabelsAppearance.DataFormatString = "{0:N0}";



            //    //AvgPerTransactionBranchRHC1.PlotArea.XAxis.LabelsAppearance.DataFormatString = "MMM";
            //    AvgDollarPerTransactionBranchRHC1.ChartTitle.Text = "Average per Transaction Branch Comparison";
            //    AvgDollarPerTransactionBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Time Period";
            //    AvgDollarPerTransactionBranchRHC1.PlotArea.YAxis.TitleAppearance.Text = "Average per Transaction";
            //    RetailOnlySalesBranchRHC1.PlotArea.YAxis.TitleAppearance.Text = "$";
            //    ServiceOnlySalesBranchRHC1.PlotArea.YAxis.TitleAppearance.Text = "$";
            //    RetailOnlySalesBranchRHC1.ChartTitle.Text = "Retail Only Sales Branch Comparison";
            //    ServiceOnlySalesBranchRHC1.ChartTitle.Text = "Service Only Sales Branch Comparison";

            //    //AvgPerTransactionBranchRHC1.PlotArea.XAxis.LabelsAppearance.ClientTemplate = "#=kendo.parseDate(value, \'yyyy/MM/dd\')#"; -disappears and all the graphs below it too

            //    //AvgPerTransactionBranchRHC1.PlotArea.XAxis.BaseUnit = "months";

            //}
            //else
            //{
            //    TotalSalesCompanyRHC1.PlotArea.XAxis.LabelsAppearance.DataFormatString = "yyyy";
            //    TotalSalesCompanyRHC1.ChartTitle.Text = "Total Yearly Sales";
            //    TotalSalesCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Year";

            //    AvgDollarPerTransactionBranchRHC1.PlotArea.XAxis.LabelsAppearance.DataFormatString = "yyyy";
            //    AvgDollarPerTransactionBranchRHC1.ChartTitle.Text = "Total Yearly Sales";
            //    AvgDollarPerTransactionBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Year";
            //};
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }



        protected void Company_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void CountryDDL1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int countryRef = Convert.ToInt32(CompanyDDL1.SelectedItem.Value);
            StateDDL1.DataBind();
        }
        protected void Try(object sender, EventArgs e)
        {
            int stateRef = Convert.ToInt32(StateDDL1.SelectedItem.Value);
            RegionDDL1.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["BranchType"] = Convert.ToInt32(BranchTypeDDL1.SelectedItem.Value);
            Session["Country"] = Convert.ToInt32(CountryDDL1.SelectedItem.Value);
            Session["State"] = Convert.ToInt32(StateDDL1.SelectedItem.Value);
            Session["Region"] = Convert.ToInt32(RegionDDL1.SelectedItem.Value);


        }

        private int branchNumber;
        protected void BranchDDL1_SelectedIndexChanged(object sender, DropDownListEventArgs e)
        {
            branchNumber = Convert.ToInt32(BranchDDL1.SelectedItem.Value);
        }

        protected void ProductServiceNameSearchBoxSB1_Search(object sender, SearchBoxEventArgs e)
        {
            Session["ProductService"] = Convert.ToInt64(e.Value);
        }

        
    }

}