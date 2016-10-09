using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.User
{
    public interface IGetAllUserAccessInfoRepo : IDisposable
    {
        List<usp_GetAllUserAccessInfo_Result> usp_GetAllUserAccessInfo(long companyRef);
    }
}
