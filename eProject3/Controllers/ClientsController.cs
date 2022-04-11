using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using eProject3.Model.DAL;

namespace eProject3.Controllers
{
    public class ClientsController : Controller
    {
        private Project3DbContext db = new Project3DbContext();

        // GET: Clients
        public ActionResult Index()
        {
            List<Client> clients = new List<Client>();
            clients = db.Client.Where(x => !x.IsDeleted).Take(3).ToList();
            ViewBag.Count = clients.Count();
            return PartialView(clients);
        }

        public ActionResult Detail(Guid id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Client client = db.Client.Find(id);
            if (client == null)
            {
                return HttpNotFound();
            }
            return View(client);
        }
    }
}
