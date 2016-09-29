using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.User
{
    public interface IUpdateUserProfileRepo : IDisposable
    {
        void usp_UpdateUserProfile(string userRef, string name, string email, string phoneNumber);

    }
}

