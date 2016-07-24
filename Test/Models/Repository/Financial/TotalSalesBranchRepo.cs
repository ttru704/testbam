using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Financial;

namespace Test.Models.Repository.Financial
{
    public class TotalSalesBranchRepo : IDisposable, ITotalSalesBranchRepo
    {
        private KPIEntities context = new KPIEntities();

        public TotalSalesBranchRepo()
        {

        }

        List<usp_TotalSalesBranch_Result> ITotalSalesBranchRepo.usp_TotalSalesBranch(DateTime start, DateTime end, int companyRef, int branchRef, int timeType)
        {
            return context.usp_TotalSalesBranch(start, end, companyRef, branchRef, timeType).ToList();
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