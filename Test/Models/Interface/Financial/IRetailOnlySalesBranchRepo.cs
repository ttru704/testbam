using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface IRetailOnlySalesBranchRepo: IDisposable
    {
        List<usp_RetailOnlySalesBranch_Result> usp_RetailOnlySalesBranch(DateTime? start, DateTime? end, int companyRef, int branchRef, int timeType);
    }
}
