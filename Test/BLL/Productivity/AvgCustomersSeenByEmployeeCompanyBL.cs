using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Productivity;
using Test.Models.Repository.Productivity;

namespace Test.BLL.Productivity
{
    public class AvgCustomersSeenByEmployeeCompanyBL: IDisposable
    {
        private IAvgCustomersSeenByEmployeeCompanyRepo avgCustomersSeenByEmployeeCompanyRepo;

        public AvgCustomersSeenByEmployeeCompanyBL()
        {
            avgCustomersSeenByEmployeeCompanyRepo = new AvgCustomersSeenByEmployeeCompanyRepo();
        }

        public AvgCustomersSeenByEmployeeCompanyBL(IAvgCustomersSeenByEmployeeCompanyRepo avgCustomersSeenByEmployeeCompanyRepo)
        {
            this.avgCustomersSeenByEmployeeCompanyRepo = avgCustomersSeenByEmployeeCompanyRepo;
        }

        public List<usp_AvgCustomersSeenByEmployeeCompany_Result> usp_AvgCustomersSeenByEmployeeCompany(DateTime? start, DateTime? end, int? companyRef, int? timeType)
        {
            return avgCustomersSeenByEmployeeCompanyRepo.usp_AvgCustomersSeenByEmployeeCompany(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    avgCustomersSeenByEmployeeCompanyRepo.Dispose();
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