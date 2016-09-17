using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface ITotalSalesSingleRepo: IDisposable
    {
        double? usp_TotalSalesSingle(Int64? companyRef);
    }
}
