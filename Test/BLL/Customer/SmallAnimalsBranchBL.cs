using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class SmallAnimalsBranchBL
    {
        private ISmallAnimalsBranchRepo smallAnimalsBranchRepo;

        public SmallAnimalsBranchBL()
        {
            smallAnimalsBranchRepo = new SmallAnimalsBranchRepo();
        }

        public SmallAnimalsBranchBL(ISmallAnimalsBranchRepo smallAnimalsBranchRepo)
        {
            this.smallAnimalsBranchRepo = smallAnimalsBranchRepo;
        }

        public List<usp_SmallAnimalsBranch_Result> usp_SmallAnimalsBranch(DateTime? start, DateTime? end, int? companyRef, int? branchRef, int? timeType)
        {
            return smallAnimalsBranchRepo.usp_SmallAnimalsBranch(start, end, companyRef, branchRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    smallAnimalsBranchRepo.Dispose();
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