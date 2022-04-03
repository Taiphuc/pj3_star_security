using eProject3.Model.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace eProject3.Controllers
{
    public class BusinessController : Controller
    {
        private Project3DbContext db = new Project3DbContext();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Get()
        {
            List<Business> businesses = new List<Business>();
            businesses = db.Business.Where(x => !x.IsDeleted).OrderBy(x => x.CreatedOn).Take(4).ToList();
            ViewBag.Count = businesses.Count();
            return PartialView(businesses);
        }
    }
}