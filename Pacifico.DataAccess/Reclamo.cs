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
    
    public partial class Reclamo
    {
        public Reclamo()
        {
            this.Reclamo_Poliza = new HashSet<Reclamo_Poliza>();
            this.Reclamo_Poliza1 = new HashSet<Reclamo_Poliza>();
        }
    
        public string Nu_Reclamo { get; set; }
        public Nullable<int> Co_Reclamante { get; set; }
        public Nullable<int> Co_Empleado { get; set; }
        public Nullable<int> Co_MotivoReclamo { get; set; }
        public Nullable<System.DateTime> Fe_Registro { get; set; }
        public Nullable<System.DateTime> Fe_Ocurrencia { get; set; }
        public string Tx_LugIncidencia { get; set; }
        public string Tx_PersAtendio { get; set; }
        public string Tx_DescReclamo { get; set; }
        public string Tx_ResInmediata { get; set; }
        public string Fi_Estado { get; set; }
        public Nullable<System.DateTime> Fe_CierreReclamo { get; set; }
    
        public virtual Empleado Empleado { get; set; }
        public virtual Empleado Empleado1 { get; set; }
        public virtual Reclamante Reclamante { get; set; }
        public virtual Reclamante Reclamante1 { get; set; }
        public virtual Reclamo_Motivo Reclamo_Motivo { get; set; }
        public virtual Reclamo_Motivo Reclamo_Motivo1 { get; set; }
        public virtual ICollection<Reclamo_Poliza> Reclamo_Poliza { get; set; }
        public virtual ICollection<Reclamo_Poliza> Reclamo_Poliza1 { get; set; }
    }
}
