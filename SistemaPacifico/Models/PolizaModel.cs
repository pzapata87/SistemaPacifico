using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using SistemaPacifico.Core;

namespace SistemaPacifico.Models
{
    public class PolizaModel
    {
        public int CodPoliza { get; set; }
        public int NumSolicitud { get; set; }
        public int CodCliente { get; set; }
        public decimal Monto { get; set; }
        public string DniCliente { get; set; }
        public string NombreCliente { get; set; }
        public string ApellidoPaternoCliente { get; set; }
        public string ApellidoMaternoCliente { get; set; }
        [Required]
        public string FechaNacimientoCliente { get; set; }
        public string LugarNacimientoCliente { get; set; }
        public string DireccionCliente { get; set; }
        public bool SexoCliente { get; set; }
        public bool EstadoCivilCliente { get; set; }
        public string FechaIngreso { get; set; }
        public string InicioVigencia { get; set; }
        public decimal CapitalAsegurado { get; set; }
        public int NombreTipoPoliza { get; set; }
        public int CodTipoPlan { get; set; }
        public string Asesor { get; set; }

        public string DniBeneficiario { get; set; }
        public string NombreBeneficiario { get; set; }
        public string ApellidoPaternoBeneficiario { get; set; }
        public string ApellidoMaternoBeneficiario { get; set; }
        public decimal PorcentajeCapitalAsegurado { get; set; }
        [Required]
        public string FechaNacimientoBeneficiario { get; set; }

        public string Ocupacion { get; set; }
        public string Actividad { get; set; }
        public string LugarTrabajo { get; set; }
        public string IngresoMensual { get; set; }
        public string Horario { get; set; }
        public string ExpuestoAPeligro { get; set; }
        public string MedioTransporte { get; set; }
        public string FrecuenciaViaje { get; set; }
        public string DeporteAficion { get; set; }
        public string RiesgoAccidente { get; set; }
        public string CoberturaRiego { get; set; }
        public string Estatura { get; set; }
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
    }
}