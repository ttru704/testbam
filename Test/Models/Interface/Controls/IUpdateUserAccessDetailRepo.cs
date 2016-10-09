using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Controls
{
    public interface IUpdateUserAccessDetailRepo : IDisposable
    {
        void usp_UpdateUserAccessDetail(DateTime accessStart, DateTime accessEnd, int status, string userRef);
    }
}
