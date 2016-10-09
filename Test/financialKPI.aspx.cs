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
            if (HttpContext.Current.User.Identity.IsAuthenticated == true)
            {

                Session["StartDate"] = DatePicker1.SelectedDate.GetValueOrDefault();
                Session["EndDate"] = DatePicker2.SelectedDate.GetValueOrDefault();
                //Session["Company"] = Convert.ToInt32(CompanyDDL1.SelectedItem.Value);
                int? company = Session["CompanyRef"] as int?;
                //Session["BranchRef"] = Convert.ToInt64(BranchDDL1.SelectedItem.Value);
                Session["BranchRef"] = 0;
                Session["Time"] = Convert.ToInt32(TimeDDL1.SelectedItem.Value);
                Int64? productSerivce = Session["ProductService"] as Int64?;

                if (!Page.IsPostBack)
                {
                    AddTab("Company");
                    AddPageView(RadTabStrip1.FindTabByText("Company"));
                    AddTab("Branch");
                    AddTab("Peer");
                    AddTab("ProductService");
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
        
    }

}