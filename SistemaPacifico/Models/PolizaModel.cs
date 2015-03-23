using System.Collections.Generic;
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
        public string Accion { get; set; }

        public virtual List<Comun> TipoPlanList { get; set; }
    }
}