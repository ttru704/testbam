using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface
{
    public interface IBranchDropDownListRepo : IDisposable
    {
        List<usp_BranchDropDownList_Result> usp_BranchDropDownList(int companyRef);

    }
}
