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
    
    public partial class Empleado
    {
        public Empleado()
        {
            this.Reclamo = new HashSet<Reclamo>();
            this.Reclamo1 = new HashSet<Reclamo>();
            this.ProcedimientoAuditoria = new HashSet<ProcedimientoAuditoria>();
            this.ProcedimientoAuditoria1 = new HashSet<ProcedimientoAuditoria>();
            this.ProcedimientoSeguimiento = new HashSet<ProcedimientoSeguimiento>();
            this.ProcedimientoSeguimiento1 = new HashSet<ProcedimientoSeguimiento>();
            this.Solicitud_Afiliacion = new HashSet<Solicitud_Afiliacion>();
            this.Solicitud_Afiliacion1 = new HashSet<Solicitud_Afiliacion>();
            this.Solicitud_Autorizacion = new HashSet<Solicitud_Autorizacion>();
            this.Solicitud_Autorizacion1 = new HashSet<Solicitud_Autorizacion>();
        }
    
        public int Cod_Emp { get; set; }
        public string Nro_Emp { get; set; }
        public string Nro_Ape_Pat { get; set; }
        public string Nro_Ape_Mat { get; set; }
        public bool Flg_Sex { get; set; }
        public string Nu_Dni { get; set; }
        public System.DateTime Fe_Nacimiento { get; set; }
        public string Nu_Telefono { get; set; }
        public string Nu_Movil { get; set; }
        public string Tx_Direccion { get; set; }
        public int Co_Distrito { get; set; }
        public string Tx_Correo { get; set; }
        public int Co_Cargo { get; set; }
        public int Co_Area { get; set; }
        public System.DateTime Fe_RegistroIns { get; set; }
        public string No_UsuarioIns { get; set; }
        public System.DateTime Fe_RegistroUpd { get; set; }
        public string No_UsuarioUpd { get; set; }
    
        public virtual Area Area { get; set; }
        public virtual Cargo Cargo { get; set; }
        public virtual Distrito Distrito { get; set; }
        public virtual ICollection<Reclamo> Reclamo { get; set; }
        public virtual ICollection<Reclamo> Reclamo1 { get; set; }
        public virtual ICollection<ProcedimientoAuditoria> ProcedimientoAuditoria { get; set; }
        public virtual ICollection<ProcedimientoAuditoria> ProcedimientoAuditoria1 { get; set; }
        public virtual ICollection<ProcedimientoSeguimiento> ProcedimientoSeguimiento { get; set; }
        public virtual ICollection<ProcedimientoSeguimiento> ProcedimientoSeguimiento1 { get; set; }
        public virtual ICollection<Solicitud_Afiliacion> Solicitud_Afiliacion { get; set; }
        public virtual ICollection<Solicitud_Afiliacion> Solicitud_Afiliacion1 { get; set; }
        public virtual ICollection<Solicitud_Autorizacion> Solicitud_Autorizacion { get; set; }
        public virtual ICollection<Solicitud_Autorizacion> Solicitud_Autorizacion1 { get; set; }
    }
}
