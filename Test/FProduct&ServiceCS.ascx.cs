using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Test.BLL.Financial;
using Test.Models;

namespace Test
{
    public partial class FProduct_ServiceCS : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime? start = Session["StartDate"] as DateTime?;
            DateTime? end = Session["EndDate"] as DateTime?;
            int? company = Session["Company"] as int?;
            int? time = Session["Time"] as int?;
            Int64? serviceRef = Session["Service"] as Int64?;


            if (serviceRef != null)
            {
                ListtoDataTableConverter converter = new ListtoDataTableConverter();
                IncomeByProductServiceIndividualBL incomeByServiceIndividualBL = new IncomeByProductServiceIndividualBL();
                List<usp_IncomeByProductServiceIndividual_Result> incomeByProductServiceIndividualList = incomeByServiceIndividualBL.usp_IncomeByProductServiceIndividual(start, end, company, serviceRef, "S", time);
                DataTable incomeByServiceIndividualDT = converter.ToDataTable(incomeByProductServiceIndividualList);
                RadHtmlChartGroupDataSource.GroupDataSource(IncomeByServiceIndividualRHC1, incomeByServiceIndividualDT, "Product_Name", "BarSeries", "Income_By_Service", "TimePeriod");
            }

        }

        protected void ServiceSB1_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            
            DateTime? start = Session["StartDate"] as DateTime?;
            DateTime? end = Session["EndDate"] as DateTime?;
            int? company = Session["Company"] as int?;
            int? time = Session["Time"] as int?;
            Int64? serviceRef = Convert.ToInt64(ServiceSB1.SelectedItem.Value);
            Session["Service"] = serviceRef;

            ListtoDataTableConverter converter = new ListtoDataTableConverter();

            IncomeByProductServiceIndividualBL incomeByServiceIndividualBL = new IncomeByProductServiceIndividualBL();
            List<usp_IncomeByProductServiceIndividual_Result> incomeByProductServiceIndividualList = incomeByServiceIndividualBL.usp_IncomeByProductServiceIndividual(start, end, company, serviceRef, "S", time);
            DataTable incomeByServiceIndividualDT = converter.ToDataTable(incomeByProductServiceIndividualList);
            RadHtmlChartGroupDataSource.GroupDataSource(IncomeByServiceIndividualRHC1, incomeByServiceIndividualDT, "Product_Name", "BarSeries", "Income_By_Service", "TimePeriod");
        }

        protected void ProductSB1_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            DateTime? start = Session["StartDate"] as DateTime?;
            DateTime? end = Session["EndDate"] as DateTime?;
            int? company = Session["Company"] as int?;
            int? time = Session["Time"] as int?;
            Int64? productRef = Convert.ToInt64(ProductSB1.SelectedItem.Value);
            Session["Product"] = productRef;

            ListtoDataTableConverter converter = new ListtoDataTableConverter();

            IncomeByProductServiceIndividualBL incomeByProductIndividualBL = new IncomeByProductServiceIndividualBL();
            List<usp_IncomeByProductServiceIndividual_Result> incomeByProductServiceIndividualList = incomeByProductIndividualBL.usp_IncomeByProductServiceIndividual(start, end, company, productRef, "R", time);
            DataTable incomeByProductIndividualDT = converter.ToDataTable(incomeByProductServiceIndividualList);
            RadHtmlChartGroupDataSource.GroupDataSource(IncomeByProductIndividualRHC1, incomeByProductIndividualDT, "Product_Name", "BarSeries", "Income_By_Service", "TimePeriod");
        }
    }
}