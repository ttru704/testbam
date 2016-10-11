using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.User;
using Test.Models.Repository.User;

namespace Test.BLL.User
{
    public class GetCompanyAccessDetailBL : IDisposable
    {
        private IGetCompanyAccessDetailRepo getCompanyAccessDetailRepo;

        public GetCompanyAccessDetailBL()
        {
            getCompanyAccessDetailRepo = new GetCompanyAccessDetailRepo();
        }

        public GetCompanyAccessDetailBL(IGetCompanyAccessDetailRepo getCompanyAccessDetailRepo)
        {
            this.getCompanyAccessDetailRepo = getCompanyAccessDetailRepo;
        }

        public List<usp_GetCompanyAccessDetail_Result> usp_GetCompanyAccessDetail(long companyRef)
        {
            return getCompanyAccessDetailRepo.usp_GetCompanyAccessDetail(companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    getCompanyAccessDetailRepo.Dispose();
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