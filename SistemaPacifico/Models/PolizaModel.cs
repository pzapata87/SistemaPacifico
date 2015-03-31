using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using SistemaPacifico.Core;

namespace SistemaPacifico.Models
{
    public class PolizaModel
    {
        public int CodPoliza { get; set; }
        public string NumSolicitud { get; set; }
        public int CodCliente { get; set; }
        [Required]
        public string DniCliente { get; set; }
        [Required]
        public string NombreCliente { get; set; }
        [Required]
        public string ApellidoPaternoCliente { get; set; }
        [Required]
        public string ApellidoMaternoCliente { get; set; }
        [Required]
        public string FechaNacimientoCliente { get; set; }
        [Required]
        public string LugarNacimientoCliente { get; set; }
        [Required]
        public string DireccionCliente { get; set; }
        public bool SexoCliente { get; set; }
        public string EstadoCivilCliente { get; set; }
        public string FechaIngreso { get; set; }
        [Required]
        public string InicioVigencia { get; set; }
        [Required]
        public decimal CapitalAsegurado { get; set; }
        public string NombreTipoPoliza { get; set; }
        public int CodTipoPlan { get; set; }
        public string Asesor { get; set; }

        [Required]
        public string DniBeneficiario { get; set; }
        [Required]
        public string NombreBeneficiario { get; set; }
        [Required]
        public string ApellidoPaternoBeneficiario { get; set; }
        [Required]
        public string ApellidoMaternoBeneficiario { get; set; }
        [Required]
        public decimal PorcentajeCapitalAsegurado { get; set; }
        [Required]
        public string FechaNacimientoBeneficiario { get; set; }

        [Required]
        public string Ocupacion { get; set; }
        [Required]
        public string Actividad { get; set; }
        [Required]
        public string LugarTrabajo { get; set; }
        [Required]
        public string IngresoMensual { get; set; }
        [Required]
        public string Horario { get; set; }
        [Required]
        public string ExpuestoAPeligro { get; set; }
        [Required]
        public string MedioTransporte { get; set; }
        [Required]
        public string FrecuenciaViaje { get; set; }
        [Required]
        public string DeporteAficion { get; set; }
        [Required]
        public string RiesgoAccidente { get; set; }
        [Required]
        public string CoberturaRiego { get; set; }
        [Required]
        public string Estatura { get; set; }
        [Required]
        public string Peso { get; set; }
        public bool ConsumeTabaco { get; set; }
        public bool ConsumeAlcohol { get; set; }
        public bool InsuficienciaRenal { get; set; }
        public bool Diabetes { get; set; }
        public bool Cancer { get; set; }
        public bool Epilepsia { get; set; }
        public bool AfeccionCardiaca { get; set; }
        public bool HipertensionArterial { get; set; }
        public bool TranstornoMental { get; set; }

        public string Accion { get; set; }

        public virtual List<Comun> TipoPlanList { get; set; }
        public virtual List<Comun> TipoPolizaList { get; set; }
    }
}