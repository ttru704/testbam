using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Financial;
namespace Test.Models.Repository.Financial
{
    public class IncomeByProductIndividualRepo : IDisposable, IIncomeByProductIndividualRepo
    {
        private KPIEntities context = new KPIEntities();

        public IncomeByProductIndividualRepo()
        {

        }

        List<usp_IncomeByProductIndividual_Result> IIncomeByProductIndividualRepo.usp_IncomeByProductIndividual(DateTime? start, DateTime? end, Int64? companyRef, long? productNumnber, int? timeType)
        {
            return context.usp_IncomeByProductIndividual(start, end, companyRef, productNumnber, timeType).ToList();
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