using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;


namespace Test.BLL.Financial
{
    public class RetailTotalBL: IDisposable
    {
        private IRetailTotalRepository retailTotalRepository;

        public RetailTotalBL()
        {
            retailTotalRepository = new RetailTotalRepository();
        }

        public RetailTotalBL(IRetailTotalRepository retailTotalRepository)
        {
            this.retailTotalRepository = retailTotalRepository;
        }

        public List<RetailTotal_Result> RetailTotal(DateTime start, DateTime end, int branchRef, int timeType)
        {
            return retailTotalRepository.RetailTotal(start, end, branchRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    retailTotalRepository.Dispose();
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