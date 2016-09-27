using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Controls
{
    public interface IKPIGridRepo: IDisposable
    {
        List<usp_KPIGrid_Result> usp_KPIGrid(int companyRef, string userRef, int kpiType);
    }
}
