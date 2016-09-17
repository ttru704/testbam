using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class IncomeByProductIndividualBL : IDisposable
    {
        private IIncomeByProductIndividualRepo IncomeByProductIndividualRepo;

        public IncomeByProductIndividualBL()
        {
            IncomeByProductIndividualRepo = new IncomeByProductIndividualRepo();
        }

        public IncomeByProductIndividualBL(IIncomeByProductIndividualRepo IncomeByProductIndividualRepo)
        {
            this.IncomeByProductIndividualRepo = IncomeByProductIndividualRepo;
        }

        public List<usp_IncomeByProductIndividual_Result> usp_IncomeByProductIndividual_Result(DateTime? start, DateTime? end, Int64? companyRef, long? productNumnber, int? timeType)
        {
            return IncomeByProductIndividualRepo.usp_IncomeByProductIndividual(start, end, companyRef, productNumnber, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    IncomeByProductIndividualRepo.Dispose();
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