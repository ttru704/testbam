using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface;

namespace Test.Models.Repository
{
    public class IncomeProductCategoryRepository : IDisposable, IIncomeProductCategoryRepository
    {
        private KPIEntities context = new KPIEntities();

        public IncomeProductCategoryRepository()
        {

        }

        List<GetIncomeProductCategory_Result> IIncomeProductCategoryRepository.GetIncomeProductCategory(DateTime start, DateTime end, int branchRef, int timeType)
        {
            return context.GetIncomeProductCategory(start, end, branchRef, timeType).ToList();
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