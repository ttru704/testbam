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

namespace Test.FBranchKPIControls
{
    public partial class TotalSalesBranch : System.Web.UI.UserControl
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

                TotalSalesBranchBL totalSalesBranchBL = new TotalSalesBranchBL();
                List<usp_TotalSalesBranch_Result> totalSalesBranchList = totalSalesBranchBL.usp_TotalSalesBranch(start, end, company, branch, time);
                DataTable totalSalesBranchDT = converter.ToDataTable(totalSalesBranchList);
                RadHtmlChartGroupDataSource.GroupDataSource(TotalSalesBranchRHC1, totalSalesBranchDT, "Branch_Name", "ColumnSeries", "Total_Sales", "TimePeriod");
            }
        }
        protected void ExportGridCustomiser(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == Telerik.Web.UI.RadGrid.ExportToWordCommandName ||
                e.CommandName == Telerik.Web.UI.RadGrid.ExportToExcelCommandName || e.CommandName == Telerik.Web.UI.RadGrid.ExportToPdfCommandName)
                sender.ToString();
            Type t = sender.GetType();
            t.Name.ToString();
            RadGrid rg = (RadGrid)sender;
            string gridname = rg.DataSourceID;

            {
                //rg.ExportSettings.FileName ="chartname"; 
                rg.ExportSettings.ExportOnlyData = true;
                rg.ExportSettings.IgnorePaging = true;
                rg.ExportSettings.OpenInNewWindow = true;
                rg.ExportSettings.UseItemStyles = true;
            }
        }

        protected void TotalSalesBranchRHC1_Load(object sender, EventArgs e)
        {

        }
    }
}