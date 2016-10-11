using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Customer;

namespace Test.Models.Repository.Customer
{
    public class AvgDollarPerCustomerPeerGridRepo : IDisposable, IAvgDollarPerCustomerPeerGridRepo
    {
        private KPIEntities context = new KPIEntities();

        public AvgDollarPerCustomerPeerGridRepo()
        {

        }

        List<usp_AvgDollarPerCustomerPeerGrid_Result> IAvgDollarPerCustomerPeerGridRepo.usp_AvgDollarPerCustomerPeerGrid(DateTime? start, DateTime? end, long? company, long? branchRef, long? branchType, int? timeType, long? country, long? state, long? region)
        {
            return context.usp_AvgDollarPerCustomerPeerGrid(start, end, company, branchRef, branchType, timeType, country, state, region).ToList();
        }

        private bool disposedValue = false; // To detect redundant calls

        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    context.Dispose();
                }
                disposedValue = true;
            }
        }

        void IDisposable.Dispose()
        {
            // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}