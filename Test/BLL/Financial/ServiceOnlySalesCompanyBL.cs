using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class ServiceOnlySalesCompanyBL : IDisposable
    {
        private IServiceOnlySalesCompanyRepo serviceOnlySalesCompanyRepo;

        public ServiceOnlySalesCompanyBL()
        {
            serviceOnlySalesCompanyRepo = new ServiceOnlySalesCompanyRepo();
        }

        public ServiceOnlySalesCompanyBL(IServiceOnlySalesCompanyRepo serviceOnlySalesCompanyRepo)
        {
            this.serviceOnlySalesCompanyRepo = serviceOnlySalesCompanyRepo;
        }

        public List<usp_ServiceOnlySalesCompany_Result> usp_ServiceOnlySalesCompany(DateTime? start, DateTime? end, long companyRef, int timeType)
        {
            return serviceOnlySalesCompanyRepo.usp_ServiceOnlySalesCompany(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    serviceOnlySalesCompanyRepo.Dispose();
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