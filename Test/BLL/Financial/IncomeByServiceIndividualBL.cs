using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class IncomeByServiceIndividualBL : IDisposable
    {
        private IIncomeByServiceIndividualRepo IncomeByServiceIndividualRepo;

        public IncomeByServiceIndividualBL()
        {
            IncomeByServiceIndividualRepo = new IncomeByServiceIndividualRepo();
        }

        public IncomeByServiceIndividualBL(IIncomeByServiceIndividualRepo IncomeByServiceIndividualRepo)
        {
            this.IncomeByServiceIndividualRepo = IncomeByServiceIndividualRepo;
        }

        public List<usp_IncomeByServiceIndividual_Result> usp_IncomeByServiceIndividual_Result(DateTime? start, DateTime? end, Int64? companyRef, long? productNumnber, int? timeType)
        {
            return IncomeByServiceIndividualRepo.usp_IncomeByServiceIndividual(start, end, companyRef, productNumnber, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    IncomeByServiceIndividualRepo.Dispose();
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