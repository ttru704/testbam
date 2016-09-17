using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Productivity;
using Test.Models.Repository.Productivity;
namespace Test.BLL.Productivity
{
    public class AvgAnimalsSeenByEmployeeCompanyBL:IDisposable
    {
        private IAvgAnimalsSeenByEmployeeCompanyRepo avgAnimalsSeenByEmployeeCompanyRepo;

        public AvgAnimalsSeenByEmployeeCompanyBL()
        {
            avgAnimalsSeenByEmployeeCompanyRepo = new AvgAnimalsSeenByEmployeeCompanyRepo();
        }

        public AvgAnimalsSeenByEmployeeCompanyBL(IAvgAnimalsSeenByEmployeeCompanyRepo avgAnimalsSeenByEmployeeCompanyRepo)
        {
            this.avgAnimalsSeenByEmployeeCompanyRepo = avgAnimalsSeenByEmployeeCompanyRepo;
        }

        public List<usp_AvgAnimalsSeenByEmployeeCompany_Result> usp_AvgAnimalsSeenByEmployeeCompany(DateTime? start, DateTime? end, Int64? companyRef, int? timeType)
        {
            return avgAnimalsSeenByEmployeeCompanyRepo.usp_AvgAnimalsSeenByEmployeeCompany(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    avgAnimalsSeenByEmployeeCompanyRepo.Dispose();
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