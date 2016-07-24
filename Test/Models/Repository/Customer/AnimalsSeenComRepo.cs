using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Customer;

namespace Test.Models.Repository.Customer
{
    public class AnimalsSeenComRepo: IDisposable, IAnimalsSeenComRepo
    {
        private KPIEntities context = new KPIEntities();

        public AnimalsSeenComRepo()
        {

        }

        List<usp_AnimalsSeenCom_Result> IAnimalsSeenComRepo.usp_AnimalsSeenCom(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return context.usp_AnimalsSeenCom(start, end, companyRef, timeType).ToList();
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