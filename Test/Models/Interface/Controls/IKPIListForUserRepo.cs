using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Controls
{
    public interface IKPIListForUserRepo : IDisposable
    {
        List<usp_KPIListForUser_Result> usp_KPIListForUser(int companyRef, string userRef, int kpiType);
    }
}
