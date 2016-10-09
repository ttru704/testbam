﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.User
{
    public interface IGetUserNameRepo : IDisposable
    {
        string usp_GetUserName(string userRef);
    }
}
