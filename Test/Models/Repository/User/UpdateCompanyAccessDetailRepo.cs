using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.User;

namespace Test.Models.Repository.User
{
    public class UpdateCompanyAccessDetailRepo : IDisposable, IUpdateCompanyAccessDetailRepo
    {
        private KPIEntities context = new KPIEntities();

        public UpdateCompanyAccessDetailRepo()
        {

        }

        void IUpdateCompanyAccessDetailRepo.usp_UpdateCompanyAccessDetail(DateTime accessStart, DateTime accessEnd, long companyRef)
        {
            context.usp_UpdateCompanyAccessDetail(accessStart, accessEnd, companyRef);
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