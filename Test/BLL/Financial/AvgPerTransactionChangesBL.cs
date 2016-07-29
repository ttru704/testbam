using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class AvgPerTransactionChangesBL : IDisposable
    {
        private IAvgPerTransactionChangesRepo avgPerTransactionChangesRepo;

        public AvgPerTransactionChangesBL()
        {
            avgPerTransactionChangesRepo = new AvgPerTransactionChangesRepo();
        }

        public AvgPerTransactionChangesBL(IAvgPerTransactionChangesRepo avgPerTransactionChangesRepo)
        {
            this.avgPerTransactionChangesRepo = avgPerTransactionChangesRepo;
        }

        public double? usp_AvgPerTransactionChanges(int companyRef)
        {
            return avgPerTransactionChangesRepo.usp_AvgPerTransactionChanges(companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    avgPerTransactionChangesRepo.Dispose();
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