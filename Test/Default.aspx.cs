﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Test
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void Button2_Click(object sender, EventArgs e)
        {
            GridView2.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            RadGrid1.DataBind();
        }

    }
}