using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Telerik.Web.UI.GridExcelBuilder;
using Test.BLL.Customer;
using Test.Models;
using xi = Telerik.Web.UI.ExportInfrastructure;
using System.Drawing;


namespace Test
{
    public partial class customerkpi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated == true)
            {
                Session["StartDate"] = DatePicker1.SelectedDate.GetValueOrDefault();
                Session["EndDate"] = DatePicker2.SelectedDate.GetValueOrDefault();
                //Session["BranchRef"] = Convert.ToInt64(BranchDDL1.SelectedItem.Value);
                Session["Time"] = Convert.ToInt32(TimeDDL1.SelectedItem.Value);

                if (!Page.IsPostBack)
                {
                    AddTab("Company");
                    AddPageView(RadTabStrip1.FindTabByText("Company"));
                    AddTab("Branch");
                    AddTab("Peer");

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
            string userControlName = "C" + e.PageView.ID + "CS.ascx";

            Control userControl = Page.LoadControl(userControlName);
            userControl.ID = "C" + e.PageView.ID + "_userControl";

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



        protected void Button1_Click(object sender, EventArgs e)
        {
            //UniqueCustomersSeenCompanyRHC1.DataBind();
            //AnimalsSeenCompanyRHC1.DataBind();
            //AvgDollarPerCustomerCompanyRHC1.DataBind();            
            //NewCustomersCompanyRHC1.DataBind();
            //LargeAnimalsCompanyRHC1.DataBind();
            //SmallAnimalsCompanyRHC1.DataBind();

            //AnimalsSeenIndustryBL animalsSeenIndustryBL = new AnimalsSeenIndustryBL();
            //List<usp_AnimalsSeenIndustry_Result> animalsSeenIndustryList = animalsSeenIndustryBL.usp_AnimalsSeenIndustry(start, end, 1, 1, 1);
            //DataTable animalsSeenIndustryDT = converter.ToDataTable(animalsSeenIndustryList);
            //RadHtmlChartGroupDataSource.GroupDataSource(AnimalsSeenIndustryRHC1, animalsSeenIndustryDT, "Name", "LineSeries", "Number_of_Animals_Seen", "TimePeriod");

            //AnimalsSeenIndustryRHC1.ChartTitle.Text = "Number of Animals Seen Peer Comparison";
            //AnimalsSeenIndustryRHC1.PlotArea.YAxis.TitleAppearance.Text = "Number of Animals";
            //AnimalsSeenIndustryRHC1.PlotArea.XAxis.TitleAppearance.Text = "Time Period";

           


        }


    }
}