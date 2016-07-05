using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface;

namespace Test.Models.Repository
{
    public class TotalSalesMonthRepository : IDisposable, ITotalSalesMonthRepository
    {
        private KPIEntities context = new KPIEntities();

        public TotalSalesMonthRepository()
        {

        }

        List<GetTotalSalesMonth_Result> ITotalSalesMonthRepository.GetTotalSalesMonth(DateTime start, DateTime end, int branchRef, int timeType)
        {
            return context.GetTotalSalesMonth(start, end, branchRef, timeType).ToList();
        }

        private bool disposedValue = false; // To detect redundant calls

        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    context.Dispose();
                }
                disposedValue = true;
            }
        }

        void IDisposable.Dispose()
        {
            // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}