using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Controls;

namespace Test.Models.Repository.Controls
{
    public class UpdateUserAccessDetailRepo : IDisposable, IUpdateUserAccessDetailRepo
    {
        private KPIEntities context = new KPIEntities();

        public UpdateUserAccessDetailRepo()
        {

        }

        void IUpdateUserAccessDetailRepo.usp_UpdateUserAccessDetail(DateTime accessStart, DateTime accessEnd, int status, string userRef)
        {
            context.usp_UpdateUserAccessDetail(accessStart, accessEnd, status, userRef);
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