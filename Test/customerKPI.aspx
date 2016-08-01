﻿<%@ Page Title="" Language="C#" MasterPageFile="~/principal.Master" AutoEventWireup="true" CodeBehind="customerKPI.aspx.cs" Inherits="Test.customerkpi" %>

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

            <div>
                <telerik:RadDatePicker ID="DatePicker1" runat="server" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-05-01" SelectedDate="2015-04-01"></telerik:RadDatePicker>
                <telerik:RadDatePicker ID="DatePicker2" runat="server" PopupDirection="BottomLeft" DateInput-EmptyMessage="2015-09-30" SelectedDate="2015-09-01"></telerik:RadDatePicker>
                <asp:DropDownList ID="CompanyDDL1" runat="server" Width="100px" >
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="BranchDDL1" runat="server" AutoPostBack="True" AppendDataBoundItems="True" EnableViewState="False" Width="100px" DataSourceID="BranchDropDownODS1" DataTextField="Branch_Name" DataValueField="Ref_Number">
                    <asp:ListItem Value="0" Selected="True">All Branches</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="TimeDDL1" runat="server" Width="100px">
                    <asp:ListItem Value="1"> Monthly </asp:ListItem>
                    <asp:ListItem Value="2"> Yearly </asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="Button1" runat="server" Text="View" OnClick="Button1_Click" />
                <asp:ObjectDataSource ID="BranchDropDownODS1" runat="server" SelectMethod="usp_BranchDropDownList" TypeName="Test.BLL.BranchDropDownListBL">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>

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
                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-05-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-30" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
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
                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-05-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-030" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="BranchDDL1" DefaultValue="0" Name="branchRef" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            
            <%--Display Number of Unique Customers Seen branch comparison--%>

            <p>&nbsp;</p>
            <div class="kpiheader">Number of Animals Seen Companywide</div>

            <%--Display Number of Animals Seen Companywide--%>

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
                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-05-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-30" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <%--Display Number of Animals Seen Companywide--%>

            <%--Display Number of Animals Seen Branch Comparison--%>
            <div class="kpiheader">Number of Animals Seen Branch Comparison</div>
            <telerik:RadHtmlChart ID="AnimalsSeenBranchRHC1" runat="server"></telerik:RadHtmlChart>
            <asp:ObjectDataSource ID="AnimalsSeenBranchODS1" runat="server" SelectMethod="usp_AnimalsSeenBranch" TypeName="Test.BLL.Customer.AnimalsSeenBranchBL">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-05-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-30" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="BranchDDL1" DefaultValue="0" Name="branchRef" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <%--Display Number of Animals Seen Branch Comparison--%>

            <%--This section is for Average dollar per customer companywide  chart--%>
            <div class="kpiheader">Average Dollar Earned per Customer Companywide</div>
            <telerik:RadHtmlChart ID="AvgDollarPerCustomerComRHC1" runat="server" DataSourceID="AvgDollarPerCustomerComODS1">
                <Pan Enabled="true" Lock="Y" />
                <Zoom Enabled="true">
                    <MouseWheel Enabled="true" Lock="Y" />
                    <Selection Enabled="true" Lock="Y" ModifierKey="Shift" />
                </Zoom>
                <Legend>
                    <Appearance Position="Bottom" />
                </Legend>
                <PlotArea>
                    <XAxis Color="Black" DataLabelsField="Year_Month">
                        <TitleAppearance Position="Center" Text="Time Period" />
                        <LabelsAppearance DataFormatString="MMM yy">
                        </LabelsAppearance>
                    </XAxis>
                    <YAxis Color="Black">
                        <MajorGridLines Color="#EFEFEF" Width="1" />
                        <MinorGridLines Color="#F7F7F7" Width="1" />
                        <TitleAppearance Position="Center" Text="$" RotationAngle="90" />
                    </YAxis>
                    <Series>
                        <telerik:AreaSeries Name="Average Dollar per Customer" DataFieldY="Average_Dollar_per_customer">
                            <Appearance>
                                <FillStyle BackgroundColor="Orange" />
                            </Appearance>
                            <MarkersAppearance MarkersType="Circle" BackgroundColor="White" />
                            <TooltipsAppearance BackgroundColor="White" />
                            <LabelsAppearance DataFormatString="C2">
                            </LabelsAppearance>
                        </telerik:AreaSeries>
                    </Series>
                </PlotArea>

                <ChartTitle Text="Average Dollar Value per Customer ">
                </ChartTitle>
            </telerik:RadHtmlChart>
            <asp:ObjectDataSource ID="AvgDollarPerCustomerComODS1" runat="server" SelectMethod="usp_AvgDollarPerCustomerCom" TypeName="Test.BLL.Customer.AvgDollarPerCustomerComBL">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-05-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-30" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <%--This section is for Average dollar per customer companywide  chart--%>

            <%--This section is for Average dollar per customer branch comparison  chart--%>
            <div class="kpiheader">Average Dollar Earned per Customer Branch Comparison</div>
            <telerik:RadHtmlChart ID="AvgDollarPerCustomerBranchRHC1" runat="server"></telerik:RadHtmlChart>
            <%--This section is for Average dollar per customer branch comparison  chart--%>
            <br />

            <%--This section is for Number of New Customers companywide  chart--%>
            <div class="kpiheader">Number of New Customers Companywide</div>
            <telerik:RadHtmlChart ID="NewCustomersComRHC1" runat="server" DataSourceID="NewCustomersComODS1">
                <PlotArea>
                    <Series>
                        <telerik:ColumnSeries DataFieldY="Number_of_New_Customers">
                        </telerik:ColumnSeries>
                    </Series>
                    <XAxis DataLabelsField="YearMonth" Type="Date">
                        <TitleAppearance Text="Time Period">
                            <TextStyle Margin="20" />
                        </TitleAppearance>
                        <LabelsAppearance DataFormatString="MMM yyyy">
                        </LabelsAppearance>
                        <MajorGridLines Visible="false" />
                        <MinorGridLines Visible="false" />
                    </XAxis>
                    <YAxis>
                        <TitleAppearance Text="No of New Customers">
                            <TextStyle Margin="20" />
                        </TitleAppearance>
                        <MinorGridLines Visible="false" />
                    </YAxis>
                </PlotArea>

                <ChartTitle Text="No of New Customers Companywide">
                </ChartTitle>
            </telerik:RadHtmlChart>
            <asp:ObjectDataSource ID="NewCustomersComODS1" runat="server" SelectMethod="usp_NewCustomersCom" TypeName="Test.BLL.Customer.NewCustomersComBL">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DatePicker1" DefaultValue="2015-05-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="DatePicker2" DefaultValue="2015-09-30" Name="end" PropertyName="SelectedDate" Type="DateTime" />
                    <asp:ControlParameter ControlID="CompanyDDL1" DefaultValue="1" Name="companyRef" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="TimeDDL1" DefaultValue="1" Name="timeType" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <%--This section is for Number of New Customers companywide  chart--%>
        </div>
    </form>
</asp:Content>
