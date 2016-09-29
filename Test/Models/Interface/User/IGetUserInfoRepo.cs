using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.User
{
    public interface IGetUserInfoRepo : IDisposable
    {
        List<usp_GetUserInfo_Result> usp_GetUserInfo(string userName);

    }
}
