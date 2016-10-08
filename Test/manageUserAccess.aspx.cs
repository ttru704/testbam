using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Test
{
    public partial class manageUserAccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Update_Click(object sender, EventArgs e)
        {
            string userRef = UserDDL1.SelectedItem.Value.ToString();
            DateTime startDate = StartDate.SelectedDate.GetValueOrDefault();
            DateTime endDate = EndDate.SelectedDate.GetValueOrDefault();
            int status = Convert.ToInt32(StatusToggle.Value);
        }
    }
}