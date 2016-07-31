using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class NewCustomersComBL
    {
        private INewCustomersComRepo newCustomersComRepo;

        public NewCustomersComBL()
        {
            newCustomersComRepo = new NewCustomersComRepo();
        }

        public NewCustomersComBL(INewCustomersComRepo newCustomersComRepo)
        {
            this.newCustomersComRepo = newCustomersComRepo;
        }

        public List<usp_NewCustomersCom_Result> usp_NewCustomersCom(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return newCustomersComRepo.usp_NewCustomersCom(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    newCustomersComRepo.Dispose();
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