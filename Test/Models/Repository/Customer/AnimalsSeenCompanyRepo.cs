using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Customer;

namespace Test.Models.Repository.Customer
{
    public class AnimalsSeenCompanyRepo: IDisposable, IAnimalsSeenCompanyRepo
    {
        private KPIEntities context = new KPIEntities();

        public AnimalsSeenCompanyRepo()
        {

        }

        List<usp_AnimalsSeenCompany_Result> IAnimalsSeenCompanyRepo.usp_AnimalsSeenCompany(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return context.usp_AnimalsSeenCompany(start, end, companyRef, timeType).ToList();
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