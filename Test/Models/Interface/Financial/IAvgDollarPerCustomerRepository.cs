using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface IAvgDollarPerCustomerRepository : IDisposable
    {
         List<AvgDollarPerCustomer_Result> AvgDollarPerCustomer(DateTime start, DateTime end, int branchRef, int timeType);
    }
}
