using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Test.Models;
using Test.BLL.Productivity;
using System.Data;
using Test.BLL.Controls;

namespace Test
{
    public partial class ECompanyCS : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StartDate"] != null)
            {
                DateTime? start = Session["StartDate"] as DateTime?;
                DateTime? end = Session["EndDate"] as DateTime?;
                Int64? company = Session["CompanyRef"] as Int64?;
                int? branch = Session["Branch"] as int?;
                int? time = Session["Time"] as int?;

                // call the session that stores the user ref
                string userRef = Session["UserRef"] as string;

                //Store the list of kpi that the current user is allowed to view
                ViewableKpiListBL viewableKpiListBL = new ViewableKpiListBL();
                List<usp_ViewableKpiList_Result> viewableKpiList = viewableKpiListBL.usp_ViewableKpiList(userRef, 3, "Company");

                //loop through the list of kpi that current user is allowed to view then make these kpi visible to user
                foreach (var element in viewableKpiList)
                {
                    string name = element.Name;
                    string toolTip = element.Description;
                    RadPanelBar1.FindItemByText(name).Visible = true;
                    RadPanelBar1.FindItemByText(name).ToolTip = toolTip;
                }

                ListtoDataTableConverter converter = new ListtoDataTableConverter();

                CustomersSeenByEmployeeCompanyBL customersSeenByEmployeeCompanyBL = new CustomersSeenByEmployeeCompanyBL();
                List<usp_CustomersSeenByEmployeeCompany_Result> customersSeenByEmployeeCompanyList = customersSeenByEmployeeCompanyBL.usp_CustomersSeenByEmployeeCompany(start, end, company, time);
                DataTable customersSeenByEmployeeCompanyDT = converter.ToDataTable(customersSeenByEmployeeCompanyList);
                RadHtmlChartGroupDataSource.GroupDataSource(CustomersSeenByEmployeeCompanyRHC1, customersSeenByEmployeeCompanyDT, "Employee_Name", "BarSeries", "Number_Of_Customers_Seen_By_An_Employee", "TimePeriod");

                AnimalsSeenByEmployeeCompanyBL animalsSeenByEmployeeCompanyBL = new AnimalsSeenByEmployeeCompanyBL();
                List<usp_AnimalsSeenByEmployeeCompany_Result> animalsSeenByEmployeeCompanyList = animalsSeenByEmployeeCompanyBL.usp_AnimalsSeenByEmployeeCompany(start, end, company, time);
                DataTable animalsSeenByEmployeeCompanyDT = converter.ToDataTable(animalsSeenByEmployeeCompanyList);
                RadHtmlChartGroupDataSource.GroupDataSource(AnimalsSeenByEmployeeCompanyRHC1, animalsSeenByEmployeeCompanyDT, "Employee_Name", "ColumnSeries", "Number_Of_Animals_Seen_By_An_Employee", "TimePeriod");

                AvgCustomersSeenByEmployeeCompanyBL avgCustomersSeenByEmployeeCompanyBL = new AvgCustomersSeenByEmployeeCompanyBL();
                List<usp_AvgCustomersSeenByEmployeeCompany_Result> avgCustomersSeenByEmployeeCompanyList = avgCustomersSeenByEmployeeCompanyBL.usp_AvgCustomersSeenByEmployeeCompany(start, end, company, time);
                DataTable avgCustomersSeenByEmployeeCompanyDT = converter.ToDataTable(avgCustomersSeenByEmployeeCompanyList);
                RadHtmlChartGroupDataSource.GroupDataSource(AvgCustomersSeenByEmployeeCompanyRHC1, avgCustomersSeenByEmployeeCompanyDT, "Company_Name", "LineSeries", "Number_Of_Customers_Seen_By_An_Employee", "TimePeriod");

