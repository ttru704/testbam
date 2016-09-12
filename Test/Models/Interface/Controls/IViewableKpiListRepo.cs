using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Controls
{
    public interface IViewableKpiListRepo : IDisposable
    {
        List<usp_ViewableKpiList_Result> usp_ViewableKpiList(string userRef, int kpiType, string kpiTab);
    }
}
