using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface IIncomeByProductCategoryComRepo : IDisposable
    {
        List<usp_IncomeByProductCategoryCom_Result> usp_IncomeByProductCategoryCom(DateTime start, DateTime end, int companyRef);
    }
}
