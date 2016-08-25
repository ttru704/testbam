using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class ServiceOnlySalesBranchBL : IDisposable
    {
        private IServiceOnlySalesBranchRepo serviceOnlySalesBranchRepo;

        public ServiceOnlySalesBranchBL()
        {
            serviceOnlySalesBranchRepo = new ServiceOnlySalesBranchRepo();
        }

        public ServiceOnlySalesBranchBL(IServiceOnlySalesBranchRepo serviceOnlySalesBranchRepo)
        {
            this.serviceOnlySalesBranchRepo = serviceOnlySalesBranchRepo;
        }

        public List<usp_ServiceOnlySalesBranch_Result> usp_ServiceOnlySalesBranch(DateTime? start, DateTime? end, int? companyRef, int? branchRef, int? timeType)
        {
            return serviceOnlySalesBranchRepo.usp_ServiceOnlySalesBranch(start, end, companyRef, branchRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    serviceOnlySalesBranchRepo.Dispose();
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