using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Productivity;

namespace Test.Models.Repository.Productivity
{
    public class CustomersSeenByEmployeeCompanyRepo : IDisposable, ICustomersSeenByEmployeeCompanyRepo
    {
        private KPIEntities context = new KPIEntities();

        public CustomersSeenByEmployeeCompanyRepo()
        {

        }

        List<usp_CustomersSeenByEmployeeCompany_Result> ICustomersSeenByEmployeeCompanyRepo.usp_CustomersSeenByEmployeeCompany(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return context.usp_CustomersSeenByEmployeeCompany(start, end, companyRef, timeType).ToList();
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