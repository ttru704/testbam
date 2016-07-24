using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class AvgDollarPerCustomerComBL
    {
        private IAvgDollarPerCustomerComRepo avgDollarPerCustomerComRepo;

        public AvgDollarPerCustomerComBL()
        {
            avgDollarPerCustomerComRepo = new AvgDollarPerCustomerComRepo();
        }

        public AvgDollarPerCustomerComBL(IAvgDollarPerCustomerComRepo avgDollarPerCustomerComRepo)
        {
            this.avgDollarPerCustomerComRepo = avgDollarPerCustomerComRepo;
        }

        public List<usp_AvgDollarPerCustomerCom_Result> usp_AvgDollarPerCustomerCom(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return avgDollarPerCustomerComRepo.usp_AvgDollarPerCustomerCom(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    avgDollarPerCustomerComRepo.Dispose();
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