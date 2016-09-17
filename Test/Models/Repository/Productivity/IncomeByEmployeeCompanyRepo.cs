using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Productivity;

namespace Test.Models.Repository.Productivity
{
    public class IncomeByEmployeeCompanyRepo:IDisposable, IIncomeByEmployeeCompanyRepo
    {
        private KPIEntities context = new KPIEntities();

        public IncomeByEmployeeCompanyRepo()
        {

        }

        List<usp_IncomeByEmployeeCompany_Result> IIncomeByEmployeeCompanyRepo.usp_IncomeByEmployeeCompany(DateTime? start, DateTime? end, Int64? companyRef, int? timeType)
        {
            return context.usp_IncomeByEmployeeCompany(start, end, companyRef, timeType).ToList();
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