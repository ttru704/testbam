using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Identity;
using Test.Models.Repository.Identity;
using Test.Models;

namespace Test.BLL.Identity
{
    public class CompanyInfoInsertBL
    {
        private ICompanyInfoInsertRepo companyInfoInsertRepo;

        public CompanyInfoInsertBL()
        {
            companyInfoInsertRepo = new CompanyInfoInsertRepo();
        }

        public CompanyInfoInsertBL(ICompanyInfoInsertRepo companyInfoInsertRepo)
        {
            this.companyInfoInsertRepo = companyInfoInsertRepo;
        }

        public void usp_CompanyInfoInsert(int companyNumber, string companyName, int businessType)
        {
            
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    companyInfoInsertRepo.Dispose();
                }
            }
            this.disposedValue = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

    }
}