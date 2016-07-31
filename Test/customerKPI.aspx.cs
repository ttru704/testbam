using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Test.BLL.Customer;
using Test.Models;

namespace Test
{
    public partial class customerkpi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //public IQueryable<KPI_Types> GetKPICategories()
        //{
        //    var _db = new KPIEntities();
        //    IQueryable<KPI_Types> query = _db.KPI_Types;
        //    return query;
        //}

        protected void Button1_Click(object sender, EventArgs e)
        {
            UniqueCustomersSeenComRHC1.DataBind();

            DateTime start = DatePicker1.SelectedDate.GetValueOrDefault();
            DateTime end = DatePicker2.SelectedDate.GetValueOrDefault();
            int company = Convert.ToInt32(CompanyDDL1.SelectedItem.Value);
            int branch = Convert.ToInt32(BranchDDL1.SelectedItem.Value);
            int time = Convert.ToInt32(TimeDDL1.SelectedItem.Value);


            UniqueCustomersSeenBranchBL uniqueCustomersSeenBranchBL = new UniqueCustomersSeenBranchBL();
            List<usp_UniqueCustomersSeenBranch_Result> uniqueCustomersSeenBranchList = uniqueCustomersSeenBranchBL.usp_UniqueCustomersSeenBranch(start, end, company, branch, time);

            ListtoDataTableConverter converter = new ListtoDataTableConverter();
            DataTable uniqueCustomersSeenBranchDT = converter.ToDataTable(uniqueCustomersSeenBranchList);

            RadHtmlChartGroupDataSource.GroupDataSource(UniqueCustomersSeenBranchRHC1, uniqueCustomersSeenBranchDT, "Branch_Name", "AreaSeries", "Number_of_Unique_Clients", "Time_Period");

            AnimalsSeenComRHC1.DataBind();

            AnimalsSeenBranchBL animalsSeenBranchBL = new AnimalsSeenBranchBL();
            List<usp_AnimalsSeenBranch_Result> animalsSeenBranchList = animalsSeenBranchBL.usp_AnimalsSeenBranch(start, end, company, branch, time);

            DataTable animalsSeenBranchDT = converter.ToDataTable(animalsSeenBranchList);

            RadHtmlChartGroupDataSource.GroupDataSource(AnimalsSeenBranchRHC1, animalsSeenBranchDT, "Branch_Name", "BarSeries", "Number_of_animals_seen", "YearMonth");

            AvgDollarPerCustomerComRHC1.DataBind();

            AvgDollarPerCustomerBranchBL avgDollarPerCustomerBranchBL = new AvgDollarPerCustomerBranchBL();
            List<usp_AvgDollarPerCustomerBranch_Result> avgDollarPerCustomerBranchList = avgDollarPerCustomerBranchBL.usp_AvgDollarPerCustomerBranch(start, end, company, branch, time);

            DataTable avgDollarPerCustomerBranchDT = converter.ToDataTable(avgDollarPerCustomerBranchList);
            RadHtmlChartGroupDataSource.GroupDataSource(AvgDollarPerCustomerBranchRHC1, avgDollarPerCustomerBranchDT, "Branch_Name", "BarSeries", "Average_Dollar_per_customer", "Year_Month");

            NewCustomersComRHC1.DataBind();
        }
        
    }
}