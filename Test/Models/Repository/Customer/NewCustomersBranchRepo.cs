using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Customer;

namespace Test.Models.Repository.Customer
{
    public class NewCustomersBranchRepo: IDisposable, INewCustomersBranchRepo
    {
        private KPIEntities context = new KPIEntities();

        public NewCustomersBranchRepo()
        {

        }

        List<usp_NewCustomersBranch_Result> INewCustomersBranchRepo.usp_NewCustomersBranch(DateTime start, DateTime end, int companyRef, int branchRef, int timeType)
        {
            return context.usp_NewCustomersBranch(start, end, companyRef, branchRef, timeType).ToList();
        }

        private bool disposedValue = false; // To detect redundant calls

        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    context.Dispose();
                }
                disposedValue = true;
            }
        }

        void IDisposable.Dispose()
        {
            // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}