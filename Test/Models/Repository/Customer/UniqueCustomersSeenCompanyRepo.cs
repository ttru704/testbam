using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Customer;

namespace Test.Models.Repository.Customer
{
    public class UniqueCustomersSeenCompanyRepo: IDisposable, IUniqueCustomersSeenCompanyRepo
    {
        private KPIEntities context = new KPIEntities();

        public UniqueCustomersSeenCompanyRepo()
        {

        }

        List<usp_UniqueCustomersSeenCompany_Result> IUniqueCustomersSeenCompanyRepo.usp_UniqueCustomersSeenCompany(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return context.usp_UniqueCustomersSeenCompany(start, end, companyRef, timeType).ToList();
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