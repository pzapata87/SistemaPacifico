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
    
    public partial class Invitacion
    {
        public Invitacion()
        {
            this.Solicitud_Afiliacion = new HashSet<Solicitud_Afiliacion>();
        }
    
        public int Co_Invitacion { get; set; }
        public System.DateTime Fe_Invitacion { get; set; }
        public System.DateTime Fe_Expiracion { get; set; }
        public int Fl_Estado { get; set; }
        public System.DateTime Fe_RegistroIns { get; set; }
        public string No_UsuarioIns { get; set; }
        public System.DateTime Fe_RegistroUpd { get; set; }
        public string No_UsuarioUpd { get; set; }
    
        public virtual ICollection<Solicitud_Afiliacion> Solicitud_Afiliacion { get; set; }
    }
}
