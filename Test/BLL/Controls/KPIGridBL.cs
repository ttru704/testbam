using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Controls;
using Test.Models.Repository.Controls;

namespace Test.BLL.Controls
{
    public class KPIGridBL : IDisposable
    {
        private IKPIGridRepo KPIGridRepo;

        public KPIGridBL()
        {
            KPIGridRepo = new KPIGridRepo();
        }

        public KPIGridBL(IKPIGridRepo KPIGridRepo)
        {
            this.KPIGridRepo = KPIGridRepo;
        }

        public List<usp_KPIGrid_Result> usp_KPIGrid(int companyRef, string userRef, int kpiType)
        {
            return KPIGridRepo.usp_KPIGrid(companyRef, userRef, kpiType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    KPIGridRepo.Dispose();
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