using Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace Final.Controllers
{
    public class InicioController : Controller
    {
        private DBESTUDIO2010Entities db = new DBESTUDIO2010Entities();
        // GET: Inicio
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ListarAlumnos()
        {
            var alumnos = db.ALUMNOS.ToList();
            return View(alumnos);
        }

        public ActionResult BuscarxCarrera()
        {

            return View();
        }
        public ActionResult ResultxCarrera()
        {
            Buscar1 b = new Buscar1();
            var s = Convert.ToString(Request.Form["txtcurso"]);
            System.Diagnostics.Debug.WriteLine("asdasdasda"+s);
            var resl = db.ALUMNOS.Where(r=>r.codcar==s).ToList();

            return View(resl);
        }

        public ActionResult BuscarxCarreraxAnio()
        {
            return View();
        }

        public ActionResult ResultadoBuscarxCarreraxAnio()
        {
            var carrera = Convert.ToString(Request.Form["txtcurso"]);
            var anio =  DateTime.Parse(Request.Form["txtanio"]).Year;

            var resl2 = db.ALUMNOS.Where(c => c.codcar == carrera).Where(x=>x.fecha_ins.Value.Year==anio);

            System.Diagnostics.Debug.WriteLine("asdasdasda");
            return View(resl2);
        }

        public ActionResult BuscarxNotas()
        {
            return View();
        }

        public ActionResult Last()
        {
            var alumno = Convert.ToString(Request.Form["txtnombre"]);
            var curso = Convert.ToString(Request.Form["txtcurso"]);
            var final = (from n in db.NOTAS
                         join a in db.ALUMNOS on n.codalu equals a.codalu
                         join c in db.CURSOS on n.codcur equals c.codcur
                         where a.nomalu == alumno && c.nomcur == curso
                         select new
                         {
                             nombre = a.nomalu,
                             curso = c.nomcur,
                             finalm = (n.pp * 0.2 + n.pt * 0.3 + n.ex * 0.5)
                         }).Take(1).ToList();

            System.Diagnostics.Debug.WriteLine(string.Join("\t",final));
            System.Diagnostics.Debug.WriteLine(final[0].curso);
            Final2 fin = new Final2();
            fin.curso = final[0].curso;
            fin.nombre = final[0].nombre;
            fin.final = final[0].finalm;

            return View(final);
        }

    }

}