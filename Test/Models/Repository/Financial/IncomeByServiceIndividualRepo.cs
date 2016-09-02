using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Financial;
namespace Test.Models.Repository.Financial
{
    public class IncomeByServiceIndividualRepo:IDisposable, IIncomeByServiceIndividualRepo
    {
        private KPIEntities context = new KPIEntities();

        public IncomeByServiceIndividualRepo()
        {

        }

        List<usp_IncomeByServiceIndividual_Result> IIncomeByServiceIndividualRepo.usp_IncomeByServiceIndividual(DateTime? start, DateTime? end, int? companyRef, long? productNumnber, int? timeType)
        {
            return context.usp_IncomeByServiceIndividual(start, end, companyRef, productNumnber, timeType).ToList();
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