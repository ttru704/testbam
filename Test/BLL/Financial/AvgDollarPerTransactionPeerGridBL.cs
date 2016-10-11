using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class AvgDollarPerTransactionPeerGridBL : IDisposable
    {
        private IAvgDollarPerTransactionPeerGridRepo avgDollarPerTransactionPeerGridRepo;

        public AvgDollarPerTransactionPeerGridBL()
        {
            avgDollarPerTransactionPeerGridRepo = new AvgDollarPerTransactionPeerGridRepo();
        }

        public AvgDollarPerTransactionPeerGridBL(IAvgDollarPerTransactionPeerGridRepo avgDollarPerTransactionPeerGridRepo)
        {
            this.avgDollarPerTransactionPeerGridRepo = avgDollarPerTransactionPeerGridRepo;
        }

        public List<usp_AvgDollarPerTransactionPeerGrid_Result> usp_AvgDollarPerTransactionPeerGrid(DateTime? start, DateTime? end, long? company, long? branchRef, long? branchType, int? timeType, long? country, long? state, long? region)
        {
            return avgDollarPerTransactionPeerGridRepo.usp_AvgDollarPerTransactionPeerGrid(start, end, company, branchRef, branchType, timeType, country, state, region);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    avgDollarPerTransactionPeerGridRepo.Dispose();
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