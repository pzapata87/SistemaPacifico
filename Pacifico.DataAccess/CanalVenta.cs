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
    
    public partial class CanalVenta
    {
        public CanalVenta()
        {
            this.Comision = new HashSet<Comision>();
        }
    
        public int Co_CanalVenta { get; set; }
        public string No_CanalVenta { get; set; }
        public string Tx_Tipo { get; set; }
    
        public virtual ICollection<Comision> Comision { get; set; }
    }
}