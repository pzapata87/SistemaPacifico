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
            var list = _polizaBL.FindAll().OrderByDescending(p => p.Co_Poliza).ToList().ConvertAll(p => new PolizaModel
            {
                CodPoliza = p.Co_Poliza,
                NumSolicitud = p.Nu_Poliza,
                DniCliente = p.Cliente.Nu_DNI,
                NombreCliente = p.Cliente.No_Cliente,
                NombreTipoPoliza = p.TipoPlan.Nro_Plan,
                CapitalAsegurado = p.Cap_Asegurado,
                FechaIngreso = p.Fe_Creacion.GetDate()
            });

            return View(list);
        }

        [HttpPost]
        public ActionResult Index(string numSolicitud, string fechaIngreso, decimal? monto)
        {
            var list = _polizaBL.FindAll(numSolicitud, fechaIngreso, monto).OrderByDescending(p => p.Co_Poliza).ToList().ConvertAll(p => new PolizaModel
            {
                CodPoliza = p.Co_Poliza,
                NumSolicitud = p.Nu_Poliza,
                DniCliente = p.Cliente.Nu_DNI,
                NombreCliente = p.Cliente.No_Cliente,
                NombreTipoPoliza = p.TipoPlan.Nro_Plan,
                CapitalAsegurado = p.Cap_Asegurado,
                FechaIngreso = p.Fe_Creacion.GetDate()
            });

            return View(list);
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
            var beneficiario = poliza.Beneficiario.ElementAt(0);

            var model = new PolizaModel
            {
                CodPoliza = poliza.Co_Poliza,
                TipoPlanList = GetTipoPlanList(),
                NumSolicitud = poliza.Nu_Poliza,
                InicioVigencia = poliza.Fe_InicioVigencia.GetDate(),
                CapitalAsegurado = poliza.Cap_Asegurado,
                CodTipoPlan = poliza.Co_Poliza,
                Ocupacion = poliza.Ocupacion,
                Actividad = poliza.Actividad,
                LugarTrabajo = poliza.LugarTrabajo,
                IngresoMensual = poliza.IngresoMensual,
                Horario = poliza.Horario,
                ExpuestoAPeligro = poliza.ExpuestoAPeligro,
                MedioTransporte = poliza.MedioTransporte,
                FrecuenciaViaje = poliza.FrecuenciaViaje,
                DeporteAficion = poliza.DeporteAficion,
                RiesgoAccidente = poliza.RiesgoAccidente,
                CoberturaRiego = poliza.CoberturaRiego,
                Estatura = poliza.Estatura,
                Peso = poliza.Peso,
                ConsumeTabaco = poliza.ConsumeTabaco,
                ConsumeAlcohol = poliza.ConsumeAlcohol,
                InsuficienciaRenal = poliza.InsuficienciaRenal,
                Diabetes = poliza.Diabetes,
                Cancer = poliza.Cancer,
                Epilepsia = poliza.Epilepsia,
                AfeccionCardiaca = poliza.AfeccionCardiaca,
                HipertensionArterial = poliza.HipertensionArterial,
                TranstornoMental = poliza.TranstornoMental,
                DniCliente = poliza.Cliente.Nu_DNI,
                NombreCliente = poliza.Cliente.No_Cliente,
                ApellidoPaternoCliente = poliza.Cliente.No_ApePaterno,
                ApellidoMaternoCliente = poliza.Cliente.No_ApeMaterno,
                FechaNacimientoCliente = poliza.Cliente.Fe_Nacimiento.GetDate(),
                LugarNacimientoCliente = poliza.Cliente.Tx_LugarNacimiento,
                DireccionCliente = poliza.Cliente.Tx_Direccion,
                EstadoCivilCliente = poliza.Cliente.Fi_EstadoCivil,
                SexoCliente = poliza.Cliente.Fi_Sexo,
                DniBeneficiario = beneficiario.Num_DNI,
                NombreBeneficiario = beneficiario.Txt_Nombre,
                ApellidoPaternoBeneficiario = beneficiario.Txt_Ape_Pat,
                ApellidoMaternoBeneficiario = beneficiario.Txt_Ape_Mat,
                PorcentajeCapitalAsegurado = beneficiario.Po_Cap_Aseg,
                FechaNacimientoBeneficiario = beneficiario.Fec_Nac.GetDate(),
                Accion = "EditarPoliza"
            };

            model.TipoPlanList.Insert(0, new Comun { Nombre = "[SELECCIONAR]", Valor = string.Empty });

            return View("Edit", model);
        }

        [HttpPost]
        public ActionResult CrearPoliza(PolizaModel model)
        {
            var jsonResponse = new JsonResponse { Success = false };
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
                jsonResponse.Success = true;
                jsonResponse.Data = Url.Action("Index", "Poliza");

            }
            catch (Exception)
            {

            }

            return Json(jsonResponse, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult EditarPoliza(PolizaModel model)
        {
            var jsonResponse = new JsonResponse { Success = false };
            try
            {
                var poliza = _polizaBL.Get(model.CodPoliza);

                poliza.Fe_InicioVigencia = Convert.ToDateTime(model.InicioVigencia);
                poliza.Cap_Asegurado = model.CapitalAsegurado;
                poliza.Cod_Plan = model.CodTipoPlan;

                poliza.Cliente.Nu_DNI = model.DniCliente;
                poliza.Cliente.No_Cliente = model.NombreCliente;
                poliza.Cliente.No_ApePaterno = model.ApellidoPaternoCliente;
                poliza.Cliente.No_ApeMaterno = model.ApellidoMaternoCliente;
                poliza.Cliente.Fe_Nacimiento = Convert.ToDateTime(model.FechaNacimientoCliente);
                poliza.Cliente.Tx_LugarNacimiento = model.LugarNacimientoCliente;
                poliza.Cliente.Tx_Direccion = model.DireccionCliente;
                poliza.Cliente.Fi_EstadoCivil = model.EstadoCivilCliente;
                poliza.Cliente.Fi_Sexo = model.SexoCliente;

                var beneficiario = poliza.Beneficiario.ElementAt(0);

                beneficiario.Num_DNI = model.DniBeneficiario;
                beneficiario.Txt_Nombre = model.NombreBeneficiario;
                beneficiario.Txt_Ape_Pat = model.ApellidoPaternoBeneficiario;
                beneficiario.Txt_Ape_Mat = model.ApellidoMaternoBeneficiario;
                beneficiario.Po_Cap_Aseg = model.PorcentajeCapitalAsegurado;
                beneficiario.Fec_Nac = Convert.ToDateTime(model.FechaNacimientoBeneficiario);


                poliza.Ocupacion = model.Ocupacion;
                poliza.Actividad = model.Actividad;
                poliza.LugarTrabajo = model.LugarTrabajo;
                poliza.IngresoMensual = model.IngresoMensual;
                poliza.Horario = model.Horario;
                poliza.ExpuestoAPeligro = model.ExpuestoAPeligro;
                poliza.MedioTransporte = model.MedioTransporte;
                poliza.FrecuenciaViaje = model.FrecuenciaViaje;
                poliza.DeporteAficion = model.DeporteAficion;
                poliza.RiesgoAccidente = model.RiesgoAccidente;
                poliza.CoberturaRiego = model.CoberturaRiego;
                poliza.Estatura = model.Estatura;
                poliza.Peso = model.Peso;
                poliza.ConsumeTabaco = model.ConsumeTabaco;
                poliza.ConsumeAlcohol = model.ConsumeAlcohol;
                poliza.InsuficienciaRenal = model.InsuficienciaRenal;
                poliza.Diabetes = model.Diabetes;
                poliza.Cancer = model.Cancer;
                poliza.Epilepsia = model.Epilepsia;
                poliza.AfeccionCardiaca = model.AfeccionCardiaca;
                poliza.HipertensionArterial = model.HipertensionArterial;
                poliza.TranstornoMental = model.TranstornoMental;

                _polizaBL.Update(poliza);
                jsonResponse.Success = true;
                jsonResponse.Data = Url.Action("Index", "Poliza");
            }
            catch (Exception)
            {

            }

            return Json(jsonResponse, JsonRequestBehavior.AllowGet);
        }

        public ActionResult VerPoliza(int id)
        {
            var poliza = _polizaBL.Get(id);
            var beneficiario = poliza.Beneficiario.ElementAt(0);

            var model = new PolizaModel
            {
                CodPoliza = poliza.Co_Poliza,
                TipoPlanList = GetTipoPlanList(),
                NumSolicitud = poliza.Nu_Poliza,
                InicioVigencia = poliza.Fe_InicioVigencia.GetDate(),
                CapitalAsegurado = poliza.Cap_Asegurado,
                CodTipoPlan = poliza.Co_Poliza,
                Ocupacion = poliza.Ocupacion,
                Actividad = poliza.Actividad,
                LugarTrabajo = poliza.LugarTrabajo,
                IngresoMensual = poliza.IngresoMensual,
                Horario = poliza.Horario,
                ExpuestoAPeligro = poliza.ExpuestoAPeligro,
                MedioTransporte = poliza.MedioTransporte,
                FrecuenciaViaje = poliza.FrecuenciaViaje,
                DeporteAficion = poliza.DeporteAficion,
                RiesgoAccidente = poliza.RiesgoAccidente,
                CoberturaRiego = poliza.CoberturaRiego,
                Estatura = poliza.Estatura,
                Peso = poliza.Peso,
                ConsumeTabaco = poliza.ConsumeTabaco,
                ConsumeAlcohol = poliza.ConsumeAlcohol,
                InsuficienciaRenal = poliza.InsuficienciaRenal,
                Diabetes = poliza.Diabetes,
                Cancer = poliza.Cancer,
                Epilepsia = poliza.Epilepsia,
                AfeccionCardiaca = poliza.AfeccionCardiaca,
                HipertensionArterial = poliza.HipertensionArterial,
                TranstornoMental = poliza.TranstornoMental,
                DniCliente = poliza.Cliente.Nu_DNI,
                NombreCliente = poliza.Cliente.No_Cliente,
                ApellidoPaternoCliente = poliza.Cliente.No_ApePaterno,
                ApellidoMaternoCliente = poliza.Cliente.No_ApeMaterno,
                FechaNacimientoCliente = poliza.Cliente.Fe_Nacimiento.GetDate(),
                LugarNacimientoCliente = poliza.Cliente.Tx_LugarNacimiento,
                DireccionCliente = poliza.Cliente.Tx_Direccion,
                EstadoCivilCliente = poliza.Cliente.Fi_EstadoCivil,
                SexoCliente = poliza.Cliente.Fi_Sexo,
                DniBeneficiario = beneficiario.Num_DNI,
                NombreBeneficiario = beneficiario.Txt_Nombre,
                ApellidoPaternoBeneficiario = beneficiario.Txt_Ape_Pat,
                ApellidoMaternoBeneficiario = beneficiario.Txt_Ape_Mat,
                PorcentajeCapitalAsegurado = beneficiario.Po_Cap_Aseg,
                FechaNacimientoBeneficiario = beneficiario.Fec_Nac.GetDate(),
                Accion = "EditarPoliza"
            };

            return View("Ver", model);
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