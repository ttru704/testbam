using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface;

namespace Test.Models.Repository
{
    public class NumberOfNewClientsRespository : IDisposable, INumberOfNewClientsRepository
    {
        private KPIEntities context = new KPIEntities();
        public NumberOfNewClientsRespository()
        { }
        List<GetNumberOfNewClients_Result> INumberOfNewClientsRepository.GetNumberOfNewClients(DateTime start, DateTime end, int branchRef, int TimeType)
        {
            return context.GetNumberOfNewClients(start, end, branchRef, TimeType).ToList();
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