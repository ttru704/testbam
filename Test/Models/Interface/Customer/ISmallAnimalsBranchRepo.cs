using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface ISmallAnimalsBranchRepo : IDisposable
    {
        List<usp_SmallAnimalsBranch_Result> usp_SmallAnimalsBranch(DateTime start, DateTime end, int companyRef, int branchRef, int timeType);

    }
}
