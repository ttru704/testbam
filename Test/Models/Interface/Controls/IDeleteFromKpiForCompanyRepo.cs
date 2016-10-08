using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Controls
{
    public interface IDeleteFromKpiForCompanyRepo : IDisposable
    {
        void usp_DeleteFromKpiForCompany(long kpiRef, long companyRef);
    }
}
