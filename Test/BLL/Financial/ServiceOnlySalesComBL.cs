using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class ServiceOnlySalesComBL
    {
        private IServiceOnlySalesComRepo serviceOnlySalesComRepo;

        public ServiceOnlySalesComBL()
        {
            serviceOnlySalesComRepo = new ServiceOnlySalesComRepo();
        }

        public ServiceOnlySalesComBL(IServiceOnlySalesComRepo serviceOnlySalesComRepo)
        {
            this.serviceOnlySalesComRepo = serviceOnlySalesComRepo;
        }

        public List<usp_ServiceOnlySalesCom_Result> usp_ServiceOnlySalesCom(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return serviceOnlySalesComRepo.usp_ServiceOnlySalesCom(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    serviceOnlySalesComRepo.Dispose();
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