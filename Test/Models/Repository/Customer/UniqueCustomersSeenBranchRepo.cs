using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Customer;

namespace Test.Models.Repository.Customer
{
    public class UniqueCustomersSeenBranchRepo: IDisposable, IUniqueCustomersSeenBranchRepo
    {
        private KPIEntities context = new KPIEntities();

        public UniqueCustomersSeenBranchRepo()
        {

        }

        List<usp_UniqueCustomersSeenBranch_Result> IUniqueCustomersSeenBranchRepo.usp_UniqueCustomersSeenBranch(DateTime? start, DateTime? end, long? companyRef, long? branchRef, int? timeType)
        {
            return context.usp_UniqueCustomersSeenBranch(start, end, companyRef, branchRef, timeType).ToList();
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