using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class RetailOnlySalesCompanyBL: IDisposable
    {
        private IRetailOnlySalesCompanyRepo retailOnlySalesCompanyRepo;

        public RetailOnlySalesCompanyBL()
        {
            retailOnlySalesCompanyRepo = new RetailOnlySalesCompanyRepo();
        }

        public RetailOnlySalesCompanyBL(IRetailOnlySalesCompanyRepo retailOnlySalesCompanyRepo)
        {
            this.retailOnlySalesCompanyRepo = retailOnlySalesCompanyRepo;
        }

        public List<usp_RetailOnlySalesCompany_Result> usp_RetailOnlySalesCompany(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return retailOnlySalesCompanyRepo.usp_RetailOnlySalesCompany(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    retailOnlySalesCompanyRepo.Dispose();
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