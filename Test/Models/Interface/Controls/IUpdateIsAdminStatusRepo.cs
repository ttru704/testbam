using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Controls
{
    public interface IUpdateIsAdminStatusRepo : IDisposable
    {
        void usp_UpdateIsAdminStatus(string userName, string status);
    }
}
