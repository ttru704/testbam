using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Financial;

namespace Test.Models.Repository.Financial
{
    public class AvgDollarPerCustomerRepository : IDisposable, IAvgDollarPerCustomerRepository
    {
        private KPIEntities context = new KPIEntities();

        public AvgDollarPerCustomerRepository()
        {

        }

        List<AvgDollarPerCustomer_Result> IAvgDollarPerCustomerRepository.AvgDollarPerCustomer(DateTime start, DateTime end, int branchRef, int timeType)
        {
            return context.AvgDollarPerCustomer(start, end, branchRef, timeType).ToList();
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