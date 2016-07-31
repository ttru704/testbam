using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface INewCustomersSingleRepo : IDisposable
    {
        double? usp_NewCustomersSingle(int companyRef);
    }
}
