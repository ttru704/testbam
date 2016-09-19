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
    public partial class CCompanyCS : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime? start = Session["StartDate"] as DateTime?;
            DateTime? end = Session["EndDate"] as DateTime?;
            //int? company = Session["Company"] as int?;
            int? branch = Session["Branch"] as int?;
            int? time = Session["Time"] as int?;

            //addItem();

            string userRef = Session["UserRef"] as string;
            ViewableKpiListBL viewableKpiListBL = new ViewableKpiListBL();
            List<usp_ViewableKpiList_Result> viewableKpiList = viewableKpiListBL.usp_ViewableKpiList(userRef, 2, "Company");
            foreach (var element in viewableKpiList)
            {
                string name = element.Name;
                string toolTip = element.Description;
                RadPanelBar1.FindItemByText(name).Visible = true;
                RadPanelBar1.FindItemByText(name).ToolTip = toolTip;
            }

            RadPanelItem item = RadPanelBar1.FindItemByText("Number of Unique Customers Seen - Company");
            if (item.Expanded == true)
            {
                BindUniqueCustomersSeenCompany();
            }

            RadPanelItem item1 = RadPanelBar1.FindItemByText("Number of Animals Seen - Company");
            if (item1.Expanded == true)
            {
                BindAnimalsSeenCompany();
            }

            RadPanelItem item2 = RadPanelBar1.FindItemByText("Average Dollar per Customer - Company");
            if (item2.Expanded == true)
            {
                BindAvgDollarPerCustomerCompany();
            }

            RadPanelItem item3 = RadPanelBar1.FindItemByText("Number of New Customers - Company");
            if (item3.Expanded == true)
            {
                BindNewCustomersCompany();
            }

            RadPanelItem item4 = RadPanelBar1.FindItemByText("Number of Small Animals - Company");
            if (item4.Expanded == true)
            {
                BindSmallAnimalsCompany();
            }

            RadPanelItem item5 = RadPanelBar1.FindItemByText("Number of Large Animals - Company");
            if (item5.Expanded == true)
            {
                BindLargeAnimalsCompany();
            }


            if (time == 1)
            {
                UniqueCustomersSeenCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                AnimalsSeenCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                AvgDollarPerCustomerCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                NewCustomersCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                SmallAnimalsCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                LargeAnimalsCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
            }
            else if (time == 2)
            {
                UniqueCustomersSeenCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                AnimalsSeenCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                AvgDollarPerCustomerCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                NewCustomersCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                SmallAnimalsCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                LargeAnimalsCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
            }
            else if (time == 3)
            {
                UniqueCustomersSeenCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                AnimalsSeenCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                AvgDollarPerCustomerCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                NewCustomersCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                SmallAnimalsCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                LargeAnimalsCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
            }
        }

        
        protected void RadPanelBar1_ItemClick(object sender, RadPanelBarEventArgs e)
        {
            RadPanelItem itemClicked = e.Item;
            if (itemClicked.Expanded == true)
            {
                if (itemClicked.Text == "Number of Unique Customers Seen - Company")
                {
                    BindUniqueCustomersSeenCompany();
                }
                else if (itemClicked.Text == "Number of Animals Seen - Company")
                {
                    BindAnimalsSeenCompany();
                }
                else if (itemClicked.Text == "Average Dollar per Customer - Company")
                {
                    BindAvgDollarPerCustomerCompany();
                }
                else if (itemClicked.Text == "Number of New Customers - Company")
                {
                    BindNewCustomersCompany();
                }
                else if (itemClicked.Text == "Number of Small Animals - Company")
                {
                    BindSmallAnimalsCompany();
                }
                else if (itemClicked.Text == "Number of Large Animals - Company")
                {
                    BindLargeAnimalsCompany();
                }
            }
        }

        protected void BindUniqueCustomersSeenCompany()
        {
            DateTime? start = Session["StartDate"] as DateTime?;
            DateTime? end = Session["EndDate"] as DateTime?;
            Int64? company = Session["CompanyRef"] as Int64?;
            int? time = Session["Time"] as int?;

            var startValue = start.ToString();
            var endValue = end.ToString();
            var companyValue = company.ToString();
            var timeValue = time.ToString();

            UniqueCustomersSeenCompanyODS1.SelectParameters.Clear();
            UniqueCustomersSeenCompanyODS1.SelectParameters.Add("start", TypeCode.DateTime, startValue);
            UniqueCustomersSeenCompanyODS1.SelectParameters.Add("end", TypeCode.DateTime, endValue);
            UniqueCustomersSeenCompanyODS1.SelectParameters.Add("companyRef", TypeCode.Int64, companyValue);
            UniqueCustomersSeenCompanyODS1.SelectParameters.Add("timeType", TypeCode.Int32, timeValue);
            UniqueCustomersSeenCompanyRHC1.DataBind();
        }

        protected void BindAnimalsSeenCompany()
        {
            DateTime? start = Session["StartDate"] as DateTime?;
            DateTime? end = Session["EndDate"] as DateTime?;
            Int64? company = Session["CompanyRef"] as Int64?;
            int? time = Session["Time"] as int?;

            var startValue = start.ToString();
            var endValue = end.ToString();
            var companyValue = company.ToString();
            var timeValue = time.ToString();

            AnimalsSeenCompanyODS1.SelectParameters.Clear();
            AnimalsSeenCompanyODS1.SelectParameters.Add("start", TypeCode.DateTime, startValue);
            AnimalsSeenCompanyODS1.SelectParameters.Add("end", TypeCode.DateTime, endValue);
            AnimalsSeenCompanyODS1.SelectParameters.Add("companyRef", TypeCode.Int64, companyValue);
            AnimalsSeenCompanyODS1.SelectParameters.Add("timeType", TypeCode.Int32, timeValue);
            AnimalsSeenCompanyRHC1.DataBind();
        }

        protected void BindAvgDollarPerCustomerCompany()
        {
            DateTime? start = Session["StartDate"] as DateTime?;
            DateTime? end = Session["EndDate"] as DateTime?;
            Int64? company = Session["CompanyRef"] as Int64?;
            int? time = Session["Time"] as int?;
             
            var startValue = start.ToString();
            var endValue = end.ToString();
            var companyValue = company.ToString();
            var timeValue = time.ToString();

            AvgDollarPerCustomerCompanyODS1.SelectParameters.Clear();
            AvgDollarPerCustomerCompanyODS1.SelectParameters.Add("start", TypeCode.DateTime, startValue);
            AvgDollarPerCustomerCompanyODS1.SelectParameters.Add("end", TypeCode.DateTime, endValue);
            AvgDollarPerCustomerCompanyODS1.SelectParameters.Add("companyRef", TypeCode.Int64, companyValue);
            AvgDollarPerCustomerCompanyODS1.SelectParameters.Add("timeType", TypeCode.Int32, timeValue);
            AvgDollarPerCustomerCompanyRHC1.DataBind();
        }

        protected void BindNewCustomersCompany()
        {
            DateTime? start = Session["StartDate"] as DateTime?;
            DateTime? end = Session["EndDate"] as DateTime?;
            Int64? company = Session["CompanyRef"] as Int64?;
            int? time = Session["Time"] as int?;

            var startValue = start.ToString();
            var endValue = end.ToString();
            var companyValue = company.ToString();
            var timeValue = time.ToString();

            NewCustomersCompanyODS1.SelectParameters.Clear();
            NewCustomersCompanyODS1.SelectParameters.Add("start", TypeCode.DateTime, startValue);
            NewCustomersCompanyODS1.SelectParameters.Add("end", TypeCode.DateTime, endValue);
            NewCustomersCompanyODS1.SelectParameters.Add("companyRef", TypeCode.Int64, companyValue);
            NewCustomersCompanyODS1.SelectParameters.Add("timeType", TypeCode.Int32, timeValue);
            NewCustomersCompanyRHC1.DataBind();
        }

        protected void BindSmallAnimalsCompany()
        {
            DateTime? start = Session["StartDate"] as DateTime?;
            DateTime? end = Session["EndDate"] as DateTime?;
            Int64? company = Session["CompanyRef"] as Int64?;
            int? time = Session["Time"] as int?;

            var startValue = start.ToString();
            var endValue = end.ToString();
            var companyValue = company.ToString();
            var timeValue = time.ToString();

            SmallAnimalsCompanyODS1.SelectParameters.Clear();
            SmallAnimalsCompanyODS1.SelectParameters.Add("start", TypeCode.DateTime, startValue);
            SmallAnimalsCompanyODS1.SelectParameters.Add("end", TypeCode.DateTime, endValue);
            SmallAnimalsCompanyODS1.SelectParameters.Add("companyRef", TypeCode.Int64, companyValue);
            SmallAnimalsCompanyODS1.SelectParameters.Add("timeType", TypeCode.Int32, timeValue);
            SmallAnimalsCompanyRHC1.DataBind();
        }

        protected void BindLargeAnimalsCompany()
        {
            DateTime? start = Session["StartDate"] as DateTime?;
            DateTime? end = Session["EndDate"] as DateTime?;
            Int64? company = Session["CompanyRef"] as Int64?;
            int? time = Session["Time"] as int?;

            var startValue = start.ToString();
            var endValue = end.ToString();
            var companyValue = company.ToString();
            var timeValue = time.ToString();

            LargeAnimalsCompanyODS1.SelectParameters.Clear();
            LargeAnimalsCompanyODS1.SelectParameters.Add("start", TypeCode.DateTime, startValue);
            LargeAnimalsCompanyODS1.SelectParameters.Add("end", TypeCode.DateTime, endValue);
            LargeAnimalsCompanyODS1.SelectParameters.Add("companyRef", TypeCode.Int64, companyValue);
            LargeAnimalsCompanyODS1.SelectParameters.Add("timeType", TypeCode.Int32, timeValue);
            LargeAnimalsCompanyRHC1.DataBind();
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

        //protected void addItem()
        //{
        //    string userRef = Session["UserRef"] as string;

        //    ViewableKpiListBL viewableKpiListBL = new ViewableKpiListBL();
        //    List<usp_ViewableKpiList_Result> viewableKpiList = viewableKpiListBL.usp_ViewableKpiList(userRef, 2, "Company");

        //    foreach (var element in viewableKpiList)
        //    {
        //        var name = element.Name;
        //        var controlName = "CCompanyKPIControls/" + element.Control_Name + ".ascx";
        //        var desc = element.Description;

        //        RadPanelItem item = new RadPanelItem();
        //        item.Text = name;
        //        item.Expanded = false;
        //        RadPanelBar1.Items.Add(item);

        //        RadPanelItem childItem = new RadPanelItem();
        //        childItem.Controls.Add(LoadControl(controlName));
        //        item.Items.Add(childItem);

        //        childItem.ToolTip = desc;
        //    }
        //}
    }
}