using eProject3.Model.DAL;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace eProject3.Controllers
{
    public class NewController : Controller
    {
        private Project3DbContext db = new Project3DbContext();
        // GET: New
        public ActionResult GetAllNews(int? page)
        {
            List<News> news = new List<News>();
            news = db.News.Where(x => x.IsDeleted == false).OrderByDescending(x => x.CreatedOn).ToList();
            ViewBag.Count = news.Count();
            int pageSize = 5;
            int pageNumber = (page ?? 1);
            return View(news.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult NewsDetail(Guid id)
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

        public ActionResult GetNewsCategory()
        {
            List<NewsCategory> newsCategories = new List<NewsCategory>();
            newsCategories = db.NewsCategory.Where(x => x.IsDeleted == false).ToList();
            ViewBag.Count = newsCategories.Count();
            return PartialView(newsCategories);
        }

        public ActionResult NewsCategoryDetail(NewsCategory newsCategory)
        {
            List<News> list = new List<News>();
            list = db.News.Where(x => x.IsDeleted == false && x.NewsCategoryId == newsCategory.Id).ToList();
            ViewBag.Count = list.Count();
            return View(list);
        }
    }
}