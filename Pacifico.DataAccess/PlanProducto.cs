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
    
    public partial class PlanProducto
    {
        public int Cod_Plan_Prod { get; set; }
        public string Nro_Plan_Prod { get; set; }
        public decimal Ss_Prim_Min { get; set; }
        public int Ss_Sum_Min_Aseg { get; set; }
        public int Ss_Sum_Max_Aseg { get; set; }
        public int Cod_Prod { get; set; }
    
        public virtual Producto Producto { get; set; }
    }
}
