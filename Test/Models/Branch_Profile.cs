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
    
    public partial class Branch_Profile
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Branch_Profile()
        {
            this.Configurations = new HashSet<Configuration>();
            this.Branch_Types = new HashSet<Branch_Types>();
        }
    
        public long Ref_Number { get; set; }
        public long Company_Ref { get; set; }
        public long Brn_Number { get; set; }
        public string Name { get; set; }
        public long Bs2_Number { get; set; }
        public Nullable<int> Street_Number { get; set; }
        public string Street_Name { get; set; }
        public string Suburb { get; set; }
        public string Zip_Code { get; set; }
        public System.DateTime Last_Updated { get; set; }
        public string Status { get; set; }
        public Nullable<long> Region_Ref { get; set; }
        public Nullable<long> State_Ref { get; set; }
        public Nullable<long> Country_Ref { get; set; }
    
        public virtual Company_Profile Company_Profile { get; set; }
        public virtual Country_Profile Country_Profile { get; set; }
        public virtual Region_Profile Region_Profile { get; set; }
        public virtual State_Profile State_Profile { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Configuration> Configurations { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Branch_Types> Branch_Types { get; set; }
    }
}
