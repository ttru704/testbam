using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class IncomeByProductServiceIndividualBL : IDisposable
    {
        private IIncomeByProductServiceIndividualRepo IncomeByProductServiceIndividualRepo;

        public IncomeByProductServiceIndividualBL()
        {
            IncomeByProductServiceIndividualRepo = new IncomeByProductServiceIndividualRepo();
        }

        public IncomeByProductServiceIndividualBL(IIncomeByProductServiceIndividualRepo IncomeByProductServiceIndividualRepo)
        {
            this.IncomeByProductServiceIndividualRepo = IncomeByProductServiceIndividualRepo;
        }

        public List<usp_IncomeByProductServiceIndividual_Result> usp_IncomeByProductServiceIndividual(DateTime? start, DateTime? end, int? companyRef, long? productNumnber, string productClass, int? timeType)
        {
            return IncomeByProductServiceIndividualRepo.usp_IncomeByProductServiceIndividual(start, end, companyRef, productNumnber, productClass, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    IncomeByProductServiceIndividualRepo.Dispose();
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