using eProject3.Model.Common;
using eProject3.Model.DAL;
using eProject3.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace eProject3.Controllers
{
    public class HomeController : BaseController
    {
        private Project3DbContext db = new Project3DbContext();
        private const string CartSession = "CartSession";
        public ActionResult Index()
        {
            return View();
        }
        [ChildActionOnly]
        public ActionResult MainMenu()
        {
            List<Menu> menu = new List<Menu>();
            menu = db.Menu.Where(x => x.ParentId == null && !x.IsDeleted).OrderBy(x => x.DisplayOrder).ToList();
            return PartialView(menu);
        }

        [ChildActionOnly]
        public ActionResult SubMenu(int parentId)
        {
            List<Menu> sMenu = new List<Menu>();
            sMenu = db.Menu.Where(x => x.ParentId == parentId && !x.IsDeleted).OrderBy(x => x.DisplayOrder).ToList();
            ViewBag.Count = sMenu.Count();
            return PartialView(sMenu);
        }

        [ChildActionOnly]
        public ActionResult Contact()
        {
            List<Contact> contact = new List<Contact>();
            contact = db.Contact.Where(x => !x.IsDeleted).ToList();
            ViewBag.Count = contact.Count();
            return PartialView(contact);
        }

        [ChildActionOnly]
        public PartialViewResult Slide()
        {
            List<Slide> slide = new List<Slide>();
            slide = db.Slide.Where(x => !x.IsDeleted).ToList();
            ViewBag.Count = slide.Count();
            return PartialView(slide);
        }
    }
}