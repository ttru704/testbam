using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Test.BLL.Controls;

namespace Test
{
    public partial class userManagement : System.Web.UI.Page
    {
        //protected void kpig1_OID(object sender, GridItemEventArgs e)
        //{
        //    if (e.Item is GridDataItem)
        //    {
        //        GridDataItem dataItem = (GridDataItem)e.Item;
        //        CheckBox chkBox = (CheckBox)dataItem["Viewable"].Controls[0];
        //        chkBox.Enabled = true;
        //        GridEditableItem editedItem = e.Item as GridEditableItem;
        //        TableCell cell = editedItem["Viewable"];

        //    }
        //}

        protected void kpiG1_SelectedCellChanged(object sender, EventArgs e)
        {
           
        }
        protected void userDDL1_OnClientSelectedIndexChanged(object sender, EventArgs e)
        {
            string userDDL1 = UserDDL1.SelectedItem.Value.ToString();
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            List<int> checkedIDs = new List<int>();
            string userRef = UserDDL1.SelectedItem.Value.ToString();
            
            foreach (GridDataItem item in kpiG1.Items)
            {
                CheckBox checkBox = item["CheckBoxTemplateColumn"].FindControl("viewableCB") as CheckBox;
                if (checkBox.Checked)
                {
                    //checkedIDs.Add(Convert.ToInt32(item.GetDataKeyValue("Kpi_For_Company")));
                    int kpiRef = Convert.ToInt32(item.GetDataKeyValue("Kpi_For_Company"));
                    InsertIntoKpiForUserBL insertIntoKpiForUserBL = new InsertIntoKpiForUserBL();
                    insertIntoKpiForUserBL.usp_InsertIntoKpiForUser(kpiRef, userRef);
                }
                else
                {
                    int kpiRef = Convert.ToInt32(item.GetDataKeyValue("Kpi_For_Company"));
                    DeleteFromKpiForUserBL deleteFromKpiForUserBL = new DeleteFromKpiForUserBL();
                    deleteFromKpiForUserBL.usp_DeleteFromKpiForUser(kpiRef, userRef);
                }
            }
        }

        //protected void viewableCB_CheckedChanged(object sender, EventArgs e)
        //{
        //    foreach (GridDataItem item in kpiG1.SelectedItems)
        //    {
        //        //Store user ref which will be used to input into KPI_For_User table
        //        string userRef = UserDDL1.SelectedItem.Value.ToString();
        //        //Store the kpi ref of row that has been ticked or unticked
        //        int kpiRef = Convert.ToInt32(item.GetDataKeyValue("Kpi_For_Company"));

        //        //Store the value of the check box which would be used in the if else statement below
        //        CheckBox c = (CheckBox)sender as CheckBox;
        //        string checkBoxId = c.ID;
        //        bool checkBoxValue = c.Checked;

        //        //if checkbox is checked then insert stored procedure would be called to insert kpiRef and the userRef to the Kpi_For_Users table
        //        if (checkBoxValue == true)
        //        {
        //            InsertIntoKpiForUserBL insertIntoKpiForUserBL = new InsertIntoKpiForUserBL();
        //            insertIntoKpiForUserBL.usp_InsertIntoKpiForUser(kpiRef, userRef);
        //        }
        //        //if checkbox is unchecked then delete stored procedure would be called to delete this kpiRef from the Kpi_For_Users table
        //        else
        //        {
        //            DeleteFromKpiForUserBL deleteFromKpiForUserBL = new DeleteFromKpiForUserBL();
        //            deleteFromKpiForUserBL.usp_DeleteFromKpiForUser(kpiRef, userRef);
        //        }
        //    }
        //}


    }
}