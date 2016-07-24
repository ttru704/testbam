using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface INewClientsBranchRepo: IDisposable
    {
        List<usp_NewClientsBranch_Result> usp_NewClientsBranch(DateTime start, DateTime end, int companyRef, int branchRef, int timeType);
    }
}
