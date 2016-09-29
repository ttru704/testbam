using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.User;
using Test.Models.Repository.User;

namespace Test.BLL.User
{
    public class UpdateUserProfileBL : IDisposable
    {
        private IUpdateUserProfileRepo updateUserProfile;

        public UpdateUserProfileBL()
        {
            updateUserProfile = new UpdateUserProfileRepo();
        }

        public UpdateUserProfileBL(IUpdateUserProfileRepo updateUserProfile)
        {
            this.updateUserProfile = updateUserProfile;
        }

        public void usp_UpdateUserProfile(string userRef, string name, string email, string phoneNumber)
        {
            updateUserProfile.usp_UpdateUserProfile(userRef, name, email, phoneNumber);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    updateUserProfile.Dispose();
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