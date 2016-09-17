using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface IAvgDollarPerCustomerPeerRepo: IDisposable
    {
        List<usp_AvgDollarPerCustomerPeer_Result> usp_AvgDollarPerCustomerPeer(DateTime? start, DateTime? end, long? branchRef, long? branchType, int? timeType, long? country, long? state, long? region);
    }
}
