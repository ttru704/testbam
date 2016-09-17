using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class AnimalsSeenBranchBL
    {
        private IAnimalsSeenBranchRepo animalsSeenBranchRepo;

        public AnimalsSeenBranchBL()
        {
            animalsSeenBranchRepo = new AnimalsSeenBranchRepo();
        }

        public AnimalsSeenBranchBL(IAnimalsSeenBranchRepo animalsSeenBranchRepo)
        {
            this.animalsSeenBranchRepo = animalsSeenBranchRepo;
        }

        public List<usp_AnimalsSeenBranch_Result> usp_AnimalsSeenBranch(DateTime? start, DateTime? end, long? companyRef, long? branchRef, int? timeType)
        {
            return animalsSeenBranchRepo.usp_AnimalsSeenBranch(start, end, companyRef, branchRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    animalsSeenBranchRepo.Dispose();
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