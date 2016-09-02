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
            Int64? productSerivce = Session["ProductService"] as Int64?;

            ListtoDataTableConverter converter = new ListtoDataTableConverter();

            IncomeByServiceIndividualBL incomeByServiceIndividualBL = new IncomeByServiceIndividualBL();
            List<usp_IncomeByServiceIndividual_Result> incomeByServiceIndividualList = incomeByServiceIndividualBL.usp_IncomeByServiceIndividual(start, end, company, productSerivce, time);
            DataTable incomeByServiceIndividualDT = converter.ToDataTable(incomeByServiceIndividualList);
            RadHtmlChartGroupDataSource.GroupDataSource(IncomeByServiceIndividualRHC1, incomeByServiceIndividualDT, "Product_Name", "BarSeries", "Income_By_Service", "TimePeriod");
        }
    }
}