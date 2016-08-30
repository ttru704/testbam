using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Productivity;

namespace Test.Models.Repository.Productivity
{
    public class AnimalsSeenByEmployeeIndividualRepo : IDisposable, IAnimalsSeenByEmployeeIndividualRepo
    {
        private KPIEntities context = new KPIEntities();

        public AnimalsSeenByEmployeeIndividualRepo()
        {

        }

        List<usp_AnimalsSeenByEmployeeIndividual_Result> IAnimalsSeenByEmployeeIndividualRepo.usp_AnimalsSeenByEmployeeIndividual(DateTime? start, DateTime? end, int? companyRef, long? staffNumber, int? timeType)
        {
            return context.usp_AnimalsSeenByEmployeeIndividual(start, end, companyRef, staffNumber, timeType).ToList();
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