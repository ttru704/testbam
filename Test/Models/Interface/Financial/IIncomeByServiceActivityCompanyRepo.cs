using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    interface IIncomeByServiceActivityCompanyRepo : IDisposable
    {
        List<usp_IncomeByServiceActivityCompany_Result> usp_IncomeByServiceActivityCompany(DateTime start, DateTime end, int companyRef);
    }
}
