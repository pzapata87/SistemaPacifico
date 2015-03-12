using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using SistemaPacifico.Core;

namespace SistemaPacifico.Models
{
    public class ComisionModel
    {
        public int CodigoComision { get; set; }
        [Required]
        public string NombreComision { get; set; }

        public string FechaRegistro { get; set; }
        public string CampaniaNombre { get; set; }
        [Required]
        public int CampaniaId { get; set; }
        public string CanalVentaNombre { get; set; }
        [Required]
        public int CanalVentaId { get; set; }
        public string CargoNombre { get; set; }
        [Required]
        public int CargoId { get; set; }

        public virtual List<Comun> CargoList { get; set; }
        public virtual List<Comun> CampaniaList { get; set; }
        public virtual List<Comun> CanalVentList { get; set; }
        public virtual List<Comun> RequisitoList { get; set; }
        public virtual List<int> RequisitoListSelected { get; set; }
        public virtual List<RangoModel> RangoList { get; set; }

        public string Accion { get; set; }
    }
}