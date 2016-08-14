using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class LargeAnimalsCompanyBL
    {
        private ILargeAnimalsCompanyRepo largeAnimalsCompanyRepo;

        public LargeAnimalsCompanyBL()
        {
            largeAnimalsCompanyRepo = new LargeAnimalsCompanyRepo();
        }

        public LargeAnimalsCompanyBL(ILargeAnimalsCompanyRepo largeAnimalsCompanyRepo)
        {
            this.largeAnimalsCompanyRepo = largeAnimalsCompanyRepo;
        }

        public List<usp_LargeAnimalsCompany_Result> usp_LargeAnimalsCompany(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return largeAnimalsCompanyRepo.usp_LargeAnimalsCompany(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    largeAnimalsCompanyRepo.Dispose();
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