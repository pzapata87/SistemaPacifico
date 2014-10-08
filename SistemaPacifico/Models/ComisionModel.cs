using System.Collections.Generic;
using Pacifico.DataAccess;
using SistemaPacifico.Core;

namespace SistemaPacifico.Models
{
    public class ComisionModel
    {
        public int CodigoComision { get; set; }
        public string NombreComision { get; set; }
        public string FechaRegistro { get; set; }
        public string CampaniaNombre { get; set; }
        public int CampaniaId { get; set; }
        public string CanalVentaNombre { get; set; }
        public int CanalVentaId { get; set; }
        public string CargoNombre { get; set; }
        public int CargoId { get; set; }

        public virtual List<Comun> CargoList { get; set; }
        public virtual List<Comun> CampaniaList { get; set; }
        public virtual List<Comun> CanalVentList { get; set; }
        public virtual List<Comun> RequisitoList { get; set; }
        public virtual List<int> RequisitoListSelected { get; set; }
        public virtual List<RangoModel> RangoList { get; set; }
    }
}