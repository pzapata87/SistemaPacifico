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
    
    public partial class Requisito
    {
        public Requisito()
        {
            this.ComisionRequisito = new HashSet<ComisionRequisito>();
        }
    
        public int Cod_Req { get; set; }
        public string Nro_Req { get; set; }
    
        public virtual ICollection<ComisionRequisito> ComisionRequisito { get; set; }
    }
}
