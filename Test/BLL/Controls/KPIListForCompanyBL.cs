using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Controls;
using Test.Models.Repository.Controls;

namespace Test.BLL.Controls
{
    public class KPIListForCompanyBL : IDisposable
    {
        private IKPIListForCompanyRepo KPIListForCompanyRepo;

        public KPIListForCompanyBL()
        {
            KPIListForCompanyRepo = new KPIListForCompanyRepo();
        }

        public KPIListForCompanyBL(IKPIListForCompanyRepo KPIListForCompanyRepo)
        {
            this.KPIListForCompanyRepo = KPIListForCompanyRepo;
        }

        public List<usp_KPIListForCompany_Result> usp_KPIListForCompany(long companyRef, long businessType, int kpiType)
        {
            return KPIListForCompanyRepo.usp_KPIListForCompany(companyRef, businessType, kpiType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    KPIListForCompanyRepo.Dispose();
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