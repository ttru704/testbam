using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.User;

namespace Test.Models.Repository.User
{
    public class GetCompanyAccessDetailRepo : IDisposable, IGetCompanyAccessDetailRepo
    {
        private KPIEntities context = new KPIEntities();

        public GetCompanyAccessDetailRepo()
        {

        }

        List<usp_GetCompanyAccessDetail_Result> IGetCompanyAccessDetailRepo.usp_GetCompanyAccessDetail(long companyRef)
        {
            return context.usp_GetCompanyAccessDetail(companyRef).ToList();
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