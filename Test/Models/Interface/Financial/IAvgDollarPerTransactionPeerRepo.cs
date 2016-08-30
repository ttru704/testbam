using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface IAvgDollarPerTransactionPeerRepo: IDisposable
    {
        List<usp_AvgDollarPerTransactionPeer_Result> usp_AvgDollarPerTransactionPeer(DateTime? start, DateTime? end, int? branchRef, int? size, int? timeType, int? country, int? state, int? region);
    }
}
