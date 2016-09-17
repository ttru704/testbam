using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface ITransExcludeZeroTotalCompanyRepo : IDisposable
    {
        List<usp_TransExcludeZeroTotalCompany_Result> usp_TransExcludeZeroTotalCompany(DateTime start, DateTime end, long companyRef, int timeType);

    }
}
