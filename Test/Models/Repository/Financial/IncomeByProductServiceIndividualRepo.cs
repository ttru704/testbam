using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Financial;
namespace Test.Models.Repository.Financial
{
    public class IncomeByProductServiceIndividualRepo : IDisposable, IIncomeByProductServiceIndividualRepo
    {
        private KPIEntities context = new KPIEntities();

        public IncomeByProductServiceIndividualRepo()
        {

        }

        List<usp_IncomeByProductServiceIndividual_Result> IIncomeByProductServiceIndividualRepo.usp_IncomeByProductServiceIndividual(DateTime? start, DateTime? end, int? companyRef, long? productNumnber, string productClass, int? timeType)
        {
            return context.usp_IncomeByProductServiceIndividual(start, end, companyRef, productNumnber, productClass, timeType).ToList();
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