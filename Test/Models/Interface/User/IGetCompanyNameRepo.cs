using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.User
{
    public interface IGetCompanyNameRepo : IDisposable
    {
        string usp_GetCompanyName(long companyRef);
    }
}
