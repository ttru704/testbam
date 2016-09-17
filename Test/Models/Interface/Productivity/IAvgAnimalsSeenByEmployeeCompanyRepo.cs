using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Productivity
{
    public interface IAvgAnimalsSeenByEmployeeCompanyRepo: IDisposable
    {
        List<usp_AvgAnimalsSeenByEmployeeCompany_Result> usp_AvgAnimalsSeenByEmployeeCompany(DateTime? start, DateTime? end, Int64? companyRef, int? timeType);
    }
}
