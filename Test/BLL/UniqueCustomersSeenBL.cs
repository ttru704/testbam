using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface;
using Test.Models.Repository;

namespace Test.BLL
{
    public class UniqueCustomersSeenBL : IDisposable
    {
        private IUniqueCustomersSeenRepository UniqueCustomersSeenRepository;

        public UniqueCustomersSeenBL()
        {
            UniqueCustomersSeenRepository = new UniqueCustomersSeenRepository();
        }

        public UniqueCustomersSeenBL(IUniqueCustomersSeenRepository UniqueCustomersSeenRepository)
        {
            this.UniqueCustomersSeenRepository = UniqueCustomersSeenRepository;
        }

        public List<UniqueCustomersSeen_Result> UniqueCustomersSeen(DateTime start, DateTime end, int branchRef, int timeType)
        {
            return UniqueCustomersSeenRepository.UniqueCustomersSeen(start, end, branchRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    UniqueCustomersSeenRepository.Dispose();
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