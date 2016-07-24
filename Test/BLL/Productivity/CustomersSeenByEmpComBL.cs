using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Productivity;
using Test.Models.Repository.Productivity;

namespace Test.BLL.Productivity
{
    public class CustomersSeenByEmpComBL : IDisposable
    {
        private ICustomersSeenByEmpComRepo customersSeenByEmpComRepo;

        public CustomersSeenByEmpComBL()
        {
            customersSeenByEmpComRepo = new CustomersSeenByEmpComRepo();
        }

        public CustomersSeenByEmpComBL(ICustomersSeenByEmpComRepo customersSeenByEmpComRepo)
        {
            this.customersSeenByEmpComRepo = customersSeenByEmpComRepo;
        }

        public List<usp_CustomersSeenByEmpCom_Result> usp_CustomersSeenByEmpCom(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return customersSeenByEmpComRepo.usp_CustomersSeenByEmpCom(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    customersSeenByEmpComRepo.Dispose();
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