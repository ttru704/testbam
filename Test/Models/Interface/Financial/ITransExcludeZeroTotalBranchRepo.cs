using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface ITransExcludeZeroTotalBranchRepo: IDisposable
    {
        List<usp_TransExcludeZeroTotalBranch_Result> usp_TransExcludeZeroTotalBranch(DateTime? start, DateTime? end, long? companyRef, long? branchRef, int? timeType);
    }
}
