using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Financial;

namespace Test.Models.Repository.Financial
{
    public class RetailOnlySalesBranchRepo : IDisposable, IRetailOnlySalesBranchRepo
    {
        private KPIEntities context = new KPIEntities();

        public RetailOnlySalesBranchRepo()
        {

        }

        List<usp_RetailOnlySalesBranch_Result> IRetailOnlySalesBranchRepo.usp_RetailOnlySalesBranch(DateTime? start, DateTime? end, long? companyRef, long? branchRef, int? timeType)
        {
            return context.usp_RetailOnlySalesBranch(start, end, companyRef, branchRef, timeType).ToList();
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