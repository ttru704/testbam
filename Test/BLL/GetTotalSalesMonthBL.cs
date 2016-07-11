using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface;
using Test.Models.Repository;

namespace Test.BLL
{
    public class GetTotalSalesMonthBL : IDisposable
    {
        private ITotalSalesMonthRepository totalSalesMonthRepository;

        public GetTotalSalesMonthBL()
        {
            totalSalesMonthRepository = new TotalSalesMonthRepository();
        }

        public GetTotalSalesMonthBL(ITotalSalesMonthRepository totalSalesMonthRepository)
        {
            this.totalSalesMonthRepository = totalSalesMonthRepository;
        }

        public List<GetTotalSalesMonth_Result> GetTotalSalesMonth(DateTime start, DateTime end, int branchRef, int timeType)
        {
            return totalSalesMonthRepository.GetTotalSalesMonth(start, end, branchRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    totalSalesMonthRepository.Dispose();
                }
            }
            this.disposedValue = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}