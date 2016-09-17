using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class NewCustomersSingleBL : IDisposable
    {
        private INewCustomersSingleRepo newCustomersSingleRepo;

        public NewCustomersSingleBL()
        {
            newCustomersSingleRepo = new NewCustomersSingleRepo();
        }

        public NewCustomersSingleBL(INewCustomersSingleRepo newCustomersSingleRepo)
        {
            this.newCustomersSingleRepo = newCustomersSingleRepo;
        }

        public double? usp_NewCustomersSingle(Int64? companyRef)
        {
            return newCustomersSingleRepo.usp_NewCustomersSingle(companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    newCustomersSingleRepo.Dispose();
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