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
    
    public partial class Tema
    {
        public Tema()
        {
            this.Sugerencia = new HashSet<Sugerencia>();
            this.Sugerencia1 = new HashSet<Sugerencia>();
        }
    
        public int Co_Tema { get; set; }
        public string No_Nombre { get; set; }
    
        public virtual ICollection<Sugerencia> Sugerencia { get; set; }
        public virtual ICollection<Sugerencia> Sugerencia1 { get; set; }
    }
}
