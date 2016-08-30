using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Test.BLL.Financial;
using Test.Models;

namespace Test
{
    public partial class FPeerCS : System.Web.UI.UserControl
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
                int? country = Session["Country"] as int?;
                int? state = Session["State"] as int?;
                int? region = Session["Region"] as int?;
                ListtoDataTableConverter converter = new ListtoDataTableConverter();

                AvgDollarPerTransactionPeerBL avgDollarPerTransactionPeerBL = new AvgDollarPerTransactionPeerBL();
                List<usp_AvgDollarPerTransactionPeer_Result> avgDollarPerTransactionPeerList = avgDollarPerTransactionPeerBL.usp_AvgDollarPerTransactionPeer(start, end, branch, 1, time, country, state, region);
                DataTable avgDollarPerTransactionPeerDT = converter.ToDataTable(avgDollarPerTransactionPeerList);
                RadHtmlChartGroupDataSource.GroupDataSource(AvgDollarPerTransactionPeerRHC1, avgDollarPerTransactionPeerDT, "Name", "LineSeries", "Average_Dollar_per_Transaction", "TimePeriod");

                //format y axis of chart
                AvgDollarPerTransactionPeerRHC1.PlotArea.YAxis.TitleAppearance.Text = "Average per Transaction (000s)";
                AvgDollarPerTransactionPeerRHC1.PlotArea.YAxis.LabelsAppearance.ClientTemplate = "#= value / 1000# ";

                //format x axis of chart
                if (time == 1)
                {
                    AvgDollarPerTransactionPeerRHC1.PlotArea.XAxis.TitleAppearance.Text = "Monlthy";
                }
                else if (time == 2)
                {
                    AvgDollarPerTransactionPeerRHC1.PlotArea.XAxis.TitleAppearance.Text = "Yearly";
                }
                else if (time == 3)
                {
                    AvgDollarPerTransactionPeerRHC1.PlotArea.XAxis.TitleAppearance.Text = "Weekly";
                }
            }

        }
    }
}