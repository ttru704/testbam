using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Test.Models;
using Test.BLL.Productivity;
using System.Data;
using Telerik.Web.UI;

namespace Test
{
    public partial class EIndividualCS : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StartDate"] != null)
            {
                DateTime? start = Session["StartDate"] as DateTime?;
                DateTime? end = Session["EndDate"] as DateTime?;
                int? company = Session["Company"] as int?;
                //long? employee = Session["Employee"] as long?;
                Int64? employee = Session["Employee"] as Int64?;
                int? time = Session["Time"] as int?;

                ListtoDataTableConverter converter = new ListtoDataTableConverter();

                CustomersSeenByEmployeeIndividualBL customersSeenByEmployeeIndividualBL = new CustomersSeenByEmployeeIndividualBL();
                List<usp_CustomersSeenByEmployeeIndividual_Result> customersSeenByEmployeeIndividualList = customersSeenByEmployeeIndividualBL.usp_CustomersSeenByEmployeeIndividual(start, end, company, employee, time);
                DataTable customersSeenByEmployeeIndividualDT = converter.ToDataTable(customersSeenByEmployeeIndividualList);
                RadHtmlChartGroupDataSource.GroupDataSource(CustomersSeenByEmployeeIndividualRHC1, customersSeenByEmployeeIndividualDT, "Employee_Name", "BarSeries", "Number_Of_Customers_Seen_By_An_Employee", "TimePeriod");

                AnimalsSeenByEmployeeIndividualBL animalsSeenByEmployeeIndividualBL = new AnimalsSeenByEmployeeIndividualBL();
                List<usp_AnimalsSeenByEmployeeIndividual_Result> animalsSeenByEmployeeIndividualList = animalsSeenByEmployeeIndividualBL.usp_AnimalsSeenByEmployeeIndividual(start, end, company, employee, time);
                DataTable animalsSeenByEmployeeIndividualDT = converter.ToDataTable(animalsSeenByEmployeeIndividualList);
                RadHtmlChartGroupDataSource.GroupDataSource(AnimalsSeenByEmployeeIndividualRHC1, animalsSeenByEmployeeIndividualDT, "Employee_Name", "BarSeries", "Number_Of_Animals_Seen_By_An_Employee", "TimePeriod");

                IncomeByEmployeeIndividualBL incomeByEmployeeIndividualBL = new IncomeByEmployeeIndividualBL();
                List<usp_IncomeByEmployeeIndividual_Result> incomeByEmployeeIndividualList = incomeByEmployeeIndividualBL.usp_IncomeByEmployeeIndividual(start, end, company, employee, time);
                DataTable incomeByEmployeeIndividualDT = converter.ToDataTable(incomeByEmployeeIndividualList);
                RadHtmlChartGroupDataSource.GroupDataSource(IncomeByEmployeeIndividualRHC1, incomeByEmployeeIndividualDT, "Employee_Name", "AreaSeries", "Income_By_Employee", "TimePeriod");

                IncomeFromAnimalTypeEmployeeIndividualBL incomeFromAnimalTypeEmployeeIndividualBL = new IncomeFromAnimalTypeEmployeeIndividualBL();
                List<usp_IncomeFromAnimalTypeEmployeeIndividual_Result> incomeFromAnimalTypeEmployeeIndividualList = incomeFromAnimalTypeEmployeeIndividualBL.usp_IncomeFromAnimalTypeEmployeeIndividual(start, end, company, employee, time);
                DataTable incomeFromAnimalTypeEmployeeIndividualDT = converter.ToDataTable(incomeFromAnimalTypeEmployeeIndividualList);
                RadHtmlChartGroupDataSource.GroupDataSource(IncomeFromAnimalTypeEmployeeIndividualRHC1, incomeFromAnimalTypeEmployeeIndividualDT, "Employee_Name", "ColumnSeries", "Income_By_Vet_For_Each_Animal_Type", "TimePeriod");

                //format yaxis of charts
                CustomersSeenByEmployeeIndividualRHC1.PlotArea.YAxis.TitleAppearance.Text ="No of Customers";

                AnimalsSeenByEmployeeIndividualRHC1.PlotArea.YAxis.TitleAppearance.Text = "No of Animals";

                IncomeByEmployeeIndividualRHC1.PlotArea.YAxis.TitleAppearance.Text = "Income";

                IncomeFromAnimalTypeEmployeeIndividualRHC1.PlotArea.YAxis.TitleAppearance.Text = "Income";

                //format xaxis of charts based on selected time type
                if (time == 1)
                {
                    CustomersSeenByEmployeeIndividualRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                    AnimalsSeenByEmployeeIndividualRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                    IncomeByEmployeeIndividualRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                    IncomeFromAnimalTypeEmployeeIndividualRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                }
                else if (time == 2)
                {
                    CustomersSeenByEmployeeIndividualRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                    AnimalsSeenByEmployeeIndividualRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                    IncomeByEmployeeIndividualRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                    IncomeFromAnimalTypeEmployeeIndividualRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                }
                else if (time == 3)
                {
                    CustomersSeenByEmployeeIndividualRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                    AnimalsSeenByEmployeeIndividualRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                    IncomeByEmployeeIndividualRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                    IncomeFromAnimalTypeEmployeeIndividualRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                }
            }
        }
        protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == Telerik.Web.UI.RadGrid.ExportToWordCommandName ||
                e.CommandName == Telerik.Web.UI.RadGrid.ExportToExcelCommandName || e.CommandName == Telerik.Web.UI.RadGrid.ExportToPdfCommandName)
                sender.ToString();
            Type t = sender.GetType();
            t.Name.ToString();
            RadGrid rg = (RadGrid)sender;
            string gridname = rg.DataSourceID;

            {
                rg.ExportSettings.ExportOnlyData = true;
                rg.ExportSettings.IgnorePaging = true;
                rg.ExportSettings.OpenInNewWindow = true;
                rg.ExportSettings.UseItemStyles = true;
            }
        }

    }
}