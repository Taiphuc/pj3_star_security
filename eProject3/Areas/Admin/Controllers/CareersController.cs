using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using eProject3.Common;
using eProject3.Model.Common;
using eProject3.Model.DAL;

namespace eProject3.Areas.Admin.Controllers
{
    public class CareersController : BaseController
    {
        private Project3DbContext db = new Project3DbContext();

        // GET: Admin/Careers
        public ActionResult Index()
        {
            CountMessage();
            CountOrder();
            return View(db.Career.ToList());
        }

        // GET: Admin/Careers/Details/5
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

        // GET: Admin/Careers/Create
        public ActionResult Create()
        {
            CountMessage();
            CountOrder();
            ViewBag.BusinessId = new SelectList(db.Business, "Id", "Name");
            return View();
        }

        // POST: Admin/Careers/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Career career)
        {
            if (ModelState.IsValid)
            {
                career.Id = Guid.NewGuid();
                AuditTable.InsertAuditFields(career);
                var session = (UserLogin)Session[CommonConstants.USER_SESSION];
                career.CreatedBy = session.UserName;
                db.Career.Add(career);
                db.SaveChanges();
                SetAlert("Thêm mới thành công", "success");
                return RedirectToAction("/");
            }

            return View(career);
        }

        // GET: Admin/Careers/Edit/5
        public ActionResult Edit(Guid? id)
        {
            CountMessage();
            CountOrder();
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Career career = db.Career.Find(id);
            if (career == null)
            {
                return HttpNotFound();
            }
            ViewBag.BusinessId = new SelectList(db.Business, "Id", "Name");
            return View(career);
        }

        // POST: Admin/Careers/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Career career)
        {
            if (ModelState.IsValid)
            {
                AuditTable.UpdateAuditFields(career);
                var session = (UserLogin)Session[CommonConstants.USER_SESSION];
                career.ModifiedBy = session.UserName;
                db.Entry(career).State = EntityState.Modified;
                db.SaveChanges();
                SetAlert("Cập nhật thành công", "success");
                return Redirect("/Admin/Careers");
            }
            return View(career);
        }

        // GET: Admin/Careers/Delete/5
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

        // POST: Admin/Careers/Delete/5
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
