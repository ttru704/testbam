using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Customer;

namespace Test.Models.Repository.Customer
{
    public class AnimalsSeenChangesRepo : IDisposable, IAnimalsSeenChangesRepo
    {
        private KPIEntities context = new KPIEntities();

        public AnimalsSeenChangesRepo()
        {

        }

        double? IAnimalsSeenChangesRepo.usp_AnimalsSeenChanges(Int64? companyRef)
        {
            return context.usp_AnimalsSeenChanges(companyRef).SingleOrDefault();
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