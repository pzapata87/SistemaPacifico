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
    
    public partial class Comision
    {
        public Comision()
        {
            this.Rango = new HashSet<Rango>();
            this.Requisito = new HashSet<Requisito>();
        }
    
        public int Cod_Com { get; set; }
        public string Nro_Com { get; set; }
        public System.DateTime Fec_Reg { get; set; }
        public int Cod_Camp { get; set; }
        public int Cod_Cnl_Vta { get; set; }
        public int Cod_Car { get; set; }
    
        public virtual Campania Campania { get; set; }
        public virtual CanalVenta CanalVenta { get; set; }
        public virtual Cargo Cargo { get; set; }
        public virtual ICollection<Rango> Rango { get; set; }
        public virtual ICollection<Requisito> Requisito { get; set; }
    }
}