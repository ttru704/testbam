//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Test.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product_Profile
    {
        public long Company_Ref { get; set; }
        public long Prd_Number { get; set; }
        public string Prd_Name { get; set; }
        public string Prd_Class { get; set; }
        public Nullable<long> Cat_1 { get; set; }
        public System.DateTime Last_Updated { get; set; }
        public string Status { get; set; }
    
        public virtual Category_Types Category_Types { get; set; }
        public virtual Company_Profile Company_Profile { get; set; }
        public virtual Product_Profile Product_Profile1 { get; set; }
        public virtual Product_Profile Product_Profile2 { get; set; }
    }
}
