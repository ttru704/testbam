using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface IAvgDollarPerTransactionPeerGridRepo : IDisposable
    {
        List<usp_AvgDollarPerTransactionPeerGrid_Result> usp_AvgDollarPerTransactionPeerGrid(DateTime? start, DateTime? end, long? company, long? branchRef, long? branchType, int? timeType, long? country, long? state, long? region);
    }
}
