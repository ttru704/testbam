using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class TotalSalesBComparisonBL : IDisposable
    {
        private ITotalSalesBComparisonRepository totalSalesBComparisonRepository;

        public TotalSalesBComparisonBL()
        {
            totalSalesBComparisonRepository = new TotalSalesBComparisonRepository();
        }

        public TotalSalesBComparisonBL(ITotalSalesBComparisonRepository totalSalesBComparisonRepository)
        {
            this.totalSalesBComparisonRepository = totalSalesBComparisonRepository;
        }

        public List<TotalSalesBComparison_Result> TotalSalesBComparison(DateTime start, DateTime end, int branchRef, int timeType)
        {
            return totalSalesBComparisonRepository.TotalSalesBComparison(start, end, branchRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    totalSalesBComparisonRepository.Dispose();
                }
            }
            this.disposedValue = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        public DataTable ConvertToDataTable<TotalSalesBComparison>(IList<TotalSalesBComparison> data)
        {
            PropertyDescriptorCollection properties =
               TypeDescriptor.GetProperties(typeof(TotalSalesBComparison));
            DataTable table = new DataTable();
            foreach (PropertyDescriptor prop in properties)
                table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);
            foreach (TotalSalesBComparison item in data)
            {
                DataRow row = table.NewRow();
                foreach (PropertyDescriptor prop in properties)
                    row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;
                table.Rows.Add(row);
            }
            return table;

        }
    }
}