using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Productivity;

namespace Test.Models.Repository.Productivity
{
    public class IncomeFromAnimalTypeEmployeeIndividualRepo : IDisposable, IIncomeFromAnimalTypeEmployeeIndividualRepo
    {
        private KPIEntities context = new KPIEntities();

        public IncomeFromAnimalTypeEmployeeIndividualRepo()
        {

        }

        List<usp_IncomeFromAnimalTypeEmployeeIndividual_Result> IIncomeFromAnimalTypeEmployeeIndividualRepo.usp_IncomeFromAnimalTypeEmployeeIndividual(DateTime? start, DateTime? end, int? companyRef, long? staffNumber, int? timeType)
        {
            return context.usp_IncomeFromAnimalTypeEmployeeIndividual(start, end, companyRef, staffNumber, timeType).ToList();
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