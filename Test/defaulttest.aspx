<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="defaulttest.aspx.cs" Inherits="Test.defaulttest" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server"> 
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
          <div class="right_col" role="main">
           <%--<div class="row">
                <telerik:RadDatePicker ID="RadDatePicker_Start" runat="server" PopupDirection="BottomLeft"></telerik:RadDatePicker>
                <telerik:RadDatePicker ID="RadDatePicker_End" runat="server" PopupDirection="BottomLeft"></telerik:RadDatePicker>
                <asp:Button ID="Button1" runat="server" Text="View" OnClick="Button2_Click" />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
                    <Columns>
                        <asp:BoundField DataField="Cln_Number" HeaderText="Cln_Number" SortExpression="Cln_Number" />
                        <asp:BoundField DataField="Retail_Total" HeaderText="Retail_Total" SortExpression="Retail_Total" />
                        <asp:BoundField DataField="Service_Total" HeaderText="Service_Total" SortExpression="Service_Total" />
                    </Columns>
                </asp:GridView>
               
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="RetailTotal" TypeName="Test.BLL.RetailTotalBL">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadDatePicker_Start" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                        <asp:ControlParameter ControlID="RadDatePicker_End" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>--%>


                <br />
                <%--For the GridView--%>
                <telerik:RadDatePicker ID="NumberOfNewClientsStartDate" runat="server" PopupDirection="BottomLeft" DateInput-EmptyMessage="Start Date">
                </telerik:RadDatePicker>
                <telerik:RadDatePicker ID="NumberOfNewClientsStartEnd" runat="server" PopupDirection="BottomLeft" DateInput-EmptyMessage="End Date">
                </telerik:RadDatePicker>
                <asp:DropDownList ID="DropDownList3" runat="server" Width="58px">
                    <asp:ListItem> 1 </asp:ListItem>
                    <asp:ListItem> 2 </asp:ListItem>
                    <asp:ListItem> 3 </asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownList4" runat="server" Width="99px">
                    <asp:ListItem Value="1"> Monthly </asp:ListItem>
                    <asp:ListItem Value="2"> Yearly </asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="Button4" runat="server" Text="Button" OnClick="Button4_Click" />
                <br />



                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource4">
                    <Columns>
                        <asp:BoundField DataField="YearMonth" HeaderText="YearMonth" SortExpression="YearMonth" />
                        <asp:BoundField DataField="Number_of_New_Clients" HeaderText="Number_of_New_Clients" SortExpression="Number_of_New_Clients" />
                    </Columns>
                </asp:GridView>
        
            <div class="row">
                
                <telerik:RadHtmlChart ID="RadHtmlChart1" runat="server" DataSourceID="ObjectDataSource4">
                    <PlotArea>
                        <Series>
                            <telerik:ColumnSeries DataFieldY="Number_of_New_Clients">
                            </telerik:ColumnSeries>
                        </Series>
                        <XAxis DataLabelsField="Branch_Ref">
                            <TitleAppearance Text="Branch">
                                <TextStyle Margin="20" />
                            </TitleAppearance>
                            <MajorGridLines Visible="false" />
                            <MinorGridLines Visible="false" />
                        </XAxis>
                        <YAxis>
                            <TitleAppearance Text="Number of New Clients">
                                <TextStyle Margin="20" />
                            </TitleAppearance>
                            <MinorGridLines Visible="false" />
                        </YAxis>
                    </PlotArea>
                    <ChartTitle Text="New Clients">
                    </ChartTitle>
                    <Zoom Enabled="False"></Zoom>
                </telerik:RadHtmlChart>

                <br />
                <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" SelectMethod="GetNumberOfNewClients" TypeName="Test.BLL.NumberOfNewClientsBL">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="NumberOfNewClientsStartDate" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                        <asp:ControlParameter ControlID="NumberOfNewClientsStartEnd" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                        <asp:ControlParameter ControlID="DropDownList3" Name="branchRef" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="DropDownList4" Name="TimeType" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>

            <div class="row">
                <!--This is the Monthly aka Time Selector.  
            Note we have to change the Name of the axis to change from monthly to yearly depending on result
            -->
                <telerik:RadButton RenderMode="Lightweight" runat="server" OnClientClicked="exportRadHtmlChart" Text="Export RadHtmlChart to PDF" AutoPostBack="false" UseSubmitBehavior="false"></telerik:RadButton>
                <telerik:RadClientExportManager runat="server" ID="RadClientExportManager1">
                </telerik:RadClientExportManager>
                <telerik:RadDatePicker ID="RDPMonth1" runat="server" PopupDirection="BottomLeft" DateInput-EmptyMessage="2014-01-01"></telerik:RadDatePicker>
                <telerik:RadDatePicker ID="RDPMonth2" runat="server" PopupDirection="BottomLeft" DateInput-EmptyMessage="2018-01-01"></telerik:RadDatePicker>
                <asp:DropDownList ID="DropDownList1" runat="server" Width="58px">
                    <asp:ListItem> 1 </asp:ListItem>
                    <asp:ListItem> 2 </asp:ListItem>
                    <asp:ListItem> 3 </asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownList2" runat="server" Width="99px">
                    <asp:ListItem Value="1"> Monthly </asp:ListItem>
                    <asp:ListItem Value="2"> Yearly </asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="Button5" runat="server" Text="View" OnClick="Button5_Click" />
                <telerik:RadHtmlChart ID="RadHtmlChart2" runat="server" CssClass="MonthlyExport" DataSourceID="ObjectDataSource5">
                    <PlotArea>
                        <Series>
                            <telerik:ColumnSeries DataFieldY="Total_Sales">
                            </telerik:ColumnSeries>
                        </Series>
                        <XAxis DataLabelsField="YearMonth">
                            <TitleAppearance Text="Month">
                                <TextStyle Margin="20" />
                            </TitleAppearance>
                            <LabelsAppearance DataFormatString="MMM yyyy">
                            </LabelsAppearance>
                            <MajorGridLines Visible="false" />
                            <MinorGridLines Visible="false" />
                        </XAxis>
                        <YAxis>
                            <TitleAppearance Text="Total Sales">
                                <TextStyle Margin="20" />
                            </TitleAppearance>
                            <MinorGridLines Visible="false" />
                        </YAxis>
                    </PlotArea>
                    <ChartTitle Text="Total Sales">
                    </ChartTitle>
                    <Zoom Enabled="False"></Zoom>
                </telerik:RadHtmlChart>
                <telerik:RadMonthYearPicker ID="RadMonthYearPicker1" runat="server"></telerik:RadMonthYearPicker>
                <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" SelectMethod="GetTotalSalesMonth" TypeName="Test.BLL.GetTotalSalesMonthBL">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RDPMonth1" Name="start" PropertyName="SelectedDate" Type="DateTime" DefaultValue="2014-01-01" />
                        <asp:ControlParameter ControlID="RDPMonth2" Name="end" PropertyName="SelectedDate" Type="DateTime" DefaultValue="2018-01-01" />
                        <asp:ControlParameter ControlID="DropDownList1" Name="branchRef" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="DropDownList2" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>

            </div>
        </div>
    </form>
    <script>
        var $ = $telerik.$;

        function exportRadHtmlChart() {
            $find('<%=RadClientExportManager1.ClientID%>').exportPDF($(".MonthlyExport"));
        };
        
        

    </script>
</asp:Content>
