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
    
    public partial class ComisionRequisito
    {
        public int Cod_Com { get; set; }
        public int Cod_Req { get; set; }
    
        public virtual Comision Comision { get; set; }
        public virtual Requisito Requisito { get; set; }
    }
}