using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface IUniqueCustomersSeenChangesRepo : IDisposable
    {
        double? usp_UniqueCustomersSeenChanges(Int64? companyRef);
    }
}
