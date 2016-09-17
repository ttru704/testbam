using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Financial;

namespace Test.Models.Repository.Financial
{
    public class IncomeByProductCategoryCompanyRepo: IDisposable, IIncomeByProductCategoryCompanyRepo
    {
        private KPIEntities context = new KPIEntities();

        public IncomeByProductCategoryCompanyRepo()
        {

        }

        List<usp_IncomeByProductCategoryCompany_Result> IIncomeByProductCategoryCompanyRepo.usp_IncomeByProductCategoryCompany(DateTime start, DateTime end, long companyRef)
        {
            return context.usp_IncomeByProductCategoryCompany(start, end, companyRef).ToList();
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