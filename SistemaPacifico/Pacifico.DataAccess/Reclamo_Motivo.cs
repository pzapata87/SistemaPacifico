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
    
    public partial class Reclamo_Motivo
    {
        public Reclamo_Motivo()
        {
            this.Reclamo = new HashSet<Reclamo>();
        }
    
        public int Co_MotivoReclamo { get; set; }
        public string Tx_Descripcion { get; set; }
    
        public virtual ICollection<Reclamo> Reclamo { get; set; }
    }
}