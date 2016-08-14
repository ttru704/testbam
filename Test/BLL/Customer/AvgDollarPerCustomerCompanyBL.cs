using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class AvgDollarPerCustomerCompanyBL
    {
        private IAvgDollarPerCustomerCompanyRepo avgDollarPerCustomerCompanyRepo;

        public AvgDollarPerCustomerCompanyBL()
        {
            avgDollarPerCustomerCompanyRepo = new AvgDollarPerCustomerCompanyRepo();
        }

        public AvgDollarPerCustomerCompanyBL(IAvgDollarPerCustomerCompanyRepo avgDollarPerCustomerCompanyRepo)
        {
            this.avgDollarPerCustomerCompanyRepo = avgDollarPerCustomerCompanyRepo;
        }

        public List<usp_AvgDollarPerCustomerCompany_Result> usp_AvgDollarPerCustomerCompany(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return avgDollarPerCustomerCompanyRepo.usp_AvgDollarPerCustomerCompany(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    avgDollarPerCustomerCompanyRepo.Dispose();
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