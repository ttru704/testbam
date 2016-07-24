using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface ITotalSalesComRepo : IDisposable
    {
        List<usp_TotalSalesCom_Result> usp_TotalSalesCom(DateTime start, DateTime end, int companyRef, int timeType);
    }
}
