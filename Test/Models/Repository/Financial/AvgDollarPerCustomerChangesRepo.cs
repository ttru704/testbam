using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Financial;

namespace Test.Models.Repository.Financial
{
    public class AvgDollarPerCustomerChangesRepo : IDisposable, IAvgDollarPerCustomerChangesRepo
    {
        private KPIEntities context = new KPIEntities();

        public AvgDollarPerCustomerChangesRepo()
        {

        }

        double? IAvgDollarPerCustomerChangesRepo.usp_AvgDollarPerCustomerChanges(int companyRef)
        {
            return context.usp_AvgDollarPerCustomerChanges(companyRef).SingleOrDefault();
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