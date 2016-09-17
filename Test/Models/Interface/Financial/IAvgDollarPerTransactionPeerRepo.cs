using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface IAvgDollarPerTransactionPeerRepo: IDisposable
    {
        List<usp_AvgDollarPerTransactionPeer_Result> usp_AvgDollarPerTransactionPeer(DateTime? start, DateTime? end, long? branchRef, long? branchType, int? timeType, long? country, long? state, long? region);
    }
}
