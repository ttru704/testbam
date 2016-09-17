using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Productivity;
using Test.Models.Repository.Productivity;

namespace Test.BLL.Productivity
{
    public class IncomeFromAnimalTypeEmployeeIndividualBL: IDisposable
    {
        private IIncomeFromAnimalTypeEmployeeIndividualRepo incomeFromAnimalTypeEmployeeIndividualRepo;

        public IncomeFromAnimalTypeEmployeeIndividualBL()
        {
            incomeFromAnimalTypeEmployeeIndividualRepo = new IncomeFromAnimalTypeEmployeeIndividualRepo();
        }

        public IncomeFromAnimalTypeEmployeeIndividualBL(IIncomeFromAnimalTypeEmployeeIndividualRepo incomeFromAnimalTypeEmployeeIndividualRepo)
        {
            this.incomeFromAnimalTypeEmployeeIndividualRepo = incomeFromAnimalTypeEmployeeIndividualRepo;
        }

        public List<usp_IncomeFromAnimalTypeEmployeeIndividual_Result> usp_IncomeFromAnimalTypeEmployeeIndividual(DateTime? start, DateTime? end, Int64? companyRef, long? staffNumber, int? timeType)
        {
            return incomeFromAnimalTypeEmployeeIndividualRepo.usp_IncomeFromAnimalTypeEmployeeIndividual(start, end, companyRef, staffNumber, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    incomeFromAnimalTypeEmployeeIndividualRepo.Dispose();
                }
            }
            this.disposedValue = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}