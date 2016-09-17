using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class UniqueCustomersSeenBranchBL
    {
        private IUniqueCustomersSeenBranchRepo uniqueCustomersSeenBranchRepo;

        public UniqueCustomersSeenBranchBL()
        {
            uniqueCustomersSeenBranchRepo = new UniqueCustomersSeenBranchRepo();
        }

        public UniqueCustomersSeenBranchBL(IUniqueCustomersSeenBranchRepo uniqueCustomersSeenBranchRepo)
        {
            this.uniqueCustomersSeenBranchRepo = uniqueCustomersSeenBranchRepo;
        }

        public List<usp_UniqueCustomersSeenBranch_Result> usp_UniqueCustomersSeenBranch(DateTime? start, DateTime? end, long? companyRef, long? branchRef, int? timeType)
        {
            return uniqueCustomersSeenBranchRepo.usp_UniqueCustomersSeenBranch(start, end, companyRef, branchRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    uniqueCustomersSeenBranchRepo.Dispose();
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