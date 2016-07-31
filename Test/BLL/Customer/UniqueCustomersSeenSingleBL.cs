using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class UniqueCustomersSeenSingleBL : IDisposable
    {
        private IUniqueCustomersSeenSingleRepo uniqueCustomersSeenSingleRepo;

        public UniqueCustomersSeenSingleBL()
        {
            uniqueCustomersSeenSingleRepo = new UniqueCustomersSeenSingleRepo();
        }

        public UniqueCustomersSeenSingleBL(IUniqueCustomersSeenSingleRepo uniqueCustomersSeenSingleRepo)
        {
            this.uniqueCustomersSeenSingleRepo = uniqueCustomersSeenSingleRepo;
        }

        public double? usp_UniqueCustomersSeenSingle(int companyRef)
        {
            return uniqueCustomersSeenSingleRepo.usp_UniqueCustomersSeenSingle(companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    uniqueCustomersSeenSingleRepo.Dispose();
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