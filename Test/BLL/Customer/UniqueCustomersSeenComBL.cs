using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class UniqueCustomersSeenComBL
    {
        private IUniqueCustomersSeenComRepo uniqueCustomersSeenComRepo;

        public UniqueCustomersSeenComBL()
        {
            uniqueCustomersSeenComRepo = new UniqueCustomersSeenComRepo();
        }

        public UniqueCustomersSeenComBL(IUniqueCustomersSeenComRepo uniqueCustomersSeenComRepo)
        {
            this.uniqueCustomersSeenComRepo = uniqueCustomersSeenComRepo;
        }

        public List<usp_UniqueCustomersSeenCom_Result> usp_UniqueCustomersSeenCom(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return uniqueCustomersSeenComRepo.usp_UniqueCustomersSeenCom(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    uniqueCustomersSeenComRepo.Dispose();
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