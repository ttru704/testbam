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

        List<usp_AvgDollarPerTransactionPeer_Result> IAvgDollarPerTransactionPeerRepo.usp_AvgDollarPerTransactionPeer(DateTime? start, DateTime? end, long? branchRef, long? branchType, int? timeType, long? country, long? state, long? region)
        {
            return context.usp_AvgDollarPerTransactionPeer(start, end, branchRef, branchType, timeType, country, state, region).ToList();
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