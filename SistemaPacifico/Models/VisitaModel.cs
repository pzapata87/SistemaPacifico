using System.Collections.Generic;
using SistemaPacifico.Core;

namespace SistemaPacifico.Models
{
    public class VisitaModel
    {
        public int CodVisita { get; set; }
        public int CodProspecto { get; set; }
        public string DniProspecto { get; set; }
        public string NombreProspecto { get; set; }
        public string ApellidoProspecto { get; set; }
        public string FechaInicial { get; set; }
        public string FechaFinal { get; set; }
        public string Comentario { get; set; }
        public int CodTipoVisita { get; set; }
        public string NombreTipoVisita { get; set; }
        public string Accion { get; set; }

        public virtual List<Comun> TipoVisitaList { get; set; }

    }
}