using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Customer;

namespace Test.Models.Repository.Customer
{
    public class SmallAnimalsBranchRepo : IDisposable, ISmallAnimalsBranchRepo
    {
        private KPIEntities context = new KPIEntities();

        public SmallAnimalsBranchRepo()
        {

        }

        List<usp_SmallAnimalsBranch_Result> ISmallAnimalsBranchRepo.usp_SmallAnimalsBranch(DateTime start, DateTime end, int companyRef, int branchRef, int timeType)
        {
            return context.usp_SmallAnimalsBranch(start, end, companyRef, branchRef, timeType).ToList();
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