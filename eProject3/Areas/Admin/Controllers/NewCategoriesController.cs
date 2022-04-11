using eProject3.Common;
using eProject3.Model.Common;
using eProject3.Model.DAL;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace eProject3.Areas.Admin.Controllers
{
    public class NewCategoriesController : BaseController
    {
        private Project3DbContext db = new Project3DbContext();
        // GET: Admin/NewCategories
        public ActionResult Index()
        {
            CountMessage();
            CountOrder();
            return View(db.NewsCategory.Where(x => x.IsDeleted == false).OrderByDescending(x => x.CreatedOn).ToList());
        }

        public ActionResult Create()
        {
            CountMessage();
            CountOrder();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(NewsCategory newsCategory)
        {
            if (ModelState.IsValid)
            {
                newsCategory.Id = Guid.NewGuid();
                AuditTable.InsertAuditFields(newsCategory);
                var session = (UserLogin)Session[CommonConstants.USER_SESSION];
                newsCategory.CreatedBy = session.UserName;
                newsCategory.Id = Guid.NewGuid();
                db.NewsCategory.Add(newsCategory);
                db.SaveChanges();
                SetAlert("Thêm mới thành công", "success");
                return Redirect("/Admin/NewCategories");
            }
            return View(newsCategory);
        }

        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NewsCategory newsCategory = db.NewsCategory.Find(id);
            if (newsCategory == null)
            {
                return HttpNotFound();
            }
            return View(newsCategory);
        }

        public ActionResult Edit(Guid? id)
        {
            CountMessage();
            CountOrder();
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NewsCategory newsCategory = db.NewsCategory.Find(id);
            if (newsCategory == null)
            {
                return HttpNotFound();
            }
            return View(newsCategory);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(NewsCategory newsCategory)
        {
            if (ModelState.IsValid)
            {
                AuditTable.UpdateAuditFields(newsCategory);
                var session = (UserLogin)Session[CommonConstants.USER_SESSION];
                newsCategory.ModifiedBy = session.UserName;
                db.Entry(newsCategory).State = EntityState.Modified;
                db.SaveChanges();
                SetAlert("Cập nhật thành công", "success");
                return Redirect("/Admin/Categories");
            }
            return View(newsCategory);
        }

        public ActionResult Delete(Guid? id)
        {
            var isExists = db.News.Where(x => x.NewsCategoryId == id);
            if (isExists != null)
            {
                return PartialView("_Delete");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NewsCategory newsCategory = db.NewsCategory.Find(id);
            if (newsCategory == null)
            {
                return HttpNotFound();
            }
            return View(newsCategory);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            NewsCategory newsCategory = db.NewsCategory.Find(id);
            newsCategory.IsDeleted = true;
            db.SaveChanges();
            return Redirect("/Admin/NewCategories");
        }
    }
}