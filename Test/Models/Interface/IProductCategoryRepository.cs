using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface
{
    public interface IProductCategoryRepository: IDisposable
    {
        List<ProductCategory_Result> ProductCategory(DateTime start, DateTime end, int branchRef);
    }
}
