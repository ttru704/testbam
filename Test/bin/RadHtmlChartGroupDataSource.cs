using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

/// <summary>
/// A Class that provides functionality for grouping RadHtmlChart's data source
/// </summary>
public static class RadHtmlChartGroupDataSource
{
	/// <summary>
	/// Groups the RadHtmlChart's data source.
	/// </summary>
	/// <param name="HtmlChart">The RadHtmlChart instance.</param>
	/// <param name="DataSource">The raw DataTable data source.</param>
	/// <param name="DataGroupColumn">The name of the column in the raw data source which will be the criteria for grouping the chart series items into series. There will be as many series as the number of distinct values in this column.</param>
	/// <param name="SeriesType">The type of the series. Currently the example supports Area, Bar, Column, Line, Scatter and ScatterLine series. You can, however, expand that list in the AddChartSeriesType() method.</param>
	/// <param name="DataFieldY">The name of the column in the raw data source that stores the y-values.</param>
	/// <param name="DataFieldX">The name of the column in the raw data source that stores the x-values. </param>
	public static void GroupDataSource(RadHtmlChart HtmlChart, DataTable DataSource, string DataGroupColumn, string SeriesType, string DataFieldY, string DataFieldX)
	{
		//Get number of distinct rows by DataGroupColumn (e.g., Year column)
		DataTable distinctValuesDT = DataSource.DefaultView.ToTable(true, DataGroupColumn);
		int numDistinctValues = distinctValuesDT.Rows.Count;

		//Add RadHtmlChart series
		ConfigureChartSeries(HtmlChart, numDistinctValues, distinctValuesDT, SeriesType, DataFieldY, DataFieldX);

		//Group data source and bind it to the chart
		HtmlChart.DataSource = GetGroupedData(DataSource, DataGroupColumn, DataFieldY, numDistinctValues, distinctValuesDT);
		HtmlChart.DataBind();
	}
	/// <summary>
	/// Configures chart series. For example sets series names, define tooltips/labels template, etc.
	/// </summary>
	private static void ConfigureChartSeries(RadHtmlChart HtmlChart, int NumDistinctValues, DataTable DistinctValuesDT, string SeriesType, string DataFieldY, string DataFieldX)
	{
		HtmlChart.PlotArea.Series.Clear();
		//Detect whether series are of category type
		string[] categorySeriesArray = { "AreaSeries", "BarSeries", "ColumnSeries", "LineSeries" };
		bool isCategorySeries = Array.IndexOf(categorySeriesArray, SeriesType) > -1 ? true : false;

		//Configure x-axis DataLabelsField if series are of category type
		if (isCategorySeries)
		{
			HtmlChart.PlotArea.XAxis.DataLabelsField = DataFieldX + "0";
		}

		for (int i = 0; i < NumDistinctValues; i++)
		{
			//Construct the series name, tooltips template and labels format string
			string seriesName = DistinctValuesDT.Columns[0].ColumnName + " : " + DistinctValuesDT.Rows[i][0].ToString();
			string tooltipsTemplate = "Category: #=dataItem." + DataFieldX + i + "#<br />Value: #=dataItem." + DataFieldY + i + "#";
			string labelsFormatString = "{0:N0}";

			//Add the corresponding series type to the chart
			AddChartSeriesType(HtmlChart, SeriesType, DataFieldY, DataFieldX, i, seriesName, tooltipsTemplate, labelsFormatString);
		}
	}
	/// <summary>
	/// Adds chart series. Currently the method supports Area, Bar, Column, Line, Scatter and ScatterLine series. You can, however, expand that list here.
	/// </summary>
	private static void AddChartSeriesType(RadHtmlChart HtmlChart, string SeriesType, string DataFieldY, string DataFieldX, int Index, string SeriesName, string TooltipsTemplate, string LabelsFormatString)
	{
		switch (SeriesType)
		{
			case "AreaSeries":
				AreaSeries areaSeries1 = new AreaSeries();
				areaSeries1.Name = SeriesName;
				areaSeries1.DataFieldY = DataFieldY + Index;
				areaSeries1.TooltipsAppearance.ClientTemplate = TooltipsTemplate;
				areaSeries1.LabelsAppearance.DataFormatString = LabelsFormatString;
				HtmlChart.PlotArea.Series.Add(areaSeries1);
				break;

			case "BarSeries":
				BarSeries barSeries1 = new BarSeries();
				barSeries1.Name = SeriesName;
				barSeries1.DataFieldY = DataFieldY + Index;
				barSeries1.TooltipsAppearance.ClientTemplate = TooltipsTemplate;
				barSeries1.LabelsAppearance.DataFormatString = LabelsFormatString;
				HtmlChart.PlotArea.Series.Add(barSeries1);
				break;

			case "ColumnSeries":
				ColumnSeries columnSeries1 = new ColumnSeries();
				columnSeries1.Name = SeriesName;
				columnSeries1.DataFieldY = DataFieldY + Index;
				columnSeries1.TooltipsAppearance.ClientTemplate = TooltipsTemplate;
				columnSeries1.LabelsAppearance.DataFormatString = LabelsFormatString;
				HtmlChart.PlotArea.Series.Add(columnSeries1);
				break;

			case "LineSeries":
				LineSeries lineSeries1 = new LineSeries();
				lineSeries1.Name = SeriesName;
				lineSeries1.DataFieldY = DataFieldY + Index;
				lineSeries1.TooltipsAppearance.ClientTemplate = TooltipsTemplate;
				lineSeries1.LabelsAppearance.DataFormatString = LabelsFormatString;
				HtmlChart.PlotArea.Series.Add(lineSeries1);
				break;

			case "ScatterSeries":
				ScatterSeries scatterSeries1 = new ScatterSeries();
				scatterSeries1.Name = SeriesName;
				scatterSeries1.DataFieldY = DataFieldY + Index;
				scatterSeries1.DataFieldX = DataFieldX + Index;
				scatterSeries1.TooltipsAppearance.ClientTemplate = TooltipsTemplate;
				scatterSeries1.LabelsAppearance.DataFormatString = LabelsFormatString;
				HtmlChart.PlotArea.Series.Add(scatterSeries1);
				break;

			case "ScatterLineSeries":
				ScatterLineSeries scatterLineSeries1 = new ScatterLineSeries();
				scatterLineSeries1.Name = SeriesName;
				scatterLineSeries1.DataFieldY = DataFieldY + Index;
				scatterLineSeries1.DataFieldX = DataFieldX + Index;
				scatterLineSeries1.TooltipsAppearance.ClientTemplate = TooltipsTemplate;
				scatterLineSeries1.LabelsAppearance.DataFormatString = LabelsFormatString;
				HtmlChart.PlotArea.Series.Add(scatterLineSeries1);
				break;

			default:
				break;
		}
	}
	/// <summary>
	/// The actual data source grouping manipulations.
	/// </summary>
	private static DataTable GetGroupedData(DataTable RawDataTable, string DataGroupColumn, string DataFieldY, int NumDistinctValues, DataTable DistinctValuesDT)
	{
		DataTable commonDT = new DataTable();

		//Split the raw DataTable by numDistinctValues to an array of temporary DataTables
		DataTable[] tempDTarray = new DataTable[NumDistinctValues];
		tempDTarray = SplitDataTable(RawDataTable, DataGroupColumn, NumDistinctValues, DistinctValuesDT);

		//Add rows to the common DataTable
		for (int i = 0; i < tempDTarray[0].Rows.Count; i++)
		{
			commonDT.Rows.Add();
		}

		//Add columns to the common DataTable and fill values from each temp DataTable
		for (int i = 0; i < NumDistinctValues; i++)
		{
			//Loop through the columns of each temp DataTable
			for (int g = 0; g < tempDTarray[i].Columns.Count; g++)
			{
				string columnName = tempDTarray[i].Columns[g].ColumnName;
				//Add columns from the temp DataTables to the common DataTable
				commonDT.Columns.Add(columnName, tempDTarray[i].Columns[g].DataType);

				//Loop through the rows of the each temp DataTable
				for (int f = 0; f < tempDTarray[i].Rows.Count; f++)
				{
					//Fill values from each temp DataTable to the common DataTable
					commonDT.Rows[f][columnName] = tempDTarray[i].Rows[f][columnName];
				}
			}
		}
		return commonDT;
	}
	/// <summary>
	/// A helper method for the data source grouping manipulations.
	/// </summary>
	private static DataTable[] SplitDataTable(DataTable RawDataTable, string DataGroupColumn, int NumDistinctValues, DataTable DistinctValuesDT)
	{
		DataTable[] tempDTarray = new DataTable[NumDistinctValues];

		for (int i = 0; i < NumDistinctValues; i++)
		{
			//Split the raw DataTable to multiple temporary DataTables by distinct DataGroupColumn values
			tempDTarray[i] = RawDataTable.Select(DataGroupColumn + "='" + DistinctValuesDT.Rows[i][0].ToString() + "'").CopyToDataTable();

			for (int g = 0; g < tempDTarray[i].Columns.Count; g++)
			{
				//Add g-th index to column names for each i-th DataTable from the temporary DataTable array
				string columnName = tempDTarray[i].Columns[g].ColumnName + i;
				tempDTarray[i].Columns[g].ColumnName = columnName;
			}
		}

		return tempDTarray;
	}
}