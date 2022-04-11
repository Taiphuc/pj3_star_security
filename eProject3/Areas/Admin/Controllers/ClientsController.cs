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
    public class ClientsController : BaseController
    {
        private Project3DbContext db = new Project3DbContext();

        // GET: Admin/Clients
        public ActionResult Index()
        {
            CountMessage();
            CountOrder();
            return View(db.Client.Where(x => !x.IsDeleted).OrderByDescending(x => x.CreatedOn).ToList());
        }

        // GET: Admin/Clients/Details/5
        public ActionResult Details(Guid? id)
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

        // GET: Admin/Clients/Create
        public ActionResult Create()
        {
            CountMessage();
            CountOrder();
            return View();
        }

        // POST: Admin/Clients/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,UrlImage,Address,Email,Phone,CreatedOn,CreatedBy,ModifiedOn,ModifiedBy,IsDeleted")] Client client)
        {
            if (ModelState.IsValid)
            {
                client.Id = Guid.NewGuid();
                AuditTable.InsertAuditFields(client);
                var session = (UserLogin)Session[CommonConstants.USER_SESSION];
                client.CreatedBy = session.UserName;
                db.Client.Add(client);
                db.SaveChanges();
                SetAlert("Thêm mới thành công", "success");
                return RedirectToAction("/Admin/Clients");
            }

            return View(client);
        }

        // GET: Admin/Clients/Edit/5
        public ActionResult Edit(Guid? id)
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

        // POST: Admin/Clients/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,UrlImage,Address,Email,Phone,CreatedOn,CreatedBy,ModifiedOn,ModifiedBy,IsDeleted")] Client client)
        {
            if (ModelState.IsValid)
            {
                AuditTable.UpdateAuditFields(client);
                var session = (UserLogin)Session[CommonConstants.USER_SESSION];
                client.ModifiedBy = session.UserName;
                db.Entry(client).State = EntityState.Modified;
                db.SaveChanges();
                SetAlert("Cập nhật thành công", "success");
                return Redirect("/Admin/Clients");
            }
            return View(client);
        }

        // GET: Admin/Clients/Delete/5
        public ActionResult Delete(Guid? id)
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

        // POST: Admin/Clients/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Client client = db.Client.Find(id);
            client.IsDeleted = true;
            db.SaveChanges();
            return RedirectToAction("/Admin/Clients");
        }
    }
}
