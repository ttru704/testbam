using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Test
{
    public partial class Dialog1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }
        protected void returnToParent(object sender, EventArgs e)
        {
            Session["State"] = Convert.ToInt32(RadDropDownList1.SelectedItem.Value);
        }
    }
}