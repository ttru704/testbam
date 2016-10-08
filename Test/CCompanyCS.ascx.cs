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

            


            if (time == 1)
            {
                UniqueCustomersSeenCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Month";
                AnimalsSeenCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Month";
                AvgDollarPerCustomerCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Month";
                NewCustomersCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Month";
                SmallAnimalsCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Month";
                LargeAnimalsCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Month";
            }
            else if (time == 2)
            {
                UniqueCustomersSeenCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Year";
                AnimalsSeenCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Year";
                AvgDollarPerCustomerCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Year";
                NewCustomersCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Year";
                SmallAnimalsCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Year";
                LargeAnimalsCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Year";
            }
            else if (time == 3)
            {
                UniqueCustomersSeenCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Week";
                AnimalsSeenCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Week";
                AvgDollarPerCustomerCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Week";
                NewCustomersCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Week";
                SmallAnimalsCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Week";
                LargeAnimalsCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Week";
            }
        }

        
        //This is for grid exporting
        protected void ExportGridCustomiser(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == Telerik.Web.UI.RadGrid.ExportToWordCommandName ||
                e.CommandName == Telerik.Web.UI.RadGrid.ExportToExcelCommandName || e.CommandName == Telerik.Web.UI.RadGrid.ExportToPdfCommandName)
                sender.ToString();
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