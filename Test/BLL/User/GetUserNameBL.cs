using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.User;
using Test.Models.Repository.User;

namespace Test.BLL.User
{
    public class GetUserNameBL : IDisposable
    {
        private IGetUserNameRepo getUserNameRepo;

        public GetUserNameBL()
        {
            getUserNameRepo = new GetUserNameRepo();
        }

        public GetUserNameBL(IGetUserNameRepo updateIsAdminStatusRepo)
        {
            this.getUserNameRepo = updateIsAdminStatusRepo;
        }

        public string usp_GetUserName(string userRef)
        {
            return getUserNameRepo.usp_GetUserName(userRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    getUserNameRepo.Dispose();
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