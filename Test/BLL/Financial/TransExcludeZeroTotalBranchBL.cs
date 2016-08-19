using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;
using System.Reflection;

namespace Test.BLL.Financial
{
    public class TransExcludeZeroTotalBranchBL : IDisposable
    {
        private ITransExcludeZeroTotalBranchRepo TransExcludeZeroTotalBranchRepo;

        public TransExcludeZeroTotalBranchBL()
        {
            TransExcludeZeroTotalBranchRepo = new TransExcludeZeroTotalBranchRepo();
        }

        public TransExcludeZeroTotalBranchBL(TransExcludeZeroTotalBranchRepo TransExcludeZeroTotalBranchRepo)
        {
            this.TransExcludeZeroTotalBranchRepo = TransExcludeZeroTotalBranchRepo;
        }

        public List<usp_TransExcludeZeroTotalBranch_Result> usp_TransExcludeZeroTotalBranch(DateTime? start, DateTime? end, int companyRef, int branchRef, int timeType)
        {
            return TransExcludeZeroTotalBranchRepo.usp_TransExcludeZeroTotalBranch(start, end, companyRef, branchRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    TransExcludeZeroTotalBranchRepo.Dispose();
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