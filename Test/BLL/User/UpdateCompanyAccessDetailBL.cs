using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.User;
using Test.Models.Repository.User;

namespace Test.BLL.User
{
    public class UpdateCompanyAccessDetailBL : IDisposable
    {
        private IUpdateCompanyAccessDetailRepo updateCompanyAccessDetailRepo;

        public UpdateCompanyAccessDetailBL()
        {
            updateCompanyAccessDetailRepo = new UpdateCompanyAccessDetailRepo();
        }

        public UpdateCompanyAccessDetailBL(IUpdateCompanyAccessDetailRepo updateCompanyAccessDetailRepo)
        {
            this.updateCompanyAccessDetailRepo = updateCompanyAccessDetailRepo;
        }

        public void usp_UpdateCompanyAccessDetail(DateTime accessStart, DateTime accessEnd, long companyRef)
        {
            updateCompanyAccessDetailRepo.usp_UpdateCompanyAccessDetail(accessStart, accessEnd, companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    updateCompanyAccessDetailRepo.Dispose();
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