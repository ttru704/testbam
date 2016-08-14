using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface IIncomeByProductCategoryCompanyRepo : IDisposable
    {
        List<usp_IncomeByProductCategoryCompany_Result> usp_IncomeByProductCategoryCompany(DateTime start, DateTime end, int companyRef);
    }
}
