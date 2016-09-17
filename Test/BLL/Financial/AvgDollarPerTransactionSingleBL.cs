using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class AvgDollarPerTransactionSingleBL : IDisposable
    {
        private IAvgDollarPerTransactionSingleRepo avgDollarPerTransactionSingleRepo;

        public AvgDollarPerTransactionSingleBL()
        {
            avgDollarPerTransactionSingleRepo = new AvgDollarPerTransactionSingleRepo();
        }

        public AvgDollarPerTransactionSingleBL(IAvgDollarPerTransactionSingleRepo avgDollarPerTransactionSingleRepo)
        {
            this.avgDollarPerTransactionSingleRepo = avgDollarPerTransactionSingleRepo;
        }

        public double? usp_AvgDollarPerTransactionSingle(Int64? companyRef)
        {
            return avgDollarPerTransactionSingleRepo.usp_AvgDollarPerTransactionSingle(companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    avgDollarPerTransactionSingleRepo.Dispose();
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