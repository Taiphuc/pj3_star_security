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
    public class BusinessesController : BaseController
    {
        private Project3DbContext db = new Project3DbContext();

        // GET: Admin/Businesses
        public ActionResult Index()
        {
            CountMessage();
            CountOrder();
            return View(db.Business.ToList());
        }

        // GET: Admin/Businesses/Details/5
        public ActionResult Details(Guid? id)
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

        // GET: Admin/Businesses/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Businesses/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Description,UrlImage,CreatedOn,CreatedBy,ModifiedOn,ModifiedBy,IsDeleted")] Business business)
        {
            if (ModelState.IsValid)
            {
                business.Id = Guid.NewGuid();
                AuditTable.InsertAuditFields(business);
                var session = (UserLogin)Session[CommonConstants.USER_SESSION];
                business.CreatedBy = session.UserName;
                db.Business.Add(business);
                db.SaveChanges();
                SetAlert("Thêm mới thành công", "success");
                return RedirectToAction("/");
            }

            return View(business);
        }

        // GET: Admin/Businesses/Edit/5
        public ActionResult Edit(Guid? id)
        {
            CountMessage();
            CountOrder();
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

        // POST: Admin/Businesses/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Description,UrlImage,CreatedOn,CreatedBy,ModifiedOn,ModifiedBy,IsDeleted")] Business business)
        {
            if (ModelState.IsValid)
            {
                AuditTable.UpdateAuditFields(business);
                var session = (UserLogin)Session[CommonConstants.USER_SESSION];
                business.ModifiedBy = session.UserName;
                db.Entry(business).State = EntityState.Modified;
                db.SaveChanges();
                SetAlert("Cập nhật thành công", "success");
                return Redirect("/Admin/Businesses");
            }
            return View(business);
        }

        // GET: Admin/Businesses/Delete/5
        public ActionResult Delete(Guid? id)
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

        // POST: Admin/Businesses/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Business business = db.Business.Find(id);
            db.Business.Remove(business);
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
