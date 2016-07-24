using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class TotalSalesComBL: IDisposable
    {
        private ITotalSalesComRepo totalSalesComRepo;

        public TotalSalesComBL()
        {
            totalSalesComRepo = new TotalSalesComRepo();
        }

        public TotalSalesComBL(ITotalSalesComRepo totalSalesComRepo)
        {
            this.totalSalesComRepo = totalSalesComRepo;
        }

        public List<usp_TotalSalesCom_Result> usp_TotalSalesCom(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return totalSalesComRepo.usp_TotalSalesCom(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    totalSalesComRepo.Dispose();
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