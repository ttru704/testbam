using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.User;

namespace Test.Models.Repository.User
{
    public class GetCompanyNameRepo : IDisposable, IGetCompanyNameRepo
    {
        private KPIEntities context = new KPIEntities();

        public GetCompanyNameRepo()
        {

        }

        string IGetCompanyNameRepo.usp_GetCompanyName(long companyRef)
        {
            return context.usp_GetCompanyName(companyRef).ToString();
        }

        private bool disposedValue = false; // To detect redundant calls

        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    context.Dispose();
                }
                disposedValue = true;
            }
        }

        void IDisposable.Dispose()
        {
            // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}