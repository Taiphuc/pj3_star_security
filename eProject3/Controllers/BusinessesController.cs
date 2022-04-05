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
    public class BusinessesController : Controller
    {
        private Project3DbContext db = new Project3DbContext();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetBusiness()
        {
            List<Business> businesses = new List<Business>();
            businesses = db.Business.Where(x => !x.IsDeleted).OrderByDescending(x => x.CreatedOn).Take(4).ToList();
            ViewBag.Count = businesses.Count();
            return PartialView(businesses);
        }
    }
}
