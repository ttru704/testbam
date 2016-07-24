using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Financial;

namespace Test.Models.Repository.Financial
{
    public class TotalSalesComRepo : IDisposable, ITotalSalesComRepo
    {
        private KPIEntities context = new KPIEntities();

        public TotalSalesComRepo()
        {

        }

        List<usp_TotalSalesCom_Result> ITotalSalesComRepo.usp_TotalSalesCom(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return context.usp_TotalSalesCom(start, end, companyRef, timeType).ToList();
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