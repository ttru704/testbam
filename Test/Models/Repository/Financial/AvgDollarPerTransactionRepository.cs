using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Financial;

namespace Test.Models.Repository.Financial
{
    public class AvgDollarPerTransactionRepository : IDisposable, IAvgDollarPerTransactionRepository
    {
        private KPIEntities context = new KPIEntities();

        public AvgDollarPerTransactionRepository()
        {

        }

        List<AvgDollarPerTransaction_Result> IAvgDollarPerTransactionRepository.AvgDollarPerTransaction(DateTime start, DateTime end, int branchRef, int timeType)
        {
            return context.AvgDollarPerTransaction(start, end, branchRef, timeType).ToList();
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