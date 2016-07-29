using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    interface IIncomeByServiceActivityComRepo : IDisposable
    {
        List<usp_IncomeByServiceActivityCom_Result> usp_IncomeByServiceActivityCom(DateTime start, DateTime end, int companyRef);
    }
}
