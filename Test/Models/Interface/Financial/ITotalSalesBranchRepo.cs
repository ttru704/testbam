using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface ITotalSalesBranchRepo : IDisposable
    {
        List<usp_TotalSalesBranch_Result> usp_TotalSalesBranch(DateTime start, DateTime end, int companyRef, int branchRef, int timeType);
    }
}
