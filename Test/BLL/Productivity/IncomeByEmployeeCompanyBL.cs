using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Productivity;
using Test.Models.Repository.Productivity;

namespace Test.BLL.Productivity
{
    public class IncomeByEmployeeCompanyBL: IDisposable
    {
        private IIncomeByEmployeeCompanyRepo incomeByEmployeeCompanyRepo;

        public IncomeByEmployeeCompanyBL()
        {
            incomeByEmployeeCompanyRepo = new IncomeByEmployeeCompanyRepo();
        }

        public IncomeByEmployeeCompanyBL(IIncomeByEmployeeCompanyRepo incomeByEmployeeCompanyRepo)
        {
            this.incomeByEmployeeCompanyRepo = incomeByEmployeeCompanyRepo;
        }

        public List<usp_IncomeByEmployeeCompany_Result> usp_IncomeByEmployeeCompany(DateTime? start, DateTime? end, Int64? companyRef, int? timeType)
        {
            return incomeByEmployeeCompanyRepo.usp_IncomeByEmployeeCompany(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    incomeByEmployeeCompanyRepo.Dispose();
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