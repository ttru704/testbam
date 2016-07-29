using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface IAvgPerTransactionSingleRepo : IDisposable
    {
        double? usp_AvgPerTransactionSingle(int companyRef);
    }
}