                AvgAnimalsSeenByEmployeeCompanyBL avgAnimalsSeenByEmployeeCompanyBL = new AvgAnimalsSeenByEmployeeCompanyBL();
                List<usp_AvgAnimalsSeenByEmployeeCompany_Result> avgAnimalsSeenByEmployeeCompanyList = avgAnimalsSeenByEmployeeCompanyBL.usp_AvgAnimalsSeenByEmployeeCompany(start, end, company, time);
                DataTable avgAnimalsSeenByEmployeeCompanyDT = converter.ToDataTable(avgAnimalsSeenByEmployeeCompanyList);
                RadHtmlChartGroupDataSource.GroupDataSource(AvgAnimalsSeenByEmployeeCompanyRHC1, avgAnimalsSeenByEmployeeCompanyDT, "Company_Name", "LineSeries", "Average_Number_Of_Animals_Seen_By_Employee", "TimePeriod");

                IncomeByEmployeeCompanyBL incomeByEmployeeCompanyBL = new IncomeByEmployeeCompanyBL();
                List<usp_IncomeByEmployeeCompany_Result> incomeByEmployeeCompanyList = incomeByEmployeeCompanyBL.usp_IncomeByEmployeeCompany(start, end, company, time);
                DataTable incomeByEmployeeCompanyDT = converter.ToDataTable(incomeByEmployeeCompanyList);
                RadHtmlChartGroupDataSource.GroupDataSource(IncomeByEmployeeCompanyRHC1, incomeByEmployeeCompanyDT, "Employee_Name", "ColumnSeries", "Income_By_Employee", "TimePeriod");

                //Format Customers seen by employee company chart
                CustomersSeenByEmployeeCompanyRHC1.ChartTitle.Text = "Number of Customers Seen by Employee - Company";
                CustomersSeenByEmployeeCompanyRHC1.PlotArea.YAxis.TitleAppearance.Text = "No of Customers";

                //Format Animals seen by employee company chart
                AnimalsSeenByEmployeeCompanyRHC1.ChartTitle.Text = "Number of Animals Seen by Employee - Company";
                AnimalsSeenByEmployeeCompanyRHC1.PlotArea.YAxis.TitleAppearance.Text = "No of Animals";

                //Format Average number of customers seen by employee company chart
                AvgCustomersSeenByEmployeeCompanyRHC1.ChartTitle.Text = "Average Number of Customers Seen by Employee - Company";
                AvgCustomersSeenByEmployeeCompanyRHC1.PlotArea.YAxis.TitleAppearance.Text = "No of Customers";

                //Format Average number of animals seen by employee company chart
                AvgAnimalsSeenByEmployeeCompanyRHC1.ChartTitle.Text = "Average Number of Animals Seen by Employee - Company";
                AvgAnimalsSeenByEmployeeCompanyRHC1.PlotArea.YAxis.TitleAppearance.Text = "No of Animals";

                //Format Income by Employee company chart
                IncomeByEmployeeCompanyRHC1.ChartTitle.Text = "Income by Employee - Company";
                IncomeByEmployeeCompanyRHC1.PlotArea.YAxis.TitleAppearance.Text = "Income";

                //format xaxis based on selected time type
                if (time == 1)
                {
                    CustomersSeenByEmployeeCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                    AnimalsSeenByEmployeeCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                    AvgCustomersSeenByEmployeeCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                    AvgAnimalsSeenByEmployeeCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                    IncomeByEmployeeCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                }
                else if (time == 2)
                {
                    CustomersSeenByEmployeeCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                    AnimalsSeenByEmployeeCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                    AvgCustomersSeenByEmployeeCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                    AvgAnimalsSeenByEmployeeCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                    IncomeByEmployeeCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                }
                else if (time == 3)
                {
                    CustomersSeenByEmployeeCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                    AnimalsSeenByEmployeeCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                    AvgCustomersSeenByEmployeeCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                    AvgAnimalsSeenByEmployeeCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                    IncomeByEmployeeCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                }

            }
        }

        //protected void exportChart(object sender, EventArgs e)
        //{
        //    ScriptManager.RegisterClientScriptBlock(this, GetType(), "mykey", "exportRadHtmlChart()", true);
        //}

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