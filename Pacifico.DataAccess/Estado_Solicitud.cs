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
    
    public partial class Estado_Solicitud
    {
        public Estado_Solicitud()
        {
            this.Solicitud_Afiliacion = new HashSet<Solicitud_Afiliacion>();
        }
    
        public int Co_Estado { get; set; }
        public string No_Estado { get; set; }
    
        public virtual ICollection<Solicitud_Afiliacion> Solicitud_Afiliacion { get; set; }
    }
}
