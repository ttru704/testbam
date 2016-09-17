using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface IServiceOnlySalesCompanyRepo : IDisposable
    {
        List<usp_ServiceOnlySalesCompany_Result> usp_ServiceOnlySalesCompany(DateTime? start, DateTime? end, long companyRef, int timeType);
    }
}
