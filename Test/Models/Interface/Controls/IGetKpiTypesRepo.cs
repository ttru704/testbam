using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Controls
{
    public interface IGetKpiTypesRepo:IDisposable
    {
        List<usp_GetKpiTypes_Result> usp_GetKpiTypes();
    }
}
