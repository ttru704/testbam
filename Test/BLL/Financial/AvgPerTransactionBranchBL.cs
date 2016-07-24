using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class AvgPerTransactionBranchBL : IDisposable
    {
        private IAvgPerTransactionBranchRepo AvgPerTransactionBranchRepo;

        public AvgPerTransactionBranchBL()
        {
            AvgPerTransactionBranchRepo = new AvgPerTransactionBranchRepo();
        }

        public AvgPerTransactionBranchBL(AvgPerTransactionBranchRepo AvgPerTransactionBranchRepo)
        {
            this.AvgPerTransactionBranchRepo = AvgPerTransactionBranchRepo;
        }

        public List<usp_AvgPerTransactionBranch_Result> usp_AvgPerTransactionBranch(DateTime start, DateTime end, int companyRef, int branchRef, int timeType)
        {
            return AvgPerTransactionBranchRepo.usp_AvgPerTransactionBranch(start, end, companyRef, branchRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    AvgPerTransactionBranchRepo.Dispose();
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