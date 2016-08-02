using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Customer;

namespace Test.Models.Repository.Customer
{
    public class LargeAnimalsComRepo: IDisposable, ILargeAnimalsComRepo
    {
        private KPIEntities context = new KPIEntities();

        public LargeAnimalsComRepo()
        {

        }

        List<usp_LargeAnimalsCom_Result> ILargeAnimalsComRepo.usp_LargeAnimalsCom(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return context.usp_LargeAnimalsCom(start, end, companyRef, timeType).ToList();
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