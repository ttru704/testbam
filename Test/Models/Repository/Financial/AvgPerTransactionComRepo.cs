using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Financial;

namespace Test.Models.Repository.Financial
{
    public class AvgPerTransactionComRepo: IDisposable, IAvgPerTransactionComRepo
    {
        private KPIEntities context = new KPIEntities();

        public AvgPerTransactionComRepo()
        {

        }

        List<usp_AvgPerTransactionCom_Result> IAvgPerTransactionComRepo.usp_AvgPerTransactionCom(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return context.usp_AvgPerTransactionCom(start, end, companyRef, timeType).ToList();
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