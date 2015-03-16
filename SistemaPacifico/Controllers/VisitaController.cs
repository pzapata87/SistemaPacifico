using System.Linq;
using System.Web.Mvc;
using Pacifico.Bussines;
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
            var list = _visitaBL.FindAll().ToList().ConvertAll(p => new VisitaModel
            {
                CodVisita = p.Cod_Visita,
                NombreProspecto = p.Prospecto.Txt_Pros,
                FechaInicial = p.Fec_Ini.GetDateTime(false),
                FechaFinal = p.Fec_Fin.GetDateTime(false),
                NombreTipoVisita = p.TipoVisita.Nro_Visita
            });
            return View(list);
        }

        #endregion
    }
}