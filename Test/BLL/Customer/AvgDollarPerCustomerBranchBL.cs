using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class AvgDollarPerCustomerBranchBL
    {
        private IAvgDollarPerCustomerBranchRepo avgDollarPerCustomerBranchRepo;

        public AvgDollarPerCustomerBranchBL()
        {
            avgDollarPerCustomerBranchRepo = new AvgDollarPerCustomerBranchRepo();
        }

        public AvgDollarPerCustomerBranchBL(IAvgDollarPerCustomerBranchRepo avgDollarPerCustomerBranchRepo)
        {
            this.avgDollarPerCustomerBranchRepo = avgDollarPerCustomerBranchRepo;
        }

        public List<usp_AvgDollarPerCustomerBranch_Result> usp_AvgDollarPerCustomerBranch(DateTime start, DateTime end, int companyRef, int branchRef, int timeType)
        {
            return avgDollarPerCustomerBranchRepo.usp_AvgDollarPerCustomerBranch(start, end, companyRef, branchRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    avgDollarPerCustomerBranchRepo.Dispose();
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