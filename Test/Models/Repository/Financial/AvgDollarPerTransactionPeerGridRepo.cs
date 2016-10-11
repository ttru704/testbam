using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Financial;

namespace Test.Models.Repository.Financial
{ 
        public class AvgDollarPerTransactionPeerGridRepo : IDisposable, IAvgDollarPerTransactionPeerGridRepo
        {
            private KPIEntities context = new KPIEntities();

            public AvgDollarPerTransactionPeerGridRepo()
            {

            }

            List<usp_AvgDollarPerTransactionPeerGrid_Result> IAvgDollarPerTransactionPeerGridRepo.usp_AvgDollarPerTransactionPeerGrid(DateTime? start, DateTime? end, long? company ,long? branchRef, long? branchType, int? timeType, long? country, long? state, long? region)
            {
                return context.usp_AvgDollarPerTransactionPeerGrid(start, end, company, branchRef, branchType, timeType, country, state, region).ToList();
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
