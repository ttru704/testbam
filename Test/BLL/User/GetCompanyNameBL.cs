using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.User;
using Test.Models.Repository.User;

namespace Test.BLL.User
{
    public class GetCompanyNameBL : IDisposable
    {
        private IGetCompanyNameRepo getCompanyNameRepo;

        public GetCompanyNameBL()
        {
            getCompanyNameRepo = new GetCompanyNameRepo();
        }

        public GetCompanyNameBL(IGetCompanyNameRepo getCompanyNameRepo)
        {
            this.getCompanyNameRepo = getCompanyNameRepo;
        }

        public string usp_GetCompanyName(long companyRef)
        {
            return getCompanyNameRepo.usp_GetCompanyName(companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    getCompanyNameRepo.Dispose();
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