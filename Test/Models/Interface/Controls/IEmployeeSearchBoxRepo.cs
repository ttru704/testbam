using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Controls
{
    public interface IEmployeeSearchBoxRepo: IDisposable
    {
        List<usp_EmployeeSearchBox_Result> usp_EmployeeSearchBox(int? companyRef);
    }
}
