<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dialog1.aspx.cs" Inherits="Test.Dialog1" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Choose state and region you want to compare with</title>
</head>
<body onload="AdjustRadWidow();">
    <form id="Form2" method="post" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>
        <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" DecoratedControls="All" runat="server"
            Skin="Material" />
        <script type="text/javascript">
            function GetRadWindow() {
                var oWindow = null;
                if (window.radWindow) oWindow = window.radWindow;
                else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
                return oWindow;
            }
 
 
            
 
            function AdjustRadWidow() {
                var oWindow = GetRadWindow();
                setTimeout(function() {
                    oWindow.autoSize(true);
                }, 320);
            }
 
            function returnToParent() {
                //create the argument that will be returned to the parent page
                var oArg = new Object();
 
                //get the city's name            
                oArg.cityName = document.getElementById("cityName").value;
 
                //get the selected date from RadDatePicker
                var datePicker = $find("<%= RadDropDownList1.ClientID %>");
                oArg.selDate = datePicker.get_selectedDate().toLocaleDateString();
 
                //get a reference to the current RadWindow
                var oWnd = GetRadWindow();
 
 
 
 
                //Close the RadWindow and send the argument to the parent page
                if (oArg.selDate && oArg.cityName) {
                    oWnd.close(oArg);
                }
                else {
                    alert("Please fill both fields");
                }
            }
        </script>
        <div style="width: 268px; height: 200px;">
            <fieldset id="fld1">
                <legend>One way ticket</legend><span style="margin: 6px 0 0 18px;">Choose date:</span>
                <telerik:RadDropDownList ID="RadDropDownList1" runat="server" DataTextField="Name" DataValueField="Ref_Number" DataSourceID="ObjectDataSource1"></telerik:RadDropDownList>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="usp_StateDropDownList" TypeName="Test.BLL.StateDropDownListBL">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="countryRef" Type="Int32"></asp:Parameter>
                    </SelectParameters>
                </asp:ObjectDataSource>
                <telerik:RadDropDownList ID="RadDropDownList2" runat="server"></telerik:RadDropDownList>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server"></asp:ObjectDataSource>
            </fieldset>
            <div style="margin-top: 4px; text-align: right;">
                <telerik:RadButton ID="Button3" runat="server" Text="Submit" OnClientClicked="returnToParent"></telerik:RadButton>
            </div>
        </div>
    </form>
</body>
</html>
