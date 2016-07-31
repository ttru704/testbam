using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Financial;

namespace Test.Models.Repository.Financial
{
    public class ServiceOnlySalesComRepo : IDisposable, IServiceOnlySalesComRepo
    {
        private KPIEntities context = new KPIEntities();

        public ServiceOnlySalesComRepo()
        {

        }

        List<usp_ServiceOnlySalesCom_Result> IServiceOnlySalesComRepo.usp_ServiceOnlySalesCom(DateTime? start, DateTime? end, int companyRef, int timeType)
        {
            return context.usp_ServiceOnlySalesCom(start, end, companyRef, timeType).ToList();
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