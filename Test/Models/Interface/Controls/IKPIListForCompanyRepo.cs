using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Controls
{
    public interface IKPIListForCompanyRepo : IDisposable
    {
        List<usp_KPIListForCompany_Result> usp_KPIListForCompany(long companyRef, long businessType, int kpiType);
    }
}
