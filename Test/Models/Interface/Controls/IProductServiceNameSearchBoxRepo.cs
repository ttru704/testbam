using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Controls
{
    public interface IProductServiceNameSearchBoxRepo:IDisposable
    {
        List<usp_ProductServiceNameSearchBox_Result> usp_ProductServiceNameSearchBox(Int64? companyRef, string Class);
    }
}
