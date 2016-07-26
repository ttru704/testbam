<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="customerKPI.aspx.cs" Inherits="Test.customerkpi" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="right_col" role="main">
            <div id="KPIMenu" style="text-align: center">
                <a href="/financialKPI.aspx" style="font-size: 20px"><strong>Financial</strong></a>
                <strong>|</strong>
                <a href="/employeekpi.aspx" style="font-size: 20px"><strong>Employee</strong></a>
                <strong>|</strong>
                <a href="/customerkpi.aspx" style="font-size: 20px"><strong>Customer</strong></a>
                <br />
            </div>

            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>

            <telerik:RadDatePicker ID="DatePicker1" runat="server" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-04-01"></telerik:RadDatePicker>
            <telerik:RadDatePicker ID="DatePicker2" runat="server" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-09-01"></telerik:RadDatePicker>
            <asp:DropDownList ID="Company" runat="server" Width="100px">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="Branch" runat="server" AutoPostBack="True" DataTextField="Branch_Ref" DataValueField="Branch_Ref" Width="100px">
                <asp:ListItem Value="0">All Branches</asp:ListItem>
                <asp:ListItem> 1 </asp:ListItem>
                <asp:ListItem> 2 </asp:ListItem>
                <asp:ListItem> 3 </asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="TimeType" runat="server" Width="100px">
                <asp:ListItem Value="1"> Monthly </asp:ListItem>
                <asp:ListItem Value="2"> Yearly </asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" Text="View" OnClick="Button1_Click" />

            <br />
            <div class="kpiheader">Number of Unique Customers Seen Companywide</div>
            <%--Display Number of Unique Customers Seen by a company--%>
            <telerik:RadHtmlChart ID="UniqueCustomersSeenComRHC1" runat="server" DataSourceID="UniqueCustomersSeenComODC1">
                <PlotArea>
                    <Series>
                        <telerik:ColumnSeries DataFieldY="Number_of_Unique_Clients">
                        </telerik:ColumnSeries>
                    </Series>
                    <XAxis DataLabelsField="Time_Period" Type="Date">
                        <TitleAppearance Text="Time Period">
                            <TextStyle Margin="20" />
                        </TitleAppearance>
                        <LabelsAppearance DataFormatString="MMM yyyy">
                        </LabelsAppearance>
                        <MajorGridLines Visible="false" />
                        <MinorGridLines Visible="false" />
                    </XAxis>
                    <YAxis>
                        <TitleAppearance Text="No of Unique Customers">
                            <TextStyle Margin="20" />
                        </TitleAppearance>
                        <MinorGridLines Visible="false" />
                    </YAxis>
                </PlotArea>

                <ChartTitle Text="No of Unique Clients Companywide">
                </ChartTitle>
                <Zoom Enabled="False"></Zoom>
            </telerik:RadHtmlChart>
            <asp:ObjectDataSource ID="UniqueCustomersSeenComODC1" runat="server" SelectMethod="usp_UniqueCustomersSeenCom" TypeName="Test.BLL.Customer.UniqueCustomersSeenComBL">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="Company" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="TimeType" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <%--Display Number of Unique Customers Seen by a company--%>

            <%--Display Number of Unique Customers Seen branch comparison--%>
            <div class="kpiheader">Number of Unique Customers Seen Branch Comparison</div>
            <telerik:RadHtmlChart ID="UniqueCustomersSeenBranchRHC1" runat="server">
                <ChartTitle Text="Number of Unique Clients Seen">
                </ChartTitle>

                <PlotArea>
                </PlotArea>

                <Zoom Enabled="False"></Zoom>
            </telerik:RadHtmlChart>
            <asp:ObjectDataSource ID="UniqueCustomersSeenBranchODC1" runat="server" SelectMethod="usp_UniqueCustomersSeenBranch" TypeName="Test.BLL.Customer.UniqueCustomersSeenBranchBL">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="Company" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="Branch" DefaultValue="0" Name="branchRef" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="TimeType" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:GridView ID="UniqueCustomersSeenBranchG1" runat="server" AutoGenerateColumns="False" DataSourceID="UniqueCustomersSeenBranchODC1" Visible="false">
                <Columns>
                    <asp:BoundField DataField="Branch_Ref" HeaderText="Branch_Ref" SortExpression="Branch_Ref" />
                    <asp:BoundField DataField="Time_Period" HeaderText="Time_Period" SortExpression="Time_Period" />
                    <asp:BoundField DataField="Number_of_Unique_Clients" HeaderText="Number_of_Unique_Clients" SortExpression="Number_of_Unique_Clients" />
                </Columns>
            </asp:GridView>
            <%--Display Number of Unique Customers Seen branch comparison--%>

            <p>&nbsp;</p>
            <div class="kpiheader">Number of Unique Animals Seen Companywide</div>

            <%--Display Number of Aniamls Seen Companywide--%>


            <%--Display Number of Aniamls Seen Companywide--%>
            <telerik:RadHtmlChart ID="AnimalsSeenComRHC1" runat="server" DataSourceID="AnimalsSeenComODS1">
                <PlotArea>
                    <Series>
                        <telerik:LineSeries Name="No of Animals Seen" DataFieldY="Number_of_animals_seen">
                        </telerik:LineSeries>
                    </Series>

                    <XAxis DataLabelsField="YearMonth">
                        <TitleAppearance Text="Period">
                            <TextStyle Margin="20" />
                        </TitleAppearance>
                        <LabelsAppearance DataFormatString="MMM yyyy">
                        </LabelsAppearance>
                        <MajorGridLines Visible="false" />
                        <MinorGridLines Visible="false" />
                    </XAxis>

                    <YAxis>
                        <TitleAppearance Text="No of Animals Seen">
                            <TextStyle Margin="20" />
                        </TitleAppearance>
                        <MinorGridLines Visible="false" />
                    </YAxis>
                </PlotArea>

                <ChartTitle Text="Number of Animals Seens Companywide">
                </ChartTitle>
                <Zoom Enabled="False"></Zoom>
            </telerik:RadHtmlChart>

            <asp:ObjectDataSource ID="AnimalsSeenComODS1" runat="server" SelectMethod="usp_AnimalsSeenCom" TypeName="Test.BLL.Customer.AnimalsSeenComBL">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-04-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-01" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="Company" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="TimeType" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <br />
        </div>
    </form>
</asp:Content>
