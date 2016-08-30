using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Productivity;
using Test.Models.Repository.Productivity;

namespace Test.BLL.Productivity
{
    public class IncomeByEmployeeIndividualBL :IDisposable
    {
        private IIncomeByEmployeeIndividualRepo incomeByEmployeeIndividualRepo;

        public IncomeByEmployeeIndividualBL()
        {
            incomeByEmployeeIndividualRepo = new IncomeByEmployeeIndividualRepo();
        }

        public IncomeByEmployeeIndividualBL(IIncomeByEmployeeIndividualRepo incomeByEmployeeIndividualRepo)
        {
            this.incomeByEmployeeIndividualRepo = incomeByEmployeeIndividualRepo;
        }

        public List<usp_IncomeByEmployeeIndividual_Result> usp_IncomeByEmployeeIndividual(DateTime? start, DateTime? end, int? companyRef, long? staffNumber, int? timeType)
        {
            return incomeByEmployeeIndividualRepo.usp_IncomeByEmployeeIndividual(start, end, companyRef, staffNumber, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    incomeByEmployeeIndividualRepo.Dispose();
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