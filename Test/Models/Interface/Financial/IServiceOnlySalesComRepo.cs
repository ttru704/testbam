using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface IServiceOnlySalesComRepo : IDisposable
    {
        List<usp_ServiceOnlySalesCom_Result> usp_ServiceOnlySalesCom(DateTime? start, DateTime? end, int companyRef, int timeType);
    }
}
