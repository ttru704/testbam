using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Test
{
    public partial class KPI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public enum SearchType
        {
            NotSet = -1,
            Products = 0,
            Category = 1
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }


        protected void Button1_Click(Object sender, System.EventArgs e)
        {
            if (MultiView1.ActiveViewIndex > -1)
            {
                String searchTerm = "";
                SearchType mSearchType =
                     (SearchType)MultiView1.ActiveViewIndex;
                switch (mSearchType)
                {
                    case SearchType.Products:
                        DoSearch(textProductName.Text, mSearchType);
                        break;
                    case SearchType.Category:
                        DoSearch(textCategory.Text, mSearchType);
                        break;
                    case SearchType.NotSet:
                        break;
                }
            }
        }

        protected void DoSearch(String searchTerm, SearchType type)
        {
            // Code here to perform a search.
        }

        protected void radioButton_CheckedChanged(Object sender,
            System.EventArgs e)
        {
            if (radioProduct.Checked)
            {
                MultiView1.ActiveViewIndex = (int)SearchType.Products;
            }
            else if (radioCategory.Checked)
            {
                MultiView1.ActiveViewIndex = (int)SearchType.Category;
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            PieChart1.DataBind();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        //protected void Button3_Click(object sender, EventArgs e)
        //{
        //    RadHtmlChart1.DataBind();
        //}
    }
}