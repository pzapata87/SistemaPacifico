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
    
    public partial class PropuestaSolucion
    {
        public PropuestaSolucion()
        {
            this.DetallePropuestaSolucion = new HashSet<DetallePropuestaSolucion>();
        }
    
        public int Cod_Prop_Sol { get; set; }
        public decimal Ss_Mon_Prim { get; set; }
        public System.DateTime Fec_Nac { get; set; }
        public decimal Ss_Mon_Ret { get; set; }
        public decimal Ss_Mon_Aseg { get; set; }
        public int Cod_Pros { get; set; }
        public int Cod_Prod { get; set; }
        public int Cod_Plan { get; set; }
        public System.DateTime Fec_Crea { get; set; }
    
        public virtual ICollection<DetallePropuestaSolucion> DetallePropuestaSolucion { get; set; }
        public virtual Producto Producto { get; set; }
        public virtual Prospecto Prospecto { get; set; }
    }
}
