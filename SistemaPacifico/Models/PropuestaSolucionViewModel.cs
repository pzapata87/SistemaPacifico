using Pacifico.DataAccess;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SistemaPacifico.Models
{
    public class PropuestaSolucionViewModel
    {
        [Display(Name = "Número de Propuesta")]
        public int Codigo { get; set; }
        [Display(Name = "DNI Prospecto")]
        public string DNIProspecto { get; set; }
        [Required]
        public int CodigoProspecto { get; set; }
        [Display(Name = "Nombre Prospecto")]
        public string NombreProspecto { get; set; }
        [Display(Name = "Apellidos")]
        public string ApellidoProspecto { get; set; }
        [Required]
        [Display(Name = "Producto: ")]
        public int CodigoProducto { get; set; }

        public string NombreProducto { get; set; }

        public IEnumerable<SelectListItem> Productos { get; set; }
        [Display(Name = "Plan: ")]
        public int CodigoPlan { get; set; }
        public IEnumerable<SelectListItem> PlanProductos { get; set; }
        [Required]
        [Display(Name = "Fecha Nacimiento: ")]
        public string FechaNacimiento { get; set; }
        [Required]
        [Display(Name = "Monto Asegurado")]
        public decimal? MontoAsegurado { get; set; }
        [Required]
        [Display(Name = "Monto Retorno: ")]
        public decimal? MontoRetorno { get; set; }
        [Required]
        [Display(Name = "Monto Prima: ")]
        public decimal? MontoPrima { get; set; }
        [Display(Name = "Fecha de Registro")]
        public string FechaRegistro { get; set; }
        public List<DetallePropuestaSolucion> Detalle { get; set; }
    }
}