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
    
    public partial class Prestadora
    {
        public int Co_Prestadora { get; set; }
        public string Nu_Ruc { get; set; }
        public string Tx_RazonSocial { get; set; }
        public string Tx_DomicilioFiscal { get; set; }
        public int Co_Distrito { get; set; }
        public string No_RepresentanteLegal { get; set; }
        public string No_ApePatRepresentanteLegal { get; set; }
        public string No_ApeMatRepresentanteLegal { get; set; }
        public string Tx_CorreoRepresentanteLegal { get; set; }
        public string Nu_TelefonoRepresentanteLegal { get; set; }
        public string Tx_PaginaWeb { get; set; }
        public Nullable<System.DateTime> Fe_Afiliacion { get; set; }
        public int Fl_Activo { get; set; }
        public System.DateTime Fe_RegistroIns { get; set; }
        public string No_UsuarioIns { get; set; }
        public System.DateTime Fe_RegistroUpd { get; set; }
        public string No_UsuarioUpd { get; set; }
    
        public virtual Distrito Distrito { get; set; }
    }
}
