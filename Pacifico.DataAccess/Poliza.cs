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
    
    public partial class Poliza
    {
        public Poliza()
        {
            this.Reclamo_Poliza = new HashSet<Reclamo_Poliza>();
            this.Reclamo_Poliza1 = new HashSet<Reclamo_Poliza>();
        }
    
        public int Co_Poliza { get; set; }
        public string Nu_Poliza { get; set; }
        public Nullable<int> Co_Cliente { get; set; }
        public Nullable<decimal> SS_Prima { get; set; }
        public Nullable<System.DateTime> Fe_Creacion { get; set; }
        public Nullable<System.DateTime> Fe_Renovacion { get; set; }
        public Nullable<System.DateTime> Fe_InicioVigencia { get; set; }
        public Nullable<System.DateTime> Fe_Vencimiento { get; set; }
        public string Tx_TipoPago { get; set; }
        public string Tx_MarcaTarjeta { get; set; }
        public string Nu_Tarjeta { get; set; }
        public string Fl_Estado { get; set; }
    
        public virtual Cliente Cliente { get; set; }
        public virtual ICollection<Reclamo_Poliza> Reclamo_Poliza { get; set; }
        public virtual ICollection<Reclamo_Poliza> Reclamo_Poliza1 { get; set; }
    }
}
