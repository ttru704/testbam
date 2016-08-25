using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class AvgDollarPerCustomerPeerBL
    {
        private IAvgDollarPerCustomerPeerRepo avgDollarPerCustomerPeerRepo;

        public AvgDollarPerCustomerPeerBL()
        {
            avgDollarPerCustomerPeerRepo = new AvgDollarPerCustomerPeerRepo();
        }

        public AvgDollarPerCustomerPeerBL(IAvgDollarPerCustomerPeerRepo avgDollarPerCustomerPeerRepo)
        {
            this.avgDollarPerCustomerPeerRepo = avgDollarPerCustomerPeerRepo;
        }

        public List<usp_AvgDollarPerCustomerPeer_Result> usp_AvgDollarPerCustomerPeer(DateTime? start, DateTime? end, int? branchRef, int? size, int? timeType, int? country, int? state, int? region)
        {
            return avgDollarPerCustomerPeerRepo.usp_AvgDollarPerCustomerPeer(start, end, branchRef, size, timeType, country, state, region);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    avgDollarPerCustomerPeerRepo.Dispose();
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