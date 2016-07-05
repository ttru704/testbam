using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface;

namespace Test.Models.Repository
{
    public class ProductCategoryRepository : IDisposable, IProductCategoryRepository
    {
        private KPIEntities context = new KPIEntities();

        public ProductCategoryRepository()
        {

        }

        List<ProductCategory_Result> IProductCategoryRepository.ProductCategory(DateTime start, DateTime end, int branchRef)
        {
            return context.ProductCategory(start, end, branchRef).ToList();
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
