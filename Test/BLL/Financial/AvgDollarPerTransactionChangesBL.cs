using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class AvgDollarPerTransactionChangesBL : IDisposable
    {
        private IAvgDollarPerTransactionChangesRepo avgDollarPerTransactionChangesRepo;

        public AvgDollarPerTransactionChangesBL()
        {
            avgDollarPerTransactionChangesRepo = new AvgDollarPerTransactionChangesRepo();
        }

        public AvgDollarPerTransactionChangesBL(IAvgDollarPerTransactionChangesRepo avgDollarPerTransactionChangesRepo)
        {
            this.avgDollarPerTransactionChangesRepo = avgDollarPerTransactionChangesRepo;
        }

        public double? usp_AvgDollarPerTransactionChanges(int companyRef)
        {
            return avgDollarPerTransactionChangesRepo.usp_AvgDollarPerTransactionChanges(companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    avgDollarPerTransactionChangesRepo.Dispose();
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