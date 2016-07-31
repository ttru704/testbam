using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface IUniqueCustomersSeenSingleRepo : IDisposable
    {
        double? usp_UniqueCustomersSeenSingle(int companyRef);
    }
}
