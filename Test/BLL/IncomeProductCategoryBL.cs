using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface;
using Test.Models.Repository;

namespace Test.BLL
{
    public class IncomeProductCategoryBL : IDisposable
    {
        private IIncomeProductCategoryRepository incomeProductCategoryRepository;

        public IncomeProductCategoryBL()
        {
            incomeProductCategoryRepository = new IncomeProductCategoryRepository();
        }

        public IncomeProductCategoryBL(IIncomeProductCategoryRepository incomeProductCategoryRepository)
        {
            this.incomeProductCategoryRepository = incomeProductCategoryRepository;
        }

        public List<GetIncomeProductCategory_Result> GetIncomeProductCategory(DateTime start, DateTime end, int branchRef, int timeType)
        {
            return incomeProductCategoryRepository.GetIncomeProductCategory(start, end, branchRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    incomeProductCategoryRepository.Dispose();
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