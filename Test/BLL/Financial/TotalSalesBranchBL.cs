using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class TotalSalesBranchBL : IDisposable
    {
        private ITotalSalesBranchRepo totalSalesBranchRepo;

        public TotalSalesBranchBL()
        {
            totalSalesBranchRepo = new TotalSalesBranchRepo();
        }

        public TotalSalesBranchBL(ITotalSalesBranchRepo totalSalesBranchRepo)
        {
            this.totalSalesBranchRepo = totalSalesBranchRepo;
        }

        public List<usp_TotalSalesBranch_Result> usp_TotalSalesBranch(DateTime? start, DateTime? end, long? companyRef, long? branchRef, int? timeType)
        {
            return totalSalesBranchRepo.usp_TotalSalesBranch(start, end, companyRef, branchRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    totalSalesBranchRepo.Dispose();
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