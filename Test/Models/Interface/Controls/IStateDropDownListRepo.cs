using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Controls
{
    public interface IStateDropDownListRepo :IDisposable
    {
        List<usp_StateDropDownList_Result> usp_StateDropDownList(int? countryRef);
    }
}
