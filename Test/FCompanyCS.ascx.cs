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
            int? company = Session["Company"] as int?;
            int? branch = Session["Branch"] as int?;
            int? time = Session["Time"] as int?;

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

        
    }
}