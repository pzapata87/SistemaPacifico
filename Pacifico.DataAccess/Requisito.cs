//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Pacifico.DataAccess
{
    using System;
    using System.Collections.Generic;
    
    public partial class Cargo
    {
        public Cargo()
        {
            this.Comisions = new HashSet<Comision>();
        }
    
        public int Co_Cargo { get; set; }
        public string No_Cargo { get; set; }
    
        public virtual ICollection<Comision> Comisions { get; set; }
    }
}
