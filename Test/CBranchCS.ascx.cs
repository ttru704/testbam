using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Telerik.Web.UI.GridExcelBuilder;
using Test.BLL.Controls;
using Test.BLL.Customer;
using Test.Models;

namespace Test
{
    public partial class CBranchCS : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StartDate"] != null)
            {
                DateTime? start = Session["StartDate"] as DateTime?;
                DateTime? end = Session["EndDate"] as DateTime?;
                Int64? company = Session["CompanyRef"] as Int64?;
                Session["BranchRef"] = Convert.ToInt64(BranchCB1.SelectedItem.Value);
                Int64? branch = Session["BranchRef"] as Int64?;
                int? time = Session["Time"] as int?;

                // call the session that stores the user ref
                string userRef = Session["UserRef"] as string;

                //Store the list of kpi that the current user is allowed to view
                ViewableKpiListBL viewableKpiListBL = new ViewableKpiListBL();
                List<usp_ViewableKpiList_Result> viewableKpiList = viewableKpiListBL.usp_ViewableKpiList(userRef, 2, "Branch Comparison");

                //loop through the list of kpi that current user is allowed to view then make these kpi visible to user
                foreach (var element in viewableKpiList)
                {
                    string name = element.Name;
                    string toolTip = element.Description;
                    RadPanelBar1.FindItemByText(name).Visible = true;
                    RadPanelBar1.FindItemByText(name).ToolTip = toolTip;
                }

                ListtoDataTableConverter converter = new ListtoDataTableConverter();

                UniqueCustomersSeenBranchBL uniqueCustomersSeenBranchBL = new UniqueCustomersSeenBranchBL();
                List<usp_UniqueCustomersSeenBranch_Result> uniqueCustomersSeenBranchList = uniqueCustomersSeenBranchBL.usp_UniqueCustomersSeenBranch(start, end, company, branch, time);
                DataTable uniqueCustomersSeenBranchDT = converter.ToDataTable(uniqueCustomersSeenBranchList);
                RadHtmlChartGroupDataSource.GroupDataSource(UniqueCustomersSeenBranchRHC1, uniqueCustomersSeenBranchDT, "Branch_Name", "LineSeries", "Number_of_Unique_Clients", "TimePeriod");



                AnimalsSeenBranchBL animalsSeenBranchBL = new AnimalsSeenBranchBL();
                List<usp_AnimalsSeenBranch_Result> animalsSeenBranchList = animalsSeenBranchBL.usp_AnimalsSeenBranch(start, end, company, branch, time);
                DataTable animalsSeenBranchDT = converter.ToDataTable(animalsSeenBranchList);
                RadHtmlChartGroupDataSource.GroupDataSource(AnimalsSeenBranchRHC1, animalsSeenBranchDT, "Branch_Name", "ColumnSeries", "Number_of_Animals_Seen", "TimePeriod");

                AvgDollarPerCustomerBranchBL avgDollarPerCustomerBranchBL = new AvgDollarPerCustomerBranchBL();
                List<usp_AvgDollarPerCustomerBranch_Result> avgDollarPerCustomerBranchList = avgDollarPerCustomerBranchBL.usp_AvgDollarPerCustomerBranch(start, end, company, branch, time);
                DataTable avgDollarPerCustomerBranchDT = converter.ToDataTable(avgDollarPerCustomerBranchList);
                RadHtmlChartGroupDataSource.GroupDataSource(AvgDollarPerCustomerBranchRHC1, avgDollarPerCustomerBranchDT, "Branch_Name", "LineSeries", "Average_Dollar_per_Customer", "TimePeriod");

                

                NewCustomersBranchBL newCustomersBranchBL = new NewCustomersBranchBL();
                List<usp_NewCustomersBranch_Result> newCustomersBranchList = newCustomersBranchBL.usp_NewCustomersBranch(start, end, company, branch, time);

                DataTable newCustomersBranchDT = converter.ToDataTable(newCustomersBranchList);
                RadHtmlChartGroupDataSource.GroupDataSource(NewCustomersBranchRHC1, newCustomersBranchDT, "Branch_Name", "ColumnSeries", "Number_of_New_Customers", "TimePeriod");
                NewCustomersBranchRHC1.ChartTitle.Text = "No of New Customers Branch Comparison";
                NewCustomersBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Time Period";
                NewCustomersBranchRHC1.PlotArea.YAxis.TitleAppearance.Text = "No of New Customers";



