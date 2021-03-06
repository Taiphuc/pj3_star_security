using eProject3.Common;
using eProject3.Model.Common;
using eProject3.Model.DAL;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace eProject3.Areas.Admin.Controllers
{
    public class NewsController : BaseController
    {
        private Project3DbContext db = new Project3DbContext();
        // GET: Admin/News
        public ActionResult Index(string sortOrder, string currentFilter, int? page, string search)
        {
            CountMessage();
            CountOrder();
            //CountProduct();
            //Sort
            ViewBag.CurrentSort = sortOrder;
            ViewBag.TitleSortParm = String.IsNullOrEmpty(sortOrder) ? "title_desc" : "";
            ViewBag.NewsCategorySortParm = sortOrder == "NewsCategory" ? "newsCategory_desc" : "NewsCategory";
            var news = db.News.Include(x => x.NewsCategory).Where(x => !x.IsDeleted);

            //Filter
            if (search != null)
            {
                page = 1;
            }
            else
            {
                search = currentFilter;
            }

            ViewBag.CurrentFilter = search;

            if (!string.IsNullOrEmpty(search))
            {
                news = news.Where(s => s.Name.Contains(search) || s.NewsCategory.Name.Contains(search)
                || s.Summary.Contains(search));
            }

            switch (sortOrder)
            {
                case "title_desc":
                    news = news.OrderByDescending(s => s.Name);
                    break;
                case "NewsCategory":
                    news = news.OrderBy(s => s.NewsCategory.Name);
                    break;
                case "newsCategory_desc":
                    news = news.OrderByDescending(s => s.NewsCategory.Name);
                    break;
                default:
                    news = news.OrderBy(s => s.Name);
                    break;
            }
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            ViewBag.SearchString = search;
            return View(news.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Create()
        {
            CountMessage();
            //CountProduct();
            CountOrder();
            ViewBag.NewsCategoryId = new SelectList(db.NewsCategory, "Id", "Name");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(News news)
        {
            if (ModelState.IsValid)
            {
                var session = (UserLogin)Session[CommonConstants.USER_SESSION];
                news.Id = Guid.NewGuid();
                AuditTable.InsertAuditFields(news);
                news.CreatedBy = session.UserName;
                news.Id = Guid.NewGuid();
                db.News.Add(news);
                db.SaveChanges();
                SetAlert("Thêm mới thành công", "success");
                return Redirect("/Admin/News");
            }
            ViewBag.NewsCategoryId = new SelectList(db.NewsCategory, "Id", "Name", news.NewsCategoryId);
            return View(news);
        }

        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }

        public ActionResult Edit(Guid? id)
        {
            CountMessage();
            //CountProduct();
            CountOrder();
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            ViewBag.NewsCategoryId = new SelectList(db.NewsCategory, "Id", "Name", news.NewsCategoryId);
            return View(news);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(News news)
        {
            if (ModelState.IsValid)
            {
                AuditTable.UpdateAuditFields(news);
                var session = (UserLogin)Session[CommonConstants.USER_SESSION];
                news.ModifiedBy = session.UserName;
                db.Entry(news).State = EntityState.Modified;
                db.SaveChanges();
                SetAlert("Cập nhật thành công", "success");
                return Redirect("/Admin/News");
            }
            ViewBag.NewsCategoryId = new SelectList(db.NewsCategory, "Id", "Name", news.NewsCategoryId);
            return View(news);
        }

        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            News news = db.News.Find(id);
            news.IsDeleted = true;
            db.SaveChanges();
            SetAlert("Xóa thành công", "success");
            return Redirect("/Admin/News");
        }
    }
}