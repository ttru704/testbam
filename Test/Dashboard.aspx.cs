using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Test.BLL.Financial;

namespace Test
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            IncomeByProductCategoryComRHC1.DataBind();
            IncomeByServiceActivityComRHC1.DataBind();

            //Bind Total Sales Single Value
            TotalSalesSingleBL totalSalesSingle = new TotalSalesSingleBL();
            Label1.Text = '$' + String.Format("{0:0.00}", totalSalesSingle.usp_TotalSalesSingle(1));

            //Bind Total Sales $ Change
            TotalSalesChangesBL totalSalesChanges = new TotalSalesChangesBL();
            LabelPercent1.Text = String.Format("{0:0.00}", totalSalesChanges.usp_TotalSalesChanges(1)) + '%';

            //Change the icon's color and arrrow
            //var x = Convert.ToInt16(LabelPercent1.Text);
            //if (x < 0)
            //{
               
            //}

            //Bind Average Per Transaction Single Value
            AvgPerTransactionSingleBL avgPerTransactionSingle = new AvgPerTransactionSingleBL();
            Label2.Text = '$' + String.Format("{0:0.00}", avgPerTransactionSingle.usp_AvgPerTransactionSingle(1));

            //Bind Average Per Transaction Change
            AvgPerTransactionChangesBL avgPerTransactionChanges = new AvgPerTransactionChangesBL();
            LabelPercent2.Text = String.Format("{0:0.00}", avgPerTransactionChanges.usp_AvgPerTransactionChanges(1)) + '%';

            //Bind Average Dollar Per Customer Single Value
            AvgDollarPerCustomerSingleBL avgDollarPerCustomerSingle = new AvgDollarPerCustomerSingleBL();
            Label3.Text = '$' + String.Format("{0:0.00}", avgDollarPerCustomerSingle.usp_AvgDollarPerCustomerSingle(1));

            //Bind Average Dollar Per Customer Change
            AvgDollarPerCustomerChangesBL avgDollarPerCustomerChanges = new AvgDollarPerCustomerChangesBL();
            LabelPercent3.Text = String.Format("{0:0.00}", avgDollarPerCustomerChanges.usp_AvgDollarPerCustomerChanges(1)) + '%';

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }
    }
}