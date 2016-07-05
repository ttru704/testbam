using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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
            GridViewNumberOfNewClients.DataBind();
        }
    }
}