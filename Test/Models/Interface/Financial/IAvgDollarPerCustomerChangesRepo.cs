using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface IAvgDollarPerCustomerChangesRepo : IDisposable
    {
        double? usp_AvgDollarPerCustomerChanges(Int64? companyRef);
    }
}
