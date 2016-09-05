using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Controls;

namespace Test.Models.Repository.Controls
{
    public class ProductServiceNameSearchBoxRepo:IDisposable, IProductServiceNameSearchBoxRepo
    {
        private KPIEntities context = new KPIEntities();

        public ProductServiceNameSearchBoxRepo()
        {

        }

        List<usp_ProductServiceNameSearchBox_Result> IProductServiceNameSearchBoxRepo.usp_ProductServiceNameSearchBox(int? companyRef, string productClass)
        {
            return context.usp_ProductServiceNameSearchBox(companyRef, productClass).ToList();
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