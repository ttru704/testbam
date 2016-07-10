using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class TotalSalesBComparisonBL: IDisposable
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
    }
}