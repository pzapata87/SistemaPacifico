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
    
    public partial class Rango
    {
        public int Cod_Rang { get; set; }
        public double Ss_Min { get; set; }
        public double Ss_Max { get; set; }
        public int Qtd_Cant { get; set; }
        public int Cod_Com { get; set; }
    
        public virtual Comision Comision { get; set; }
    }
}