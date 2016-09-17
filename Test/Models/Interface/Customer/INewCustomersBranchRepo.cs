using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface INewCustomersBranchRepo: IDisposable
    {
        List<usp_NewCustomersBranch_Result> usp_NewCustomersBranch(DateTime? start, DateTime? end, long? companyRef, long? branchRef, int? timeType);
    }
}
