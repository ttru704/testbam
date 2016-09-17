﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Controls
{
    public interface ICountryDropDownListRepo: IDisposable
    {
        List<usp_CountryDropDownList_Result> usp_CountryDropDownList(long? branchRef);
    }
}
