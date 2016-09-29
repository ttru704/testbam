using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Controls
{
    public interface IUserDropDownListRepo : IDisposable
    {
        List<usp_UserDropDownList_Result> usp_UserDropDownList(long companyRef);
    }
}
