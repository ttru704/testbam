using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class IncomeByServiceActivityCompanyBL : IDisposable
    {
        private IIncomeByServiceActivityCompanyRepo IncomeByServiceActivityCompanyRepo;

        public IncomeByServiceActivityCompanyBL()
        {
            IncomeByServiceActivityCompanyRepo = new IncomeByServiceActivityCompanyRepo();
        }

        public IncomeByServiceActivityCompanyBL(IncomeByServiceActivityCompanyRepo IncomeByServiceActivityCompanyRepo)
        {
            this.IncomeByServiceActivityCompanyRepo = IncomeByServiceActivityCompanyRepo;
        }

        public List<usp_IncomeByServiceActivityCompany_Result> usp_IncomeByServiceActivityCompany(DateTime start, DateTime end, long companyRef)
        {
            return IncomeByServiceActivityCompanyRepo.usp_IncomeByServiceActivityCompany(start, end, companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    IncomeByServiceActivityCompanyRepo.Dispose();
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