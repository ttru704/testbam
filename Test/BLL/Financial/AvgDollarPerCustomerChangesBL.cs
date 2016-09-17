using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class AvgDollarPerCustomerChangesBL : IDisposable
    {
        private IAvgDollarPerCustomerChangesRepo avgDollarPerCustomerChangesRepo;

        public AvgDollarPerCustomerChangesBL()
        {
            avgDollarPerCustomerChangesRepo = new AvgDollarPerCustomerChangesRepo();
        }

        public AvgDollarPerCustomerChangesBL(IAvgDollarPerCustomerChangesRepo avgDollarPerCustomerChangesRepo)
        {
            this.avgDollarPerCustomerChangesRepo = avgDollarPerCustomerChangesRepo;
        }

        public double? usp_AvgDollarPerCustomerChanges(Int64? companyRef)
        {
            return avgDollarPerCustomerChangesRepo.usp_AvgDollarPerCustomerChanges(companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    avgDollarPerCustomerChangesRepo.Dispose();
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