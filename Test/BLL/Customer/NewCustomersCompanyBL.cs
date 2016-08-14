using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class NewCustomersCompanyBL
    {
        private INewCustomersCompanyRepo newCustomersCompanyRepo;

        public NewCustomersCompanyBL()
        {
            newCustomersCompanyRepo = new NewCustomersCompanyRepo();
        }

        public NewCustomersCompanyBL(INewCustomersCompanyRepo newCustomersCompanyRepo)
        {
            this.newCustomersCompanyRepo = newCustomersCompanyRepo;
        }

        public List<usp_NewCustomersCompany_Result> usp_NewCustomersCompany(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return newCustomersCompanyRepo.usp_NewCustomersCompany(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    newCustomersCompanyRepo.Dispose();
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