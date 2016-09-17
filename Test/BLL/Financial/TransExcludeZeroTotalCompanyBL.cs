using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class TransExcludeZeroTotalCompanyBL : IDisposable
    {
        private ITransExcludeZeroTotalCompanyRepo transExcludeZeroTotalCompanyRepo;

        public TransExcludeZeroTotalCompanyBL()
        {
            transExcludeZeroTotalCompanyRepo = new TransExcludeZeroTotalCompanyRepo();
        }

        public TransExcludeZeroTotalCompanyBL(ITransExcludeZeroTotalCompanyRepo transExcludeZeroTotalCompanyRepo)
        {
            this.transExcludeZeroTotalCompanyRepo = transExcludeZeroTotalCompanyRepo;
        }

        public List<usp_TransExcludeZeroTotalCompany_Result> usp_TransExcludeZeroTotalCompany(DateTime start, DateTime end, long companyRef, int timeType)
        {
            return transExcludeZeroTotalCompanyRepo.usp_TransExcludeZeroTotalCompany(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    transExcludeZeroTotalCompanyRepo.Dispose();
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