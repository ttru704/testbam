using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class NewClientsBranchBL
    {
        private INewClientsBranchRepo newClientsBranchRepo;

        public NewClientsBranchBL()
        {
            newClientsBranchRepo = new NewClientsBranchRepo();
        }

        public NewClientsBranchBL(INewClientsBranchRepo newClientsBranchRepo)
        {
            this.newClientsBranchRepo = newClientsBranchRepo;
        }

        public List<usp_NewClientsBranch_Result> usp_NewClientsBranch(DateTime start, DateTime end, int companyRef, int branchRef, int timeType)
        {
            return newClientsBranchRepo.usp_NewClientsBranch(start, end, companyRef, branchRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    newClientsBranchRepo.Dispose();
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