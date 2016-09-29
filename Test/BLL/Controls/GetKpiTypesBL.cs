using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Controls;
using Test.Models.Repository.Controls;
namespace Test.BLL.Controls
{
    public class GetKpiTypesBL : IDisposable
    {
        private IGetKpiTypesRepo GetKpiTypesRepo;

        public GetKpiTypesBL()
        {
            GetKpiTypesRepo = new GetKpiTypesRepo();
        }

        public GetKpiTypesBL(IGetKpiTypesRepo GetKpiTypesRepo)
        {
            this.GetKpiTypesRepo = GetKpiTypesRepo;
        }

        public List<usp_GetKpiTypes_Result> usp_GetKpiTypes()
        {
            return GetKpiTypesRepo.usp_GetKpiTypes();
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    GetKpiTypesRepo.Dispose();
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