using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Test
{
    public partial class defaulttest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    GridView1.DataBind();
        //}



        protected void Button4_Click(object sender, EventArgs e)
        {
            GridView4.DataBind();
            RadHtmlChart1.DataBind();
        }

        protected void Button5_Click(object sender, EventArgs e)
        { 
            
            if (DropDownList2.SelectedValue == "1")
            {
                RadHtmlChart2.PlotArea.XAxis.LabelsAppearance.DataFormatString = "MMM yyyy";
                RadHtmlChart2.ChartTitle.Text = "Total Monthly Sales";
                RadHtmlChart2.PlotArea.XAxis.TitleAppearance.Text = "Month";
            }
            else
            {
                RadHtmlChart2.PlotArea.XAxis.LabelsAppearance.DataFormatString = "yyyy";
                RadHtmlChart2.ChartTitle.Text = "Total Yearly Sales";
                RadHtmlChart2.PlotArea.XAxis.TitleAppearance.Text = "Year";
            };

            RadHtmlChart2.DataBind();

            
        }


    }
}