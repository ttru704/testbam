using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface IUniqueCustomersSeenBranchRepo: IDisposable
    {
        List<usp_UniqueCustomersSeenBranch_Result> usp_UniqueCustomersSeenBranch(DateTime? start, DateTime? end, int? companyRef, int? branchRef, int? timeType);
    }
}
