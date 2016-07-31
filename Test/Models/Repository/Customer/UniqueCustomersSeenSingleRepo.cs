using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Customer;

namespace Test.Models.Repository.Customer
{
    public class UniqueCustomersSeenSingleRepo : IDisposable, IUniqueCustomersSeenSingleRepo
    {
        private KPIEntities context = new KPIEntities();

        public UniqueCustomersSeenSingleRepo()
        {

        }

        double? IUniqueCustomersSeenSingleRepo.usp_UniqueCustomersSeenSingle(int companyRef)
        {
            return context.usp_UniqueCustomersSeenSingle(companyRef).SingleOrDefault();
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