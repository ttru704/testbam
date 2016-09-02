using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Test
{
    public partial class CCompanyCS : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime? start = Session["StartDate"] as DateTime?;
            DateTime? end = Session["EndDate"] as DateTime?;
            int? company = Session["Company"] as int?;
            int? branch = Session["Branch"] as int?;
            int? time = Session["Time"] as int?;

            //format xaxis based on selected time type
            if (time == 1)
            {
                UniqueCustomersSeenCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                AnimalsSeenCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                AvgDollarPerCustomerCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                NewCustomersCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                SmallAnimalsCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                LargeAnimalsCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
            }
            else if (time == 2)
            {
                UniqueCustomersSeenCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                AnimalsSeenCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                AvgDollarPerCustomerCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                NewCustomersCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                SmallAnimalsCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                LargeAnimalsCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
            }
            else if (time == 3)
            {
                UniqueCustomersSeenCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                AnimalsSeenCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                AvgDollarPerCustomerCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                NewCustomersCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                SmallAnimalsCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                LargeAnimalsCompanyRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
            }
        }
    }
}