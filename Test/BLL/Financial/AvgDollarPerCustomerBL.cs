using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class AvgDollarPerCustomerBL : IDisposable
    {
        private IAvgDollarPerCustomerRepository AvgDollarPerCustomerRepository;

        public AvgDollarPerCustomerBL()
        {
            AvgDollarPerCustomerRepository = new AvgDollarPerCustomerRepository();
        }

        public AvgDollarPerCustomerBL(IAvgDollarPerCustomerRepository AvgDollarPerCustomerRepository)
        {
            this.AvgDollarPerCustomerRepository = AvgDollarPerCustomerRepository;
        }

        public List<AvgDollarPerCustomer_Result> AvgDollarPerCustomer(DateTime start, DateTime end, int branchRef, int timeType)
        {
            return AvgDollarPerCustomerRepository.AvgDollarPerCustomer(start, end, branchRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    AvgDollarPerCustomerRepository.Dispose();
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