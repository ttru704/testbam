using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class NewCustomersChangesBL : IDisposable
    {
        private INewCustomersChangesRepo newCustomersChangesRepo;

        public NewCustomersChangesBL()
        {
            newCustomersChangesRepo = new NewCustomersChangesRepo();
        }

        public NewCustomersChangesBL(INewCustomersChangesRepo newCustomersChangesRepo)
        {
            this.newCustomersChangesRepo = newCustomersChangesRepo;
        }

        public double? usp_NewCustomersChanges(Int64? companyRef)
        {
            return newCustomersChangesRepo.usp_NewCustomersChanges(companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    newCustomersChangesRepo.Dispose();
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