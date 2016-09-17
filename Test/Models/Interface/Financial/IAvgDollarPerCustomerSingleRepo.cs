using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface IAvgDollarPerCustomerSingleRepo : IDisposable
    {
        double? usp_AvgDollarPerCustomerSingle(Int64? companyRef);
    }
}
