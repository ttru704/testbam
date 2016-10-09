using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.User;

namespace Test.Models.Repository.User
{
    public class GetAllUserAccessInfoRepo : IDisposable, IGetAllUserAccessInfoRepo
    {
        private KPIEntities context = new KPIEntities();

        public GetAllUserAccessInfoRepo()
        {

        }

        List<usp_GetAllUserAccessInfo_Result> IGetAllUserAccessInfoRepo.usp_GetAllUserAccessInfo(long companyRef)
        {
            return context.usp_GetAllUserAccessInfo(companyRef).ToList();
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