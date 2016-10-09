using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.User;
using Test.Models.Repository.User;

namespace Test.BLL.User
{
    public class GetAllUserAccessInfoBL : IDisposable
    {
        private IGetAllUserAccessInfoRepo getAllUserAccessInfoRepo;

        public GetAllUserAccessInfoBL()
        {
            getAllUserAccessInfoRepo = new GetAllUserAccessInfoRepo();
        }

        public GetAllUserAccessInfoBL(IGetAllUserAccessInfoRepo getAllUserAccessInfoRepo)
        {
            this.getAllUserAccessInfoRepo = getAllUserAccessInfoRepo;
        }

        public List<usp_GetAllUserAccessInfo_Result> usp_GetAllUserAccessInfo(long companyRef)
        {
            return getAllUserAccessInfoRepo.usp_GetAllUserAccessInfo(companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    getAllUserAccessInfoRepo.Dispose();
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