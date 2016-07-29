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


            UniqueCustomersSeenBranchBL uniqueCustomersSeenBranchBL = new UniqueCustomersSeenBranchBL();
            List<usp_UniqueCustomersSeenBranch_Result> uniqueCustomersSeenBranchList = uniqueCustomersSeenBranchBL.usp_UniqueCustomersSeenBranch(start, end, 1, 0, 1);

            ListtoDataTableConverter converter = new ListtoDataTableConverter();
            DataTable uniqueCustomersSeenBranchDT = converter.ToDataTable(uniqueCustomersSeenBranchList);

            RadHtmlChartGroupDataSource.GroupDataSource(UniqueCustomersSeenBranchRHC1, uniqueCustomersSeenBranchDT, "Branch_Ref", "AreaSeries", "Number_of_Unique_Clients", "YearMonth");

            AnimalsSeenComRHC1.DataBind();

            AnimalsSeenBranchBL animalsSeenBranchBL = new AnimalsSeenBranchBL();
            List<usp_AnimalsSeenBranch_Result> animalsSeenBranchList = animalsSeenBranchBL.usp_AnimalsSeenBranch(start, end, 1, 0, 1);

            DataTable animalsSeenBranchDT = converter.ToDataTable(animalsSeenBranchList);

            RadHtmlChartGroupDataSource.GroupDataSource(AnimalsSeenBranchRHC1, animalsSeenBranchDT, "Branch_Ref", "BarSeries", "Number_of_animals_seen", "YearMonth");

        }


    }
}