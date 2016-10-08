using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Controls;

namespace Test.Models.Repository.Controls
{
    public class InsertIntoKpiForCompanyRepo :IDisposable, IInsertIntoKpiForCompanyRepo
    {
        private KPIEntities context = new KPIEntities();

        public InsertIntoKpiForCompanyRepo()
        {

        }

        void IInsertIntoKpiForCompanyRepo.usp_InsertIntoKpiForCompany(long kpiRef, long companyRef)
        {
            context.usp_InsertIntoKpiForCompany(kpiRef, companyRef);
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