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
    public class AvgDollarPerTransactionBranchBL : IDisposable
    {
        private IAvgDollarPerTransactionBranchRepo AvgDollarPerTransactionBranchRepo;

        public AvgDollarPerTransactionBranchBL()
        {
            AvgDollarPerTransactionBranchRepo = new AvgDollarPerTransactionBranchRepo();
        }

        public AvgDollarPerTransactionBranchBL(AvgDollarPerTransactionBranchRepo AvgDollarPerTransactionBranchRepo)
        {
            this.AvgDollarPerTransactionBranchRepo = AvgDollarPerTransactionBranchRepo;
        }

        public List<usp_AvgDollarPerTransactionBranch_Result> usp_AvgDollarPerTransactionBranch(DateTime? start, DateTime? end, int? companyRef, int? branchRef, int? timeType)
        {
            return AvgDollarPerTransactionBranchRepo.usp_AvgDollarPerTransactionBranch(start, end, companyRef, branchRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    AvgDollarPerTransactionBranchRepo.Dispose();
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
