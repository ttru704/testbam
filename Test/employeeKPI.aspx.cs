using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Test.Models;
using Test.BLL.Productivity;

namespace Test
{
    public partial class employeekpi : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (HttpContext.Current.User.Identity.IsAuthenticated == true)
            {
                Session["StartDate"] = DatePicker1.SelectedDate.GetValueOrDefault();
                Session["EndDate"] = DatePicker2.SelectedDate.GetValueOrDefault();
                Session["Company"] = Convert.ToInt32(CompanyDDL1.SelectedItem.Value);
                Int64? employee = Session["Employee"] as Int64?;
                Session["Time"] = Convert.ToInt32(TimeDDL1.SelectedItem.Value);
                if (!Page.IsPostBack)
                {
                    AddTab("Company");
                    AddPageView(RadTabStrip1.FindTabByText("Company"));
                    AddTab("Individual");
                    //AddTab("Peer");

                }
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx");
            }
        }

        //protected void EmployeeSB_Search(object sender, SearchBoxEventArgs e)
        //{
        //    Session["Employee"] = Convert.ToInt64(e.Value);
        //}


        //This is for the RadTabStrip to work
        private void AddTab(string tabName)
        {
            RadTab tab = new RadTab();
            tab.Text = tabName;
            tab.Width = Unit.Percentage(45);//.Pixel(200);
            RadTabStrip1.Tabs.Add(tab);
        }

        protected void RadMultiPage1_PageViewCreated(object sender, RadMultiPageEventArgs e)
        {
            string userControlName = "E" + e.PageView.ID + "CS.ascx";

            Control userControl = Page.LoadControl(userControlName);
            userControl.ID = "E" + e.PageView.ID + "_userControl";

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


            //Do we need this?
            //DateTime start = DatePicker1.SelectedDate.GetValueOrDefault();
            //DateTime end = DatePicker2.SelectedDate.GetValueOrDefault();

            //ListtoDataTableConverter converter = new ListtoDataTableConverter();

            //CustomersSeenByEmployeeCompanyBL customersSeenByEmployeeCompanyBL = new CustomersSeenByEmployeeCompanyBL();
            //List<usp_CustomersSeenByEmployeeCompany_Result> customersSeenByEmployeeCompanyList = customersSeenByEmployeeCompanyBL.usp_CustomersSeenByEmployeeCompany(start, end, 1, 2);


            //DataTable customersSeenByEmployeeCompanyDT = converter.ToDataTable(customersSeenByEmployeeCompanyList);


            //RadHtmlChartGroupDataSource.GroupDataSource(CustomersSeenByEmployeeCompanyRHC1, customersSeenByEmployeeCompanyDT, "Employee_Name", "BarSeries", "Number_Of_Customers_Seen_By_An_Employee", "TimePeriod");

            //AnimalsSeenByEmployeeCompanyBL animalsSeenByEmployeeCompanyBL = new AnimalsSeenByEmployeeCompanyBL();
            //List<usp_AnimalsSeenByEmployeeCompany_Result> animalsSeenByEmployeeCompanyList = animalsSeenByEmployeeCompanyBL.usp_AnimalsSeenByEmployeeCompany(start, end, 1, 2);

            //DataTable animalsSeenByEmployeeCompanyDT = converter.ToDataTable(animalsSeenByEmployeeCompanyList);
            //RadHtmlChartGroupDataSource.GroupDataSource(AnimalsSeenByEmployeeCompanyRHC1, animalsSeenByEmployeeCompanyDT, "Employee_Name", "ColumnSeries", "Number_Of_Animals_Seen_By_An_Employee", "TimePeriod");





        }

        protected void EmployeeCB1_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            Session["Employee"] = Convert.ToInt64(e.Value);
        }
    }
}