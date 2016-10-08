using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Controls
{
    public interface ICompanyListRepo : IDisposable
    {
        List<usp_CompanyList_Result> usp_CompanyList();
    }
}
