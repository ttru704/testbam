using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Telerik.Web.UI;

namespace Test
{
    public partial class KPI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TotalSalesBComparison1.SelectedDate = DateTime.Parse("10/10/2000");
            TotalSalesBComparison2.SelectedDate = DateTime.Parse("10/10/2020");
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

        protected void ViewTotalSalesBComparison_Click(object sender, ObjectDataSourceStatusEventArgs e)
        {
            //RadHtmlChart2.DataSource = TotalSalesBComparison(TotalSalesBComparison1.SelectedDate.GetValueOrDefault(), TotalSalesBComparison2.SelectedDate.GetValueOrDefault(), Int32.Parse(TotalSalesBComparison4.SelectedValue), Int32.Parse(TotalSalesBComparison3.SelectedValue));
            
            RadHtmlChart2.DataBind();

            //loop over the number of branches (Uses 5 for now)
            DataSet underlyingDataSet = e.ReturnValue as DataSet;
            if (underlyingDataSet!=null)
            {
                Console.WriteLine(underlyingDataSet);
            }

            //var branchCount = ObjectDataSource5;
            for (int i = 1; i <= 5; i++)
            {
                LineSeries branch = new LineSeries();
                branch.Name = "Branch" + i.ToString();
                branch.LabelsAppearance.Visible = false;
                branch.TooltipsAppearance.Color = System.Drawing.Color.White;
                branch.TooltipsAppearance.DataFormatString = "{0}%";
                branch.MarkersAppearance.Visible = false;

                for (int j = 1; j <= 12; j++)
                {
                    CategorySeriesItem item1 = new CategorySeriesItem();
                    item1.Y = 10;
                    branch.SeriesItems.Add(item1);
                }
                RadHtmlChart2.PlotArea.Series.Add(branch);


                //For each branch, Add a new telerik series item + ASSIGN THE DATA BASED ON THE BRANCH REF
                //RadHtmlChart2.PlotArea.Series.Add()
            }
            

        }

        //public DataSet TotalSalesBComparison(DateTime start, DateTime end, int? branchRef, int TimeType)
        //{
        //    //RadHtmlChart2.PlotArea.Series. <_---- for adding the different branches. More series for branch_Ref
        //    String KPIConnectionString = ConfigurationManager.ConnectionStrings["KPIConnectionString"].ConnectionString;
        //    SqlConnection myConnection = new SqlConnection(KPIConnectionString);
        //    SqlDataAdapter myCommand = new SqlDataAdapter("TotalSalesBComparison", myConnection);

        //    myCommand.SelectCommand.Parameters.Add(new SqlParameter("@start", SqlDbType.DateTime));
        //    myCommand.SelectCommand.Parameters.Add(new SqlParameter("@end", SqlDbType.DateTime));
        //    myCommand.SelectCommand.Parameters.Add(new SqlParameter("@branchRef", SqlDbType.Int));
        //    myCommand.SelectCommand.Parameters.Add(new SqlParameter("@TimeType", SqlDbType.Int));

        //    myCommand.SelectCommand.Parameters["@start"].Value = start;
        //    myCommand.SelectCommand.Parameters["@end"].Value = end;
        //    myCommand.SelectCommand.Parameters["@branchRef"].Value = branchRef;
        //    myCommand.SelectCommand.Parameters["@TimeType"].Value = TimeType;

        //    myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        //    myConnection.Open();

        //    DataSet ds = new DataSet();

        //    myCommand.Fill(ds);
        //    myConnection.Close();
        //    myCommand.Dispose();
        //    return ds;
        //}

    }

}