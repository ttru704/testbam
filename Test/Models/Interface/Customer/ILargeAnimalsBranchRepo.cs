using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface ILargeAnimalsBranchRepo: IDisposable
    {
        List<usp_LargeAnimalsBranch_Result> usp_LargeAnimalsBranch(DateTime? start, DateTime? end, int? companyRef, int? branchRef, int? timeType);
    }
}
