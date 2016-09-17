using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class TotalSalesCompanyBL: IDisposable
    {
        private ITotalSalesCompanyRepo totalSalesCompanyRepo;

        public TotalSalesCompanyBL()
        {
            totalSalesCompanyRepo = new TotalSalesCompanyRepo();
        }

        public TotalSalesCompanyBL(ITotalSalesCompanyRepo totalSalesCompanyRepo)
        {
            this.totalSalesCompanyRepo = totalSalesCompanyRepo;
        }

        public List<usp_TotalSalesCompany_Result> usp_TotalSalesCompany(DateTime start, DateTime end, long companyRef, int timeType)
        {
            return totalSalesCompanyRepo.usp_TotalSalesCompany(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    totalSalesCompanyRepo.Dispose();
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