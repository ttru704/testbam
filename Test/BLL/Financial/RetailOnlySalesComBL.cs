using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class RetailOnlySalesComBL
    {
        private IRetailOnlySalesComRepo retailOnlySalesComRepo;

        public RetailOnlySalesComBL()
        {
            retailOnlySalesComRepo = new RetailOnlySalesComRepo();
        }

        public RetailOnlySalesComBL(IRetailOnlySalesComRepo retailOnlySalesComRepo)
        {
            this.retailOnlySalesComRepo = retailOnlySalesComRepo;
        }

        public List<usp_RetailOnlySalesCom_Result> usp_RetailOnlySalesCom(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return retailOnlySalesComRepo.usp_RetailOnlySalesCom(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    retailOnlySalesComRepo.Dispose();
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