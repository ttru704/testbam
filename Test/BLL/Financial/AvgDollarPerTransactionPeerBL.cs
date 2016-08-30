using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class AvgDollarPerTransactionPeerBL : IDisposable
    {
        private IAvgDollarPerTransactionPeerRepo avgDollarPerTransactionPeerRepo;

        public AvgDollarPerTransactionPeerBL()
        {
            avgDollarPerTransactionPeerRepo = new AvgDollarPerTransactionPeerRepo();
        }

        public AvgDollarPerTransactionPeerBL(IAvgDollarPerTransactionPeerRepo avgDollarPerTransactionPeerRepo)
        {
            this.avgDollarPerTransactionPeerRepo = avgDollarPerTransactionPeerRepo;
        }

        public List<usp_AvgDollarPerTransactionPeer_Result> usp_AvgDollarPerTransactionPeer(DateTime? start, DateTime? end, int? branchRef, int? size, int? timeType, int? country, int? state, int? region)
        {
            return avgDollarPerTransactionPeerRepo.usp_AvgDollarPerTransactionPeer(start, end, branchRef, size, timeType, country, state, region);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    avgDollarPerTransactionPeerRepo.Dispose();
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