using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Financial;

namespace Test.Models.Repository.Financial
{
    public class ServiceOnlySalesBranchRepo : IDisposable, IServiceOnlySalesBranchRepo
    {
        private KPIEntities context = new KPIEntities();

        public ServiceOnlySalesBranchRepo()
        {

        }

        List<usp_ServiceOnlySalesBranch_Result> IServiceOnlySalesBranchRepo.usp_ServiceOnlySalesBranch(DateTime? start, DateTime? end, long? companyRef, long? branchRef, int? timeType)
        {
            return context.usp_ServiceOnlySalesBranch(start, end, companyRef, branchRef, timeType).ToList();
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