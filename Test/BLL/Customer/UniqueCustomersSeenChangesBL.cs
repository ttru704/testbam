using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class UniqueCustomersSeenChangesBL : IDisposable
    {
        private IUniqueCustomersSeenChangesRepo uniqueCustomersSeenChangesRepo;

        public UniqueCustomersSeenChangesBL()
        {
            uniqueCustomersSeenChangesRepo = new UniqueCustomersSeenChangesRepo();
        }

        public UniqueCustomersSeenChangesBL(IUniqueCustomersSeenChangesRepo uniqueCustomersSeenChangesRepo)
        {
            this.uniqueCustomersSeenChangesRepo = uniqueCustomersSeenChangesRepo;
        }

        public double? usp_UniqueCustomersSeenChanges(int companyRef)
        {
            return uniqueCustomersSeenChangesRepo.usp_UniqueCustomersSeenChanges(companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    uniqueCustomersSeenChangesRepo.Dispose();
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