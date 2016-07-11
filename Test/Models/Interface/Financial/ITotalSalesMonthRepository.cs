using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface ITotalSalesMonthRepository: IDisposable
    {
        List<GetTotalSalesMonth_Result> GetTotalSalesMonth(DateTime start, DateTime end, int branchRef, int timeType);
    }
}
