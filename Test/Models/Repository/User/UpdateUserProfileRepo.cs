using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface;
using Test.BLL.User;
using Test.Models.Interface.User;

namespace Test.Models.Repository.User
{
    public class UpdateUserProfileRepo: IDisposable, IUpdateUserProfileRepo
    {
        private KPIEntities context = new KPIEntities();

        public UpdateUserProfileRepo()
        {

        }

        void IUpdateUserProfileRepo.usp_UpdateUserProfile(string userRef, string name, string email, string phoneNumber)
        {
            context.usp_UpdateUserProfile(userRef, name, email, phoneNumber);
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