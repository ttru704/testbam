using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Controls
{
    public interface ISearchContextForProductServiceSBRepo:IDisposable
    {
        List<usp_SearchContextForProductServiceSB_Result> usp_SearchContextForProductServiceSB();
    }
}
