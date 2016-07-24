using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface IAvgDollarPerCustomerBranchRepo: IDisposable
    {
        List<usp_AvgDollarPerCustomerBranch_Result> usp_AvgDollarPerCustomerBranch(DateTime start, DateTime end, int companyRef, int branchRef, int timeType);
    }
}
