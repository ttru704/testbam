using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Financial;

namespace Test.Models.Repository.Financial
{
    public class AvgDollarPerTransactionPeerRepo: IDisposable, IAvgDollarPerTransactionPeerRepo
    {
        private KPIEntities context = new KPIEntities();

        public AvgDollarPerTransactionPeerRepo()
        {

        }

        List<usp_AvgDollarPerTransactionPeer_Result> IAvgDollarPerTransactionPeerRepo.usp_AvgDollarPerTransactionPeer(DateTime? start, DateTime? end, int? branchRef, int? size, int? timeType, int? country, int? state, int? region)
        {
            return context.usp_AvgDollarPerTransactionPeer(start, end, branchRef, size, timeType, country, state, region).ToList();
        }

        private bool disposedValue = false; // To detect redundant calls

        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    context.Dispose();
                }
                disposedValue = true;
            }
        }

        void IDisposable.Dispose()
        {
            // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}