                SmallAnimalsBranchBL smallAnimalsBranchBL = new SmallAnimalsBranchBL();
                List<usp_SmallAnimalsBranch_Result> smallAnimalsBranchList = smallAnimalsBranchBL.usp_SmallAnimalsBranch(start, end, company, branch, time);
                DataTable smallAnimalsBranchDT = converter.ToDataTable(smallAnimalsBranchList);
                RadHtmlChartGroupDataSource.GroupDataSource(SmallAnimalsBranchRHC1, smallAnimalsBranchDT, "Branch_Name", "LineSeries", "Number_of_Small_Animals", "TimePeriod");

                SmallAnimalsBranchRHC1.ChartTitle.Text = "Number of Small Animals Branch Comparison";
                SmallAnimalsBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Time Period";
                SmallAnimalsBranchRHC1.PlotArea.YAxis.TitleAppearance.Text = "No of Small Animals";



                LargeAnimalsBranchBL largeAnimalsBranchBL = new LargeAnimalsBranchBL();
                List<usp_LargeAnimalsBranch_Result> largeAnimalsBranchlist = largeAnimalsBranchBL.usp_LargeAnimalsBranch(start, end, company, branch, time);
                DataTable largeAnimalsBranchDT = converter.ToDataTable(largeAnimalsBranchlist);
                RadHtmlChartGroupDataSource.GroupDataSource(LargeAnimalsBranchRHC1, largeAnimalsBranchDT, "Branch_Name", "LineSeries", "Number_of_Large_Animals", "TimePeriod");

                //Format Unique customers seen branch comparison chart
                UniqueCustomersSeenBranchRHC1.ChartTitle.Text = "Number of Unique Customers Seen - Branch";
                UniqueCustomersSeenBranchRHC1.PlotArea.YAxis.TitleAppearance.Text = "No of Customers";

                //Format Animals Seen branch comparison chart
                AnimalsSeenBranchRHC1.ChartTitle.Text = "Number of Animals Seen - Branch";
                AnimalsSeenBranchRHC1.PlotArea.YAxis.TitleAppearance.Text ="No of Animals";

                //Format Average Dollar per customer branch comparison chart
                AvgDollarPerCustomerBranchRHC1.ChartTitle.Text = "Average Dollar per Customer - Branch";
                AvgDollarPerCustomerBranchRHC1.PlotArea.YAxis.TitleAppearance.Text ="Average per Customer";

                //Format New Cusomters branch comparison chart
                NewCustomersBranchRHC1.ChartTitle.Text = "Number of New Customers - Branch";
                NewCustomersBranchRHC1.PlotArea.YAxis.TitleAppearance.Text ="No of Customers";

                //Format Small animals branch comparison chart
                SmallAnimalsBranchRHC1.ChartTitle.Text = "Number of Small Animals - Branch";
                SmallAnimalsBranchRHC1.PlotArea.YAxis.TitleAppearance.Text ="No of Animals";

                //Format Large animals branch comparison chart
                LargeAnimalsBranchRHC1.ChartTitle.Text = "Number of Large Animals - Branch";
                LargeAnimalsBranchRHC1.PlotArea.YAxis.TitleAppearance.Text = "No of Animals";

                //format xaxis of chart based on selected time type
                if (time == 1)
                {
                    UniqueCustomersSeenBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                    AnimalsSeenBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                    AvgDollarPerCustomerBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                    NewCustomersBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                    SmallAnimalsBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                    LargeAnimalsBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                }
                else if (time == 2)
                {
                    UniqueCustomersSeenBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                    AnimalsSeenBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                    AvgDollarPerCustomerBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                    NewCustomersBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                    SmallAnimalsBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                    LargeAnimalsBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                }
                else if (time == 3)
                {
                    UniqueCustomersSeenBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                    AnimalsSeenBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                    AvgDollarPerCustomerBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                    NewCustomersBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                    SmallAnimalsBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                    LargeAnimalsBranchRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                }

            }
        }

        protected void RadGrid2_ExcelMLWorkBookCreated(object sender, GridExcelMLWorkBookCreatedEventArgs e)
        {
            foreach (RowElement row in e.WorkBook.Worksheets[0].Table.Rows)
            {
                row.Cells[0].StyleValue = "Style1";
            }

            StyleElement style = new StyleElement("Style1");
            style.InteriorStyle.Pattern = InteriorPatternType.Solid;
            style.InteriorStyle.Color = System.Drawing.Color.LightGray;
            e.WorkBook.Styles.Add(style);
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
    }
}