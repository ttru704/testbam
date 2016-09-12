using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Test.BLL.Customer;
using Test.Models;

namespace Test
{
    public partial class CPeerCS : System.Web.UI.UserControl
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

                AvgDollarPerCustomerPeerBL avgDollarPerCustomerPeerBL = new AvgDollarPerCustomerPeerBL();
                List<usp_AvgDollarPerCustomerPeer_Result> avgDollarPerCustomerPeerList = avgDollarPerCustomerPeerBL.usp_AvgDollarPerCustomerPeer(start, end, branch, 1, time, 1, 1, 2);
                DataTable avgDollarPerCustomerPeerDT = converter.ToDataTable(avgDollarPerCustomerPeerList);
                RadHtmlChartGroupDataSource.GroupDataSource(AvgDollarPerCustomerPeerRHC1, avgDollarPerCustomerPeerDT, "Name", "LineSeries", "Average_Dollar_per_Customer", "TimePeriod");

                //format yaxis
                AvgDollarPerCustomerPeerRHC1.PlotArea.YAxis.TitleAppearance.Text = "Average per Customer (000s)";
                //AvgDollarPerCustomerPeerRHC1.PlotArea.YAxis.LabelsAppearance.ClientTemplate = "#= value / 1000#";

                //format xaxis based on selected time type
                if (time == 1)
                {
                    AvgDollarPerCustomerPeerRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monthly";
                }
                else if (time == 2)
                {
                    AvgDollarPerCustomerPeerRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                }
                else if (time == 3)
                {
                    AvgDollarPerCustomerPeerRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                }
            }
        }
    }
}