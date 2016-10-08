using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Controls;
using Test.Models.Repository.Controls;

namespace Test.BLL.Controls
{
    public class InsertIntoKpiForCompanyBL : IDisposable
    {
        private IInsertIntoKpiForCompanyRepo insertIntoKpiForCompanyRepo;

        public InsertIntoKpiForCompanyBL()
        {
            insertIntoKpiForCompanyRepo = new InsertIntoKpiForCompanyRepo();
        }

        public InsertIntoKpiForCompanyBL(IInsertIntoKpiForCompanyRepo insertIntoKpiForCompanyRepo)
        {
            this.insertIntoKpiForCompanyRepo = insertIntoKpiForCompanyRepo;
        }

        public void usp_InsertIntoKpiForCompany(long kpiRef, long companyRef)
        {
            insertIntoKpiForCompanyRepo.usp_InsertIntoKpiForCompany(kpiRef, companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    insertIntoKpiForCompanyRepo.Dispose();
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