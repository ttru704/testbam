using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class AvgPerTransactionSingleBL : IDisposable
    {
        private IAvgPerTransactionSingleRepo avgPerTransactionSingleRepo;

        public AvgPerTransactionSingleBL()
        {
            avgPerTransactionSingleRepo = new AvgPerTransactionSingleRepo();
        }

        public AvgPerTransactionSingleBL(IAvgPerTransactionSingleRepo avgPerTransactionSingleRepo)
        {
            this.avgPerTransactionSingleRepo = avgPerTransactionSingleRepo;
        }

        public double? usp_AvgPerTransactionSingle(int companyRef)
        {
            return avgPerTransactionSingleRepo.usp_AvgPerTransactionSingle(companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    avgPerTransactionSingleRepo.Dispose();
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