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
    
    public partial class Visita
    {
        public int Cod_Visita { get; set; }
        public int Cod_Pros { get; set; }
        public System.DateTime Fec_Ini { get; set; }
        public System.DateTime Fec_Fin { get; set; }
        public string Txt_Comentario { get; set; }
        public int Cod_Tipo_Visita { get; set; }
    
        public virtual TipoVisita TipoVisita { get; set; }
        public virtual Prospecto Prospecto { get; set; }
    }
}
