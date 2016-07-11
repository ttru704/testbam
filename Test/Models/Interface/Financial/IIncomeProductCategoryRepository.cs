using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Financial
{
    public interface IIncomeProductCategoryRepository: IDisposable
    {
        List<GetIncomeProductCategory_Result> GetIncomeProductCategory(DateTime start, DateTime end, int branchRef, int timeType);
    }
}
