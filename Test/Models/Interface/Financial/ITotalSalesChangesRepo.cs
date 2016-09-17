using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface ITotalSalesChangesRepo : IDisposable
    {
        double? usp_TotalSalesChanges(Int64? companyRef);
    }
}
