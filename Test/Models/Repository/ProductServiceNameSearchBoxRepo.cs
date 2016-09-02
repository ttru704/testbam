using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface;

namespace Test.Models.Repository
{
    public class ProductServiceNameSearchBoxRepo:IDisposable, IProductServiceNameSearchBoxRepo
    {
        private KPIEntities context = new KPIEntities();

        public ProductServiceNameSearchBoxRepo()
        {

        }

        List<usp_ProductServiceNameSearchBox_Result> IProductServiceNameSearchBoxRepo.usp_ProductServiceNameSearchBox(int? companyRef)
        {
            return context.usp_ProductServiceNameSearchBox(companyRef).ToList();
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