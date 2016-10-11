using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface IAvgDollarPerCustomerPeerGridRepo : IDisposable
    {
        List<usp_AvgDollarPerCustomerPeerGrid_Result> usp_AvgDollarPerCustomerPeerGrid(DateTime? start, DateTime? end, long? company, long? branchRef, long? branchType, int? timeType, long? country, long? state, long? region);
    }
}
