using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Controls;

namespace Test.Models.Repository.Controls
{
    public class KPIListForUserRepo : IDisposable, IKPIListForUserRepo
    {

        private KPIEntities context = new KPIEntities();

        public KPIListForUserRepo()
        {

        }

        List<usp_KPIListForUser_Result> IKPIListForUserRepo.usp_KPIListForUser(int companyRef, string userRef, int kpiType)
        {
            return context.usp_KPIListForUser(companyRef, userRef, kpiType).ToList();
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