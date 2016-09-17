using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface IAnimalsSeenBranchRepo: IDisposable
    {
        List<usp_AnimalsSeenBranch_Result> usp_AnimalsSeenBranch(DateTime? start, DateTime? end, long? companyRef, long? branchRef, int? timeType);
    }
}
