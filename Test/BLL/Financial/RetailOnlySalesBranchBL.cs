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
    public class RetailOnlySalesBranchBL : IDisposable
    {
        private IRetailOnlySalesBranchRepo retailOnlySalesBranchRepo;

        public RetailOnlySalesBranchBL()
        {
            retailOnlySalesBranchRepo = new RetailOnlySalesBranchRepo();
        }

        public RetailOnlySalesBranchBL(IRetailOnlySalesBranchRepo retailOnlySalesBranchRepo)
        {
            this.retailOnlySalesBranchRepo = retailOnlySalesBranchRepo;
        }

        public List<usp_RetailOnlySalesBranch_Result> usp_RetailOnlySalesBranch(DateTime? start, DateTime? end, int companyRef, int branchRef, int timeType)
        {
            return retailOnlySalesBranchRepo.usp_RetailOnlySalesBranch(start, end, companyRef, branchRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    retailOnlySalesBranchRepo.Dispose();
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