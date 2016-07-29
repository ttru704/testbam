using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class TotalSalesChangesBL : IDisposable
    {
        private ITotalSalesChangesRepo totalSalesChangesRepo;

        public TotalSalesChangesBL()
        {
            totalSalesChangesRepo = new TotalSalesChangesRepo();
        }

        public TotalSalesChangesBL(ITotalSalesChangesRepo totalSalesChangesRepo)
        {
            this.totalSalesChangesRepo = totalSalesChangesRepo;
        }

        public double? usp_TotalSalesChanges(int companyRef)
        {
            return totalSalesChangesRepo.usp_TotalSalesChanges(companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    totalSalesChangesRepo.Dispose();
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