using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class UniqueCustomersSeenCompanyBL
    {
        private IUniqueCustomersSeenCompanyRepo uniqueCustomersSeenCompanyRepo;

        public UniqueCustomersSeenCompanyBL()
        {
            uniqueCustomersSeenCompanyRepo = new UniqueCustomersSeenCompanyRepo();
        }

        public UniqueCustomersSeenCompanyBL(IUniqueCustomersSeenCompanyRepo uniqueCustomersSeenCompanyRepo)
        {
            this.uniqueCustomersSeenCompanyRepo = uniqueCustomersSeenCompanyRepo;
        }

        public List<usp_UniqueCustomersSeenCompany_Result> usp_UniqueCustomersSeenCompany(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return uniqueCustomersSeenCompanyRepo.usp_UniqueCustomersSeenCompany(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    uniqueCustomersSeenCompanyRepo.Dispose();
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