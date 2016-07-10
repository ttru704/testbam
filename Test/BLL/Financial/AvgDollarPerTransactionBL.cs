using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class AvgDollarPerTransactionBL : IDisposable
    {
        private IAvgDollarPerTransactionRepository AvgDollarPerTransactionRepository;

        public AvgDollarPerTransactionBL()
        {
            AvgDollarPerTransactionRepository = new AvgDollarPerTransactionRepository();
        }

        public AvgDollarPerTransactionBL(IAvgDollarPerTransactionRepository AvgDollarPerTransactionRepository)
        {
            this.AvgDollarPerTransactionRepository = AvgDollarPerTransactionRepository;
        }

        public List<AvgDollarPerTransaction_Result> AvgDollarPerTransaction(DateTime start, DateTime end, int branchRef, int timeType)
        {
            return AvgDollarPerTransactionRepository.AvgDollarPerTransaction(start, end, branchRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    AvgDollarPerTransactionRepository.Dispose();
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