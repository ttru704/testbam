using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class AvgDollarPerCustomerPeerGridBL : IDisposable
    {
        private IAvgDollarPerCustomerPeerGridRepo avgDollarPerCustomerPeerGridRepo;

        public AvgDollarPerCustomerPeerGridBL()
        {
            avgDollarPerCustomerPeerGridRepo = new AvgDollarPerCustomerPeerGridRepo();
        }

        public AvgDollarPerCustomerPeerGridBL(IAvgDollarPerCustomerPeerGridRepo avgDollarPerCustomerPeerGridRepo)
        {
            this.avgDollarPerCustomerPeerGridRepo = avgDollarPerCustomerPeerGridRepo;
        }

        public List<usp_AvgDollarPerCustomerPeerGrid_Result> usp_AvgDollarPerCustomerPeerGrid(DateTime? start, DateTime? end, long? company, long? branchRef, long? branchType, int? timeType, long? country, long? state, long? region)
        {
            return avgDollarPerCustomerPeerGridRepo.usp_AvgDollarPerCustomerPeerGrid(start, end, company, branchRef, branchType, timeType, country, state, region);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    avgDollarPerCustomerPeerGridRepo.Dispose();
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