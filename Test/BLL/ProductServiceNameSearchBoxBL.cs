using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface;
using Test.Models.Repository;

namespace Test.BLL
{
    public class ProductServiceNameSearchBoxBL: IDisposable
    {
        private IProductServiceNameSearchBoxRepo ProductServiceNameSearchBoxRepo;

        public ProductServiceNameSearchBoxBL()
        {
            ProductServiceNameSearchBoxRepo = new ProductServiceNameSearchBoxRepo();
        }

        public ProductServiceNameSearchBoxBL(IProductServiceNameSearchBoxRepo ProductServiceNameSearchBoxRepo)
        {
            this.ProductServiceNameSearchBoxRepo = ProductServiceNameSearchBoxRepo;
        }

        public List<usp_ProductServiceNameSearchBox_Result> usp_ProductServiceNameSearchBox(int? companyRef)
        {
            return ProductServiceNameSearchBoxRepo.usp_ProductServiceNameSearchBox(companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    ProductServiceNameSearchBoxRepo.Dispose();
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