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
    public class CareersController : Controller
    {
        private Project3DbContext db = new Project3DbContext();

        // GET: Careers
        public ActionResult Index()
        {

            var career = db.Career.Include(c => c.Business).Where(x => !x.IsDeleted).Take(3).ToList();
            ViewBag.Count = career.Count();
            return PartialView(career.ToList());
        }

        // GET: Careers/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Career career = db.Career.Find(id);
            if (career == null)
            {
                return HttpNotFound();
            }
            return View(career);
        }

        // GET: Careers/Create
        public ActionResult Create()
        {
            ViewBag.BusinessId = new SelectList(db.Business, "Id", "Name");
            return View();
        }

        // POST: Careers/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Description,UrlImage,CreatedOn,CreatedBy,ModifiedOn,ModifiedBy,IsDeleted,BusinessId")] Career career)
        {
            if (ModelState.IsValid)
            {
                career.Id = Guid.NewGuid();
                db.Career.Add(career);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.BusinessId = new SelectList(db.Business, "Id", "Name", career.BusinessId);
            return View(career);
        }

        // GET: Careers/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Career career = db.Career.Find(id);
            if (career == null)
            {
                return HttpNotFound();
            }
            ViewBag.BusinessId = new SelectList(db.Business, "Id", "Name", career.BusinessId);
            return View(career);
        }

        // POST: Careers/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Description,UrlImage,CreatedOn,CreatedBy,ModifiedOn,ModifiedBy,IsDeleted,BusinessId")] Career career)
        {
            if (ModelState.IsValid)
            {
                db.Entry(career).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.BusinessId = new SelectList(db.Business, "Id", "Name", career.BusinessId);
            return View(career);
        }

        // GET: Careers/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Career career = db.Career.Find(id);
            if (career == null)
            {
                return HttpNotFound();
            }
            return View(career);
        }

        // POST: Careers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Career career = db.Career.Find(id);
            db.Career.Remove(career);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
