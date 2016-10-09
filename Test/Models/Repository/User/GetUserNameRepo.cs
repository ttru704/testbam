using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.User;

namespace Test.Models.Repository.User
{
    public class GetUserNameRepo: IDisposable, IGetUserNameRepo
    {
        private KPIEntities context = new KPIEntities();

        public GetUserNameRepo()
        {

        }

        string IGetUserNameRepo.usp_GetUserName(string userRef)
        {
           return context.usp_GetUserName(userRef).ToString();
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