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

        public ActionResult Detail(Guid id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Business business = db.Business.Find(id);
            if (business == null)
            {
                return HttpNotFound();
            }
            return View(business);
        }

        public ActionResult GetInvolve(Guid? id)
        {
            Business business = db.Business.Find(id);
            List<Business> businesses = new List<Business>();
            businesses = db.Business.Where(x => x.Id != business.Id && !x.IsDeleted).OrderByDescending(x => x.CreatedOn).Take(3).ToList();
            ViewBag.Count = businesses.Count();
            return PartialView(businesses);
        }
    }
}
