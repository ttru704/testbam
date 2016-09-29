using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.User;
using Test.Models.Repository.User;

namespace Test.BLL.User
{
    public class GetUserInfoBL: IDisposable
    {
        private IGetUserInfoRepo getUserInfoRepo;

        public GetUserInfoBL()
        {
            getUserInfoRepo = new GetUserInfoRepo();
        }

        public GetUserInfoBL(IGetUserInfoRepo getUserInfoRepo)
        {
            this.getUserInfoRepo = getUserInfoRepo;
        }

        public List<usp_GetUserInfo_Result> usp_GetUserInfo(string userName)
        {
            return getUserInfoRepo.usp_GetUserInfo(userName);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    getUserInfoRepo.Dispose();
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