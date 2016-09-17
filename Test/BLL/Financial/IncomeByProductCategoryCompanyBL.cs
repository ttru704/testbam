using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class IncomeByProductCategoryCompanyBL: IDisposable
    {
        private IIncomeByProductCategoryCompanyRepo IncomeByProductCategoryCompanyRepo;

        public IncomeByProductCategoryCompanyBL()
        {
            IncomeByProductCategoryCompanyRepo = new IncomeByProductCategoryCompanyRepo();
        }

        public IncomeByProductCategoryCompanyBL(IncomeByProductCategoryCompanyRepo IncomeByProductCategoryCompanyRepo)
        {
            this.IncomeByProductCategoryCompanyRepo = IncomeByProductCategoryCompanyRepo;
        }

        public List<usp_IncomeByProductCategoryCompany_Result> usp_IncomeByProductCategoryCompany(DateTime start, DateTime end, long companyRef)
        {
            return IncomeByProductCategoryCompanyRepo.usp_IncomeByProductCategoryCompany(start, end, companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    IncomeByProductCategoryCompanyRepo.Dispose();
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