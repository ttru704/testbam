using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class IncomeByProductCategoryComBL: IDisposable
    {
        private IIncomeByProductCategoryComRepo IncomeByProductCategoryComRepo;

        public IncomeByProductCategoryComBL()
        {
            IncomeByProductCategoryComRepo = new IncomeByProductCategoryComRepo();
        }

        public IncomeByProductCategoryComBL(IncomeByProductCategoryComRepo IncomeByProductCategoryComRepo)
        {
            this.IncomeByProductCategoryComRepo = IncomeByProductCategoryComRepo;
        }

        public List<usp_IncomeByProductCategoryCom_Result> usp_IncomeByProductCategoryCom(DateTime start, DateTime end, int companyRef)
        {
            return IncomeByProductCategoryComRepo.usp_IncomeByProductCategoryCom(start, end, companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    IncomeByProductCategoryComRepo.Dispose();
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