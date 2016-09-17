using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Financial;

namespace Test.Models.Repository.Financial
{
    public class RetailOnlySalesCompanyRepo: IDisposable, IRetailOnlySalesCompanyRepo
    {
        private KPIEntities context = new KPIEntities();

        public RetailOnlySalesCompanyRepo()
        {

        }

        List<usp_RetailOnlySalesCompany_Result> IRetailOnlySalesCompanyRepo.usp_RetailOnlySalesCompany(DateTime start, DateTime end, long companyRef, int timeType)
        {
            return context.usp_RetailOnlySalesCompany(start, end, companyRef, timeType).ToList();
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