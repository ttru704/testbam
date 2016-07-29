using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Financial;

namespace Test.Models.Repository.Financial
{
    public class AvgPerTransactionChangesRepo : IDisposable, IAvgPerTransactionChangesRepo
    {
        private KPIEntities context = new KPIEntities();

        public AvgPerTransactionChangesRepo()
        {

        }

        double? IAvgPerTransactionChangesRepo.usp_AvgPerTransactionChanges(int companyRef)
        {
            return context.usp_AvgPerTransactionChanges(companyRef).SingleOrDefault();
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