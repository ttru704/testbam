using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Controls
{
    public interface IRegionDropDownListRepo:IDisposable
    {
        List<usp_RegionDropDownList_Result> usp_RegionDropDownList(int? stateRef);
    }
}
