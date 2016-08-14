using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class SmallAnimalsCompanyBL
    {
        private ISmallAnimalsCompanyRepo smallAnimalsCompanyRepo;

        public SmallAnimalsCompanyBL()
        {
            smallAnimalsCompanyRepo = new SmallAnimalsCompanyRepo();
        }

        public SmallAnimalsCompanyBL(ISmallAnimalsCompanyRepo smallAnimalsCompanyRepo)
        {
            this.smallAnimalsCompanyRepo = smallAnimalsCompanyRepo;
        }

        public List<usp_SmallAnimalsCompany_Result> usp_SmallAnimalsCompany(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return smallAnimalsCompanyRepo.usp_SmallAnimalsCompany(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    smallAnimalsCompanyRepo.Dispose();
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