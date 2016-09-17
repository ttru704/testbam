using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class AvgDollarPerCustomerSingleBL : IDisposable
    {
        private IAvgDollarPerCustomerSingleRepo avgDollarPerCustomerSingleRepo;

        public AvgDollarPerCustomerSingleBL()
        {
            avgDollarPerCustomerSingleRepo = new AvgDollarPerCustomerSingleRepo();
        }

        public AvgDollarPerCustomerSingleBL(IAvgDollarPerCustomerSingleRepo avgDollarPerCustomerSingleRepo)
        {
            this.avgDollarPerCustomerSingleRepo = avgDollarPerCustomerSingleRepo;
        }

        public double? usp_AvgDollarPerCustomerSingle(Int64? companyRef)
        {
            return avgDollarPerCustomerSingleRepo.usp_AvgDollarPerCustomerSingle(companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    avgDollarPerCustomerSingleRepo.Dispose();
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