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
    
    public partial class Producto
    {
        public Producto()
        {
            this.PlanProductoes = new HashSet<PlanProducto>();
            this.PropuestaSolucions = new HashSet<PropuestaSolucion>();
        }
    
        public int Cod_Prod { get; set; }
        public string Nro_Prod { get; set; }
        public System.DateTime Fec_Crea { get; set; }
        public string FI_Estado { get; set; }
        public bool Flg_Flag { get; set; }
    
        public virtual ICollection<PlanProducto> PlanProductoes { get; set; }
        public virtual ICollection<PropuestaSolucion> PropuestaSolucions { get; set; }
    }
}