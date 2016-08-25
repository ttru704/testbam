using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class NewCustomersBranchBL
    {
        private INewCustomersBranchRepo newCustomersBranchRepo;

        public NewCustomersBranchBL()
        {
            newCustomersBranchRepo = new NewCustomersBranchRepo();
        }

        public NewCustomersBranchBL(INewCustomersBranchRepo newCustomersBranchRepo)
        {
            this.newCustomersBranchRepo = newCustomersBranchRepo;
        }

        public List<usp_NewCustomersBranch_Result> usp_NewCustomersBranch(DateTime? start, DateTime? end, int? companyRef, int? branchRef, int? timeType)
        {
            return newCustomersBranchRepo.usp_NewCustomersBranch(start, end, companyRef, branchRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    newCustomersBranchRepo.Dispose();
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