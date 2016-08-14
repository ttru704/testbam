using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Productivity;

namespace Test.Models.Repository.Productivity
{
    public class AnimalsSeenIndustryRepo : IDisposable, IAnimalsSeenIndustryRepo
    {
        private KPIEntities context = new KPIEntities();

        public AnimalsSeenIndustryRepo()
        {

        }

        List<usp_AnimalsSeenIndustry_Result> IAnimalsSeenIndustryRepo.usp_AnimalsSeenIndustry(DateTime start, DateTime end, int companyRef, int size, int timeType)
        {
            return context.usp_AnimalsSeenIndustry(start, end, companyRef, size, timeType).ToList();
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