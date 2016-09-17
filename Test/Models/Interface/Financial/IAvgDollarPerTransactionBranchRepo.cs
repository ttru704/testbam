using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface IAvgDollarPerTransactionBranchRepo: IDisposable
    {
        List<usp_AvgDollarPerTransactionBranch_Result> usp_AvgDollarPerTransactionBranch(DateTime? start, DateTime? end, long? companyRef, long? branchRef, int? timeType);
    }
}
