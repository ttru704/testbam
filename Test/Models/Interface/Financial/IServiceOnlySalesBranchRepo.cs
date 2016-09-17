using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface IServiceOnlySalesBranchRepo : IDisposable
    {
        List<usp_ServiceOnlySalesBranch_Result> usp_ServiceOnlySalesBranch(DateTime? start, DateTime? end, long? companyRef, long? branchRef, int? timeType);
    }
}
