using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Controls;

namespace Test.Models.Repository.Controls
{
    public class GetKpiTypesRepo : IDisposable, IGetKpiTypesRepo
    {
        private KPIEntities context = new KPIEntities();

        public GetKpiTypesRepo()
        {

        }

        List<usp_GetKpiTypes_Result> IGetKpiTypesRepo.usp_GetKpiTypes()
        {
            return context.usp_GetKpiTypes().ToList();
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