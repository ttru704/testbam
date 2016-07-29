using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class TotalSalesSingleBL: IDisposable
    {
        private ITotalSalesSingleRepo totalSalesSingleRepo;

        public TotalSalesSingleBL()
        {
            totalSalesSingleRepo = new TotalSalesSingleRepo();
        }

        public TotalSalesSingleBL(ITotalSalesSingleRepo totalSalesSingleRepo)
        {
            this.totalSalesSingleRepo = totalSalesSingleRepo;
        }

        public double? usp_TotalSalesSingle(int companyRef)
        {
            return totalSalesSingleRepo.usp_TotalSalesSingle(companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    totalSalesSingleRepo.Dispose();
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