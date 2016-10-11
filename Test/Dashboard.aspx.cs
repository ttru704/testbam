using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Test.BLL.Financial;
using Test.BLL.Customer;


/// <summary>
///  - The two pie charts are binded here
///  - The formatting of the label is done here
///  - For Each Value of the % change, there is an if else statement to decide the direction of the arrow (up/down) and the color
///    (green / red)
/// </summary>
namespace Test
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.User.IsInRole("Employee") == true)
            {
                Response.Redirect("~/financialKPI.aspx");
            }

            
            bool admin = Page.User.IsInRole("Admin");
            if (HttpContext.Current.User.Identity.IsAuthenticated == true & admin == false)
            {
                //Use this to store list of control name which will be used to display which kpis logged in clinic user can see
                string userRef = Session["UserRef"] as string;
                Int64? company = Session["CompanyRef"] as Int64?;
                TotalSalesCompanyRHC1.DataBind();
                

                IncomeByProductCategoryComRHC1.DataBind();
                IncomeByServiceActivityComRHC1.DataBind();


                //Bind Total Sales Single Value
                TotalSalesSingleBL totalSalesSingle = new TotalSalesSingleBL();
                double? totalSalesSingleLabel = totalSalesSingle.usp_TotalSalesSingle(company);
                if (totalSalesSingleLabel > 100000)
                {
                    string totalSalesSingleLabelString = String.Format("{0:C0}K", (totalSalesSingleLabel / 1000));
                    Label1.Text = totalSalesSingleLabelString;
                }




                //Bind Total Sales $ Change
                TotalSalesChangesBL totalSalesChanges = new TotalSalesChangesBL();
                LabelPercent1.Text = String.Format("{0:0.00}", totalSalesChanges.usp_TotalSalesChanges(company)) + '%';

                //Change the icon's color and arrrow
                var x1 = Convert.ToInt32(totalSalesChanges.usp_TotalSalesChanges(company));
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
                Label2.Text = '$' + String.Format("{0:0}", avgPerTransactionSingle.usp_AvgDollarPerTransactionSingle(company));
                //Bind Average Per Transaction Change
                AvgDollarPerTransactionChangesBL avgPerTransactionChanges = new AvgDollarPerTransactionChangesBL();
                LabelPercent2.Text = String.Format("{0:0.00}", avgPerTransactionChanges.usp_AvgDollarPerTransactionChanges(company)) + '%';
                //Change the icon's color and arrrow
                var x2 = Convert.ToInt32(avgPerTransactionChanges.usp_AvgDollarPerTransactionChanges(company));
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
                Label3.Text = '$' + String.Format("{0:0}", avgDollarPerCustomerSingle.usp_AvgDollarPerCustomerSingle(company));
                //Bind Average Dollar Per Customer Change
                AvgDollarPerCustomerChangesBL avgDollarPerCustomerChanges = new AvgDollarPerCustomerChangesBL();
                LabelPercent3.Text = String.Format("{0:0.00}", avgDollarPerCustomerChanges.usp_AvgDollarPerCustomerChanges(company)) + '%';
                //Change the icon's color and arrrow
                var x3 = Convert.ToInt32(avgDollarPerCustomerChanges.usp_AvgDollarPerCustomerChanges(company));
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
                Label4.Text = String.Format("{0}", newCustomersSingle.usp_NewCustomersSingle(company));
                //Bind Number of New Customer Change
                NewCustomersChangesBL newCustomersChanges = new NewCustomersChangesBL();
                LabelPercent4.Text = String.Format("{0:0.00}", newCustomersChanges.usp_NewCustomersChanges(company)) + '%';
                //Change the icon's color and arrrow
                var x4 = Convert.ToInt32(newCustomersChanges.usp_NewCustomersChanges(company));
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
                Label5.Text = String.Format("{0}", uniqueCustomersSeenSingle.usp_UniqueCustomersSeenSingle(company));
                //Bind Unique Number of New Customers Change
                UniqueCustomersSeenChangesBL uniqueCustomersSeenChanges = new UniqueCustomersSeenChangesBL();
                LabelPercent5.Text = String.Format("{0:0.00}", uniqueCustomersSeenChanges.usp_UniqueCustomersSeenChanges(company)) + '%';
                //Change the icon's color and arrrow
                var x5 = Convert.ToInt32(uniqueCustomersSeenChanges.usp_UniqueCustomersSeenChanges(company));
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
                Label6.Text = String.Format("{0}", animalsSeenSingle.usp_AnimalsSeenSingle(company));
                //Bind Animals Seen Change
                AnimalsSeenChangesBL animalsSeenChanges = new AnimalsSeenChangesBL();
                LabelPercent6.Text = String.Format("{0:0.00}", animalsSeenChanges.usp_AnimalsSeenChanges(company)) + '%';
                //Change the icon's color and arrrow
                var x6 = Convert.ToInt32(animalsSeenChanges.usp_AnimalsSeenChanges(company));
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
            else if (HttpContext.Current.User.Identity.IsAuthenticated == false)
            {
                Response.Redirect("~/Account/Login.aspx");
            }
            else if (HttpContext.Current.User.Identity.IsAuthenticated == true & admin == true)
            {
                Response.Redirect("~/userProfile.aspx");
            }
            
        }

    }
}