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
    public class VisitaController : Controller
    {
        #region Variables

        private readonly VisitaBusiness _visitaBL;

        #endregion

        #region Constructor

        public VisitaController()
        {
            _visitaBL = new VisitaBusiness();
        }

        #endregion

        #region Metodos Publicos

        public ActionResult Index()
        {
            var list = _visitaBL.FindAll().OrderByDescending(p => p.Cod_Visita).ToList().ConvertAll(p => new VisitaModel
            {
                CodVisita = p.Cod_Visita,
                DniProspecto = p.Prospecto.Num_DNI,
                NombreProspecto = p.Prospecto.Txt_Pros,
                FechaInicial = p.Fec_Ini.GetDateTime(false),
                FechaFinal = p.Fec_Fin.GetDateTime(false),
                NombreTipoVisita = p.TipoVisita.Nro_Visita
            });
            return View(list);
        }

        [HttpPost]
        public ActionResult Index(string fechaIni, string fechaFin, string dniProspecto, string nombreProspecto)
        {
            ViewBag.FechaIni = fechaIni;
            ViewBag.FechaFin = fechaFin;
            ViewBag.Dni = dniProspecto;
            ViewBag.Nombre = nombreProspecto;

            var list =
                _visitaBL.FindAll(fechaIni, fechaFin, dniProspecto, nombreProspecto).ToList().ConvertAll(p => new VisitaModel
                {
                    CodVisita = p.Cod_Visita,
                    DniProspecto = p.Prospecto.Num_DNI,
                    NombreProspecto = p.Prospecto.Txt_Pros,
                    FechaInicial = p.Fec_Ini.GetDateTime(false),
                    FechaFinal = p.Fec_Fin.GetDateTime(false),
                    NombreTipoVisita = p.TipoVisita.Nro_Visita
                });

            return View(list);
        }

        public ActionResult CrearVisita()
        {
            var model = new VisitaModel
            {
                Accion = "CrearVisita",
                TipoVisitaList = GetTipoVisitaList()
            };

            model.TipoVisitaList.Insert(0, new Comun { Nombre = "[SELECCIONAR]", Valor = string.Empty });

            return View("Edit", model);
        }

        public ActionResult EditarVisita(int id)
        {
            var visita = _visitaBL.Get(id);

            var model = new VisitaModel
            {
                CodVisita = visita.Cod_Visita,
                CodProspecto = visita.Cod_Pros,
                NombreProspecto = visita.Prospecto.Txt_Pros,
                DniProspecto = visita.Prospecto.Num_DNI,
                ApellidoProspecto = visita.Prospecto.Txt_Ape_Pat + " " + visita.Prospecto.Txt_Ape_Mat,
                FechaInicial = visita.Fec_Ini.GetDateTime(false),
                FechaFinal = visita.Fec_Fin.GetDateTime(false),
                CodTipoVisita = visita.Cod_Tipo_Visita,
                Comentario = visita.Txt_Comentario,
                TipoVisitaList = GetTipoVisitaList(),
                Accion = "EditarVisita"
            };

            model.TipoVisitaList.Insert(0, new Comun { Nombre = "[SELECCIONAR]", Valor = string.Empty });

            return View("Edit", model);
        }

        [HttpPost]
        public ActionResult CrearVisita(VisitaModel model)
        {
            try
            {
                var visita = new Visita
                {
                    Cod_Pros = model.CodProspecto,
                    Fec_Ini = Convert.ToDateTime(model.FechaInicial),
                    Fec_Fin = Convert.ToDateTime(model.FechaFinal),
                    Cod_Tipo_Visita = model.CodTipoVisita,
                    Txt_Comentario = model.Comentario
                };

                _visitaBL.Add(visita);

            }
            catch (Exception)
            {

            }

            return Json(Url.Action("Index", "Visita"));
        }

        [HttpPost]
        public ActionResult EditarVisita(VisitaModel model)
        {
            try
            {
                var visita = _visitaBL.Get(model.CodVisita);

                visita.Cod_Pros = model.CodProspecto;
                visita.Fec_Ini = Convert.ToDateTime(model.FechaInicial);
                visita.Fec_Fin = Convert.ToDateTime(model.FechaFinal);
                visita.Cod_Tipo_Visita = model.CodTipoVisita;
                visita.Txt_Comentario = model.Comentario;

                _visitaBL.Update(visita);
            }
            catch (Exception)
            {

            }

            return Json(Url.Action("Index", "Visita"));
        }

        public ActionResult VerVisita(int id)
        {
            var visita = _visitaBL.Get(id);

            var model = new VisitaModel
            {
                CodVisita = visita.Cod_Visita,
                CodProspecto = visita.Cod_Pros,
                NombreProspecto = visita.Prospecto.Txt_Pros,
                DniProspecto = visita.Prospecto.Num_DNI,
                ApellidoProspecto = visita.Prospecto.Txt_Ape_Pat + " " + visita.Prospecto.Txt_Ape_Mat,
                FechaInicial = visita.Fec_Ini.GetDateTime(false),
                FechaFinal = visita.Fec_Fin.GetDateTime(false),
                Comentario = visita.Txt_Comentario,
                NombreTipoVisita = visita.TipoVisita.Nro_Visita
            };

            return View("Ver", model);
        }

        #endregion

        #region Metodos Privados

        private List<Comun> GetTipoVisitaList()
        {
            return _visitaBL.TipoVisitasAll().ToList().ConvertAll(p => new Comun
            {
                Nombre = p.Nro_Visita,
                Valor = Convert.ToString(p.Cod_Tipo_Visita)
            });
        }

        #endregion
    }
}