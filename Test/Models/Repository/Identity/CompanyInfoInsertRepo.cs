using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Identity;

namespace Test.Models.Repository.Identity
{
    public class CompanyInfoInsertRepo : IDisposable, ICompanyInfoInsertRepo
    {
        private KPIEntities context = new KPIEntities();

        public CompanyInfoInsertRepo()
        {

        }

        void ICompanyInfoInsertRepo.usp_CompanyInfoInsert(int companyNumber, string companyName, int businessType)
        {
            
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