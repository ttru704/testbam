using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class LargeAnimalsBranchBL
    {
        private ILargeAnimalsBranchRepo largeAnimalsBranchRepo;

        public LargeAnimalsBranchBL()
        {
            largeAnimalsBranchRepo = new LargeAnimalsBranchRepo();
        }

        public LargeAnimalsBranchBL(ILargeAnimalsBranchRepo largeAnimalsBranchRepo)
        {
            this.largeAnimalsBranchRepo = largeAnimalsBranchRepo;
        }

        public List<usp_LargeAnimalsBranch_Result> usp_LargeAnimalsBranch(DateTime start, DateTime end, int companyRef, int branchRef, int timeType)
        {
            return largeAnimalsBranchRepo.usp_LargeAnimalsBranch(start, end, companyRef, branchRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    largeAnimalsBranchRepo.Dispose();
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