using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Controls;

namespace Test.Models.Repository.Controls
{
    public class KPIListForCompanyRepo : IDisposable, IKPIListForCompanyRepo
    {
        private KPIEntities context = new KPIEntities();

        public KPIListForCompanyRepo()
        {

        }

        List<usp_KPIListForCompany_Result> IKPIListForCompanyRepo.usp_KPIListForCompany(long companyRef, long businessType, int kpiType)
        {
            return context.usp_KPIListForCompany(companyRef, businessType, kpiType).ToList();
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