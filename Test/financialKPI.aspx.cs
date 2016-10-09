using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Test
{
    public partial class financialkpi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Check if the user is authenticated, if not redirect to login page)
            if (HttpContext.Current.User.Identity.IsAuthenticated == true)
            {
                //Store session variables based on slected controls
                Session["StartDate"] = DatePicker1.SelectedDate.GetValueOrDefault();
                Session["EndDate"] = DatePicker2.SelectedDate.GetValueOrDefault();
                int? company = Session["CompanyRef"] as int?;
                Session["BranchRef"] = 0;
                Session["Time"] = Convert.ToInt32(TimeDDL1.SelectedItem.Value);
                Int64? productSerivce = Session["ProductService"] as Int64?;

                //Adds the specific Tabs if it's not a postback (or else it keeps adding)
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

        //Actual function to add the Tab 
        private void AddTab(string tabName)
        {
            RadTab tab = new RadTab();
            tab.Text = tabName;
            tab.Width = Unit.Pixel(200);
            RadTabStrip1.Tabs.Add(tab);
        }
        //Calls the user control which has teh content for the PageView
        protected void RadMultiPage1_PageViewCreated(object sender, RadMultiPageEventArgs e)
        {
            string userControlName = "F" + e.PageView.ID + "CS.ascx";

            Control userControl = Page.LoadControl(userControlName);
            userControl.ID = "F" + e.PageView.ID + "_userControl";

            e.PageView.Controls.Add(userControl);
        }
        //Adds the PageView for the respective tab
        private void AddPageView(RadTab tab)
        {
            RadPageView pageView = new RadPageView();
            pageView.ID = tab.Text;
            pageView.CssClass = "contentWrapper" + tab.Index;
            RadMultiPage1.PageViews.Add(pageView);
            tab.PageViewID = pageView.ID;
        }

        //Shows correct PageView for the selected Tab
        protected void RadTabStrip1_TabClick(object sender, RadTabStripEventArgs e)
        {
            AddPageView(e.Tab);
            e.Tab.PageView.Selected = true;
        }
        
    }

}