using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Test.BLL.Financial;
using Test.BLL.Customer;
using Telerik.Charting;
using System.Drawing;
using Test.Models;

namespace Test
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            RadHtmlChart1.DataBind();

            //IncomeByProductCategoryComRHC1.Appearance.FillStyle.BackgroundColor = ChartColors.GetColor();

            IncomeByProductCategoryComRHC1.DataBind();
            IncomeByServiceActivityComRHC1.DataBind();


            //Bind Total Sales Single Value
            TotalSalesSingleBL totalSalesSingle = new TotalSalesSingleBL();
            Label1.Text = '$' + String.Format("{0:0.00}", totalSalesSingle.usp_TotalSalesSingle(1));

            //Bind Total Sales $ Change
            TotalSalesChangesBL totalSalesChanges = new TotalSalesChangesBL();
            LabelPercent1.Text = String.Format("{0:0.00}", totalSalesChanges.usp_TotalSalesChanges(1)) + '%';

            //Change the icon's color and arrrow
            var x1 = Convert.ToInt32(totalSalesChanges.usp_TotalSalesChanges(1));
            if (x1 < 0)
            {
                Label1span.Attributes["style"] = "color: red";
                icon1.Attributes["class"] = "fa fa-sort-desc";
            }
            else if (x1 > 0)
            {
                Label1span.Attributes["style"] = "color: #00C853";
                icon1.Attributes["class"] = "fa fa-sort-asc";
            }

            //Bind Average Per Transaction Single Value
            AvgDollarPerTransactionSingleBL avgPerTransactionSingle = new AvgDollarPerTransactionSingleBL();
            Label2.Text = '$' + String.Format("{0:0.00}", avgPerTransactionSingle.usp_AvgDollarPerTransactionSingle(1));
            //Bind Average Per Transaction Change
            AvgDollarPerTransactionChangesBL avgPerTransactionChanges = new AvgDollarPerTransactionChangesBL();
            LabelPercent2.Text = String.Format("{0:0.00}", avgPerTransactionChanges.usp_AvgDollarPerTransactionChanges(1)) + '%';
            //Change the icon's color and arrrow
            var x2 = Convert.ToInt32(avgPerTransactionChanges.usp_AvgDollarPerTransactionChanges(1));
            if (x2 < 0)
            {
                Label2span.Attributes["style"] = "color: red";
                icon2.Attributes["class"] = "fa fa-sort-desc";
            }
            else if (x2 > 0)
            {
                Label2span.Attributes["style"] = "color: #00C853";
                icon2.Attributes["class"] = "fa fa-sort-asc";
            }

            //Bind Average Dollar Per Customer Single Value
            AvgDollarPerCustomerSingleBL avgDollarPerCustomerSingle = new AvgDollarPerCustomerSingleBL();
            Label3.Text = '$' + String.Format("{0:0.00}", avgDollarPerCustomerSingle.usp_AvgDollarPerCustomerSingle(1));
            //Bind Average Dollar Per Customer Change
            AvgDollarPerCustomerChangesBL avgDollarPerCustomerChanges = new AvgDollarPerCustomerChangesBL();
            LabelPercent3.Text = String.Format("{0:0.00}", avgDollarPerCustomerChanges.usp_AvgDollarPerCustomerChanges(1)) + '%';
            //Change the icon's color and arrrow
            var x3 = Convert.ToInt32(avgDollarPerCustomerChanges.usp_AvgDollarPerCustomerChanges(1));
            if (x3 < 0)
            {
                Label3span.Attributes["style"] = "color: red";
                icon3.Attributes["class"] = "fa fa-sort-desc";
            }
            else if (x3 > 0)
            {
                Label3span.Attributes["style"] = "color: #00C853";
                icon3.Attributes["class"] = "fa fa-sort-asc";
            }

            //Bind Number of New Customers Single Value
            NewCustomersSingleBL newCustomersSingle = new NewCustomersSingleBL();
            Label4.Text = String.Format("{0}", newCustomersSingle.usp_NewCustomersSingle(1));
            //Bind Number of New Customer Change
            NewCustomersChangesBL newCustomersChanges = new NewCustomersChangesBL();
            LabelPercent4.Text = String.Format("{0:0.00}", newCustomersChanges.usp_NewCustomersChanges(1)) + '%';
            //Change the icon's color and arrrow
            var x4 = Convert.ToInt32(newCustomersChanges.usp_NewCustomersChanges(1));
            if (x4 < 0)
            {
                Label4span.Attributes["style"] = "color: red";
                icon4.Attributes["class"] = "fa fa-sort-desc";
            }
            else if (x4 > 0)
            {
                Label4span.Attributes["style"] = "color: #00C853";
                icon4.Attributes["class"] = "fa fa-sort-asc";
            }

            //Bind Unique Number of New Customers Single Value
            UniqueCustomersSeenSingleBL uniqueCustomersSeenSingle = new UniqueCustomersSeenSingleBL();
            Label5.Text = String.Format("{0}", uniqueCustomersSeenSingle.usp_UniqueCustomersSeenSingle(1));
            //Bind Unique Number of New Customers Change
            UniqueCustomersSeenChangesBL uniqueCustomersSeenChanges = new UniqueCustomersSeenChangesBL();
            LabelPercent5.Text = String.Format("{0:0.00}", uniqueCustomersSeenChanges.usp_UniqueCustomersSeenChanges(1)) + '%';
            //Change the icon's color and arrrow
            var x5 = Convert.ToInt32(uniqueCustomersSeenChanges.usp_UniqueCustomersSeenChanges(1));
            if (x5 < 0)
            {
                Label5span.Attributes["style"] = "color: red";
                icon5.Attributes["class"] = "fa fa-sort-desc";
            }
            else if (x5 > 0)
            {
                Label5span.Attributes["style"] = "color: #00C853";
                icon5.Attributes["class"] = "fa fa-sort-asc";
            }

            //Bind Animals Seen Single Value
            AnimalsSeenSingleBL animalsSeenSingle = new AnimalsSeenSingleBL();
            Label6.Text = String.Format("{0}", animalsSeenSingle.usp_AnimalsSeenSingle(1));
            //Bind Animals Seen Change
            AnimalsSeenChangesBL animalsSeenChanges = new AnimalsSeenChangesBL();
            LabelPercent6.Text = String.Format("{0:0.00}", animalsSeenChanges.usp_AnimalsSeenChanges(1)) + '%';
            //Change the icon's color and arrrow
            var x6 = Convert.ToInt32(animalsSeenChanges.usp_AnimalsSeenChanges(1));
            if (x6 < 0)
            {
                Label6span.Attributes["style"] = "color: red";
                icon6.Attributes["class"] = "fa fa-sort-desc";
            }
            else if (x6 > 0)
            {
                Label6span.Attributes["style"] = "color: #00C853";
                icon6.Attributes["class"] = "fa fa-sort-asc";
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }

    }
}