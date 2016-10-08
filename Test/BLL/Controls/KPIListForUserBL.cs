using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Controls;
using Test.Models.Repository.Controls;

namespace Test.BLL.Controls
{
    public class KPIListForUserBL : IDisposable
    {
        private IKPIListForUserRepo KPIListForUserRepo;

        public KPIListForUserBL()
        {
            KPIListForUserRepo = new KPIListForUserRepo();
        }

        public KPIListForUserBL(IKPIListForUserRepo KPIListForUserRepo)
        {
            this.KPIListForUserRepo = KPIListForUserRepo;
        }

        public List<usp_KPIListForUser_Result> usp_KPIListForUser(int companyRef, string userRef, int kpiType)
        {
            return KPIListForUserRepo.usp_KPIListForUser(companyRef, userRef, kpiType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    KPIListForUserRepo.Dispose();
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