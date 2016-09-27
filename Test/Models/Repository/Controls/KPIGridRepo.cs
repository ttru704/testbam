using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Controls;

namespace Test.Models.Repository.Controls
{
    public class KPIGridRepo: IDisposable, IKPIGridRepo
    {

        private KPIEntities context = new KPIEntities();

        public KPIGridRepo()
        {

        }

        List<usp_KPIGrid_Result> IKPIGridRepo.usp_KPIGrid(int companyRef, string userRef, int kpiType)
        {
            return context.usp_KPIGrid(companyRef, userRef, kpiType).ToList();
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