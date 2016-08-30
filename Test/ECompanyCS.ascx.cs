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
                int? company = Session["Company"] as int?;
                int? branch = Session["Branch"] as int?;
                int? time = Session["Time"] as int?;


                ListtoDataTableConverter converter = new ListtoDataTableConverter();

                CustomersSeenByEmployeeCompanyBL customersSeenByEmployeeCompanyBL = new CustomersSeenByEmployeeCompanyBL();
                List<usp_CustomersSeenByEmployeeCompany_Result> customersSeenByEmployeeCompanyList = customersSeenByEmployeeCompanyBL.usp_CustomersSeenByEmployeeCompany(start, end, 1, time);
                DataTable customersSeenByEmployeeCompanyDT = converter.ToDataTable(customersSeenByEmployeeCompanyList);
                RadHtmlChartGroupDataSource.GroupDataSource(CustomersSeenByEmployeeCompanyRHC1, customersSeenByEmployeeCompanyDT, "Employee_Name", "BarSeries", "Number_Of_Customers_Seen_By_An_Employee", "TimePeriod");

                AnimalsSeenByEmployeeCompanyBL animalsSeenByEmployeeCompanyBL = new AnimalsSeenByEmployeeCompanyBL();
                List<usp_AnimalsSeenByEmployeeCompany_Result> animalsSeenByEmployeeCompanyList = animalsSeenByEmployeeCompanyBL.usp_AnimalsSeenByEmployeeCompany(start, end, 1, time);
                DataTable animalsSeenByEmployeeCompanyDT = converter.ToDataTable(animalsSeenByEmployeeCompanyList);
                RadHtmlChartGroupDataSource.GroupDataSource(AnimalsSeenByEmployeeCompanyRHC1, animalsSeenByEmployeeCompanyDT, "Employee_Name", "ColumnSeries", "Number_Of_Animals_Seen_By_An_Employee", "TimePeriod");

                AvgCustomersSeenByEmployeeCompanyBL avgCustomersSeenByEmployeeCompanyBL = new AvgCustomersSeenByEmployeeCompanyBL();
                List<usp_AvgCustomersSeenByEmployeeCompany_Result> avgCustomersSeenByEmployeeCompanyList = avgCustomersSeenByEmployeeCompanyBL.usp_AvgCustomersSeenByEmployeeCompany(start, end, 1, time);
                DataTable avgCustomersSeenByEmployeeCompanyDT = converter.ToDataTable(avgCustomersSeenByEmployeeCompanyList);
                RadHtmlChartGroupDataSource.GroupDataSource(AvgCustomersSeenByEmployeeCompanyRHC1, avgCustomersSeenByEmployeeCompanyDT, "Company_Name", "LineSeries", "Number_Of_Customers_Seen_By_An_Employee", "TimePeriod");

                AvgAnimalsSeenByEmployeeCompanyBL avgAnimalsSeenByEmployeeCompanyBL = new AvgAnimalsSeenByEmployeeCompanyBL();
                List<usp_AvgAnimalsSeenByEmployeeCompany_Result> avgAnimalsSeenByEmployeeCompanyList = avgAnimalsSeenByEmployeeCompanyBL.usp_AvgAnimalsSeenByEmployeeCompany(start, end, 1, time);
                DataTable avgAnimalsSeenByEmployeeCompanyDT = converter.ToDataTable(avgAnimalsSeenByEmployeeCompanyList);
                RadHtmlChartGroupDataSource.GroupDataSource(AvgAnimalsSeenByEmployeeCompanyRHC1, avgAnimalsSeenByEmployeeCompanyDT, "Company_Name", "LineSeries", "Average_Number_Of_Animals_Seen_By_Employee", "TimePeriod");

                IncomeByEmployeeCompanyBL incomeByEmployeeCompanyBL = new IncomeByEmployeeCompanyBL();
                List<usp_IncomeByEmployeeCompany_Result> incomeByEmployeeCompanyList = incomeByEmployeeCompanyBL.usp_IncomeByEmployeeCompany(start, end, 1, time);
                DataTable incomeByEmployeeCompanyDT = converter.ToDataTable(incomeByEmployeeCompanyList);
                RadHtmlChartGroupDataSource.GroupDataSource(IncomeByEmployeeCompanyRHC1, incomeByEmployeeCompanyDT, "Employee_Name", "ColumnSeries", "Income_By_Employee", "TimePeriod");

                //format yaxis of charts
                CustomersSeenByEmployeeCompanyRHC1.PlotArea.YAxis.TitleAppearance.Text = "No of Customers";

                AnimalsSeenByEmployeeCompanyRHC1.PlotArea.YAxis.TitleAppearance.Text = "No of Animals";

                AvgCustomersSeenByEmployeeCompanyRHC1.PlotArea.YAxis.TitleAppearance.Text = "No of Customers";

                AvgAnimalsSeenByEmployeeCompanyRHC1.PlotArea.YAxis.TitleAppearance.Text = "No of Animals";

                IncomeByEmployeeCompanyRHC1.PlotArea.YAxis.TitleAppearance.Text = "Income (000s)";
                IncomeByEmployeeCompanyRHC1.PlotArea.YAxis.LabelsAppearance.ClientTemplate = "#= value / 1000#";

                //format xaxis based on selected time type
                if (time == 1)
                {
                    CustomersSeenByEmployeeCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monlthy";
                    AnimalsSeenByEmployeeCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monlthy";
                    AvgCustomersSeenByEmployeeCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monlthy";
                    AvgAnimalsSeenByEmployeeCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monlthy";
                    IncomeByEmployeeCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monlthy";
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

    }
}