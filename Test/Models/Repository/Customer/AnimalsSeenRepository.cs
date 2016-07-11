using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Customer;

namespace Test.Models.Repository.Customer
{
    public class AnimalsSeenRepository : IDisposable, IAnimalsSeenRepository
    {
        private KPIEntities context = new KPIEntities();

        public AnimalsSeenRepository()
        {

        }

        List<AnimalsSeenBComparison_Result> IAnimalsSeenRepository.AnimalsSeenBComparison(DateTime start, DateTime end, int branchRef, int timeType)
        {
            return context.AnimalsSeenBComparison(start, end, branchRef, timeType).ToList();
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