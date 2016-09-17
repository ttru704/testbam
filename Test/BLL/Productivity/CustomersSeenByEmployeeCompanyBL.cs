using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Productivity;
using Test.Models.Repository.Productivity;

namespace Test.BLL.Productivity
{
    public class CustomersSeenByEmployeeCompanyBL : IDisposable
    {
        private ICustomersSeenByEmployeeCompanyRepo customersSeenByEmployeeCompanyRepo;

        public CustomersSeenByEmployeeCompanyBL()
        {
            customersSeenByEmployeeCompanyRepo = new CustomersSeenByEmployeeCompanyRepo();
        }

        public CustomersSeenByEmployeeCompanyBL(ICustomersSeenByEmployeeCompanyRepo customersSeenByEmployeeCompanyRepo)
        {
            this.customersSeenByEmployeeCompanyRepo = customersSeenByEmployeeCompanyRepo;
        }

        public List<usp_CustomersSeenByEmployeeCompany_Result> usp_CustomersSeenByEmployeeCompany(DateTime? start, DateTime? end, Int64? companyRef, int? timeType)
        {
            return customersSeenByEmployeeCompanyRepo.usp_CustomersSeenByEmployeeCompany(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    customersSeenByEmployeeCompanyRepo.Dispose();
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