using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface;
using Test.Models.Repository;

namespace Test.BLL
{
    public class ProductCategoryBL : IDisposable
    {
        private IProductCategoryRepository ProductCategoryRepository;

        public ProductCategoryBL()
        {
            ProductCategoryRepository = new ProductCategoryRepository();
        }

        public ProductCategoryBL(IProductCategoryRepository ProductCategoryRepository)
        {
            this.ProductCategoryRepository = ProductCategoryRepository;
        }

        public List<ProductCategory_Result> ProductCategory(DateTime start, DateTime end, int branchRef)
        {
            return ProductCategoryRepository.ProductCategory(start, end, branchRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    ProductCategoryRepository.Dispose();
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