using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Pacifico.Bussines;
using Pacifico.DataAccess;
using SistemaPacifico.Core;
using SistemaPacifico.Models;

namespace SistemaPacifico.Controllers
{
    public class PolizaController : Controller
    {
        #region Variables

        private readonly PolizaBusiness _polizaBL;

        #endregion

        #region Constructor

        public PolizaController()
        {
            _polizaBL = new PolizaBusiness();
        }

        #endregion

        #region Metodos Públicos

        public ActionResult Index()
        {
            var list = new List<PolizaModel>();
            return View(list);
        }

        [HttpPost]
        public ActionResult Index(string fechaIni, string fechaFin, string dniProspecto, string nombreProspecto)
        {
            return View();
        }

        public ActionResult CrearPoliza()
        {
             var cont = _polizaBL.FindAll().Count() + 1;

            var model = new PolizaModel
            {
                Accion = "CrearPoliza",
                NumSolicitud = string.Format("{0} - {1:0000}", DateTime.Today.Year, cont),
                TipoPlanList = GetTipoPlanList()
            };

            model.TipoPlanList.Insert(0, new Comun { Nombre = "[SELECCIONAR]", Valor = string.Empty });

            return View("Edit", model);
        }

        public ActionResult EditarPoliza(int id)
        {
            var poliza = _polizaBL.Get(id);

            var model = new PolizaModel
            {
                CodPoliza = poliza.Co_Poliza,
                Accion = "EditarPoliza"
            };

            model.TipoPlanList.Insert(0, new Comun { Nombre = "[SELECCIONAR]", Valor = string.Empty });

            return View("Edit", model);
        }

        [HttpPost]
        public ActionResult CrearPoliza(PolizaModel model)
        {
            try
            {
                var cliente = new Cliente
                {
                    Nu_DNI = model.DniCliente,
                    No_Cliente = model.NombreCliente,
                    No_ApePaterno = model.ApellidoPaternoCliente,
                    No_ApeMaterno = model.ApellidoMaternoCliente,
                    Fe_Nacimiento = Convert.ToDateTime(model.FechaNacimientoCliente),
                    Tx_LugarNacimiento = model.LugarNacimientoCliente,
                    Tx_Direccion = model.DireccionCliente,
                    Fi_EstadoCivil = model.EstadoCivilCliente,
                    Fi_Sexo = model.SexoCliente
                };

                var beneficiario = new List<Beneficiario>
                {
                    new Beneficiario
                    {
                        Num_DNI = model.DniBeneficiario,
                        Txt_Nombre = model.NombreBeneficiario,
                        Txt_Ape_Pat = model.ApellidoPaternoBeneficiario,
                        Txt_Ape_Mat = model.ApellidoMaternoBeneficiario,
                        Po_Cap_Aseg = model.PorcentajeCapitalAsegurado,
                        Fec_Nac = Convert.ToDateTime(model.FechaNacimientoBeneficiario)
                    }
                };

                var poliza = new Poliza
                {
                    Nu_Poliza = model.NumSolicitud,
                    Fe_Creacion = DateTime.Now,
                    Fe_InicioVigencia = Convert.ToDateTime(model.InicioVigencia),
                    Cap_Asegurado = model.CapitalAsegurado,
                    Cod_Plan = model.CodTipoPlan,
                    Cliente = cliente,
                    Beneficiario = beneficiario,
                    Ocupacion = model.Ocupacion,
                    Actividad = model.Actividad,
                    LugarTrabajo = model.LugarTrabajo,
                    IngresoMensual = model.IngresoMensual,
                    Horario = model.Horario,
                    ExpuestoAPeligro = model.ExpuestoAPeligro,
                    MedioTransporte = model.MedioTransporte,
                    FrecuenciaViaje = model.FrecuenciaViaje,
                    DeporteAficion = model.DeporteAficion,
                    RiesgoAccidente = model.RiesgoAccidente,
                    CoberturaRiego = model.CoberturaRiego,
                    Estatura = model.Estatura,
                    Peso = model.Peso,
                    ConsumeTabaco = model.ConsumeTabaco,
                    ConsumeAlcohol = model.ConsumeAlcohol,
                    InsuficienciaRenal = model.InsuficienciaRenal,
                    Diabetes = model.Diabetes,
                    Cancer = model.Cancer,
                    Epilepsia = model.Epilepsia,
                    AfeccionCardiaca = model.AfeccionCardiaca,
                    HipertensionArterial = model.HipertensionArterial,
                    TranstornoMental = model.TranstornoMental
                };

                _polizaBL.Add(poliza);

            }
            catch (Exception)
            {

            }

            return Json(Url.Action("Index", "Poliza"));
        }

        [HttpPost]
        public ActionResult EditarPoliza(PolizaModel model)
        {
            try
            {
                var poliza = _polizaBL.Get(model.CodPoliza);

                _polizaBL.Update(poliza);
            }
            catch (Exception)
            {

            }

            return Json(Url.Action("Index", "Poliza"));
        }
        
        #endregion

        #region Metodos Privados

        private List<Comun> GetTipoPlanList()
        {
            return _polizaBL.TipoPlanAll().ToList().ConvertAll(p => new Comun
            {
                Nombre = p.Nro_Plan,
                Valor = Convert.ToString(p.Cod_Plan)
            });
        }

        private List<Comun> GetTipoPolizaList()
        {
            return _polizaBL.TipoPlanAll().ToList().ConvertAll(p => new Comun
            {
                Nombre = p.Nro_Plan,
                Valor = Convert.ToString(p.Cod_Plan)
            });
        }

        #endregion
    }
}