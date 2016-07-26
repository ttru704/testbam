using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Financial;

namespace Test.Models.Repository.Financial
{
    public class AvgDollarPerCustomerSingleRepo : IDisposable, IAvgDollarPerCustomerSingleRepo
    {
        private KPIEntities context = new KPIEntities();

        public AvgDollarPerCustomerSingleRepo()
        {

        }

        List<usp_AvgDollarPerCustomerSingle_Result> IAvgDollarPerCustomerSingleRepo.usp_AvgDollarPerCustomerSingle(DateTime start, DateTime end, int companyRef)
        {
            return context.usp_AvgDollarPerCustomerSingle(start, end, companyRef).ToList();
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