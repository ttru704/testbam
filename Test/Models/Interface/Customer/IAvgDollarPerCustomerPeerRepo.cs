using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface IAvgDollarPerCustomerPeerRepo: IDisposable
    {
        List<usp_AvgDollarPerCustomerPeer_Result> usp_AvgDollarPerCustomerPeer(DateTime? start, DateTime? end, int? branchRef, int? size, int? timeType, int? country, int? state, int? region);
    }
}
