
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
        public string CargoComisionista { get; set; }
    }
}