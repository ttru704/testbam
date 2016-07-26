using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
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
            UniqueCustomersSeenBranchG1.DataBind();
            DataTable dt = new DataTable();
            for (int i = 0; i < UniqueCustomersSeenBranchG1.Columns.Count; i++)
            {
                dt.Columns.Add("column" + i.ToString());
            }
            foreach (GridViewRow row in UniqueCustomersSeenBranchG1.Rows)
            {
                DataRow dr = dt.NewRow();
                for (int j = 0; j < UniqueCustomersSeenBranchG1.Columns.Count; j++)
                {
                    dr["column" + j.ToString()] = row.Cells[j].Text;
                }

                dt.Rows.Add(dr);
            }

            RadHtmlChartGroupDataSource.GroupDataSource(UniqueCustomersSeenBranchRHC1, dt, "column0", "BarSeries", "column2", "column1");

            AnimalsSeenComRHC1.DataBind();
        }

        
    }
}