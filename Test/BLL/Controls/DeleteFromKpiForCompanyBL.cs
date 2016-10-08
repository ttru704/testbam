using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Controls;
using Test.Models.Repository.Controls;

namespace Test.BLL.Controls
{
    public class DeleteFromKpiForCompanyBL : IDisposable
    {
        private IDeleteFromKpiForCompanyRepo deleteFromKpiForCompanyRepo;

        public DeleteFromKpiForCompanyBL()
        {
            deleteFromKpiForCompanyRepo = new DeleteFromKpiForCompanyRepo();
        }

        public DeleteFromKpiForCompanyBL(IDeleteFromKpiForCompanyRepo deleteFromKpiForCompanyRepo)
        {
            this.deleteFromKpiForCompanyRepo = deleteFromKpiForCompanyRepo;
        }

        public void usp_DeleteFromKpiForCompany(long kpiRef, long companyRef)
        {
            deleteFromKpiForCompanyRepo.usp_DeleteFromKpiForCompany(kpiRef, companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    deleteFromKpiForCompanyRepo.Dispose();
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