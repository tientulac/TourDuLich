using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;
using WebApplication1.Models.DTO;

namespace WebApplication1.Controllers
{
    public class UserPageController : Controller
    {
        private LinqDataContext db = new LinqDataContext();

        // GET: UserPage
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult BuyTicket(OrderDTO req)
        {
            var customerId = db.Customers.Where(x => x.AccountId == req.AccountId).FirstOrDefault().CustomerId;

            req.CreatedAt = DateTime.Now;
            req.QRCode = JsonConvert.SerializeObject(req);
            req.CustomerId = customerId;

            var _order = new Order();
            _order.Status = req.Status;
            _order.CreatedAt = DateTime.Now;
            _order.QRCode = req.QRCode;
            _order.CustomerId = req.CustomerId;
            _order.TotalPrice = req.TotalPrice;
            _order.TicketGrowup = req.TicketGrowup;
            _order.TicketChild = req.TicketChild;
            _order.TourId = req.TourId;
            db.Orders.InsertOnSubmit(_order);
            db.SubmitChanges();

            var tk = db.Accounts.Where(x => x.AccountId == req.AccountId).FirstOrDefault();
            tk.Balance -= req.TotalPrice;
            db.SubmitChanges();

            return Json(new { success = true }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ListTour()
        {
            var lstTour = (from a in db.Tours
                           select new TourDTO
                           {
                               TourId = a.TourId,
                               TourName = a.TourName,
                               StartDate = a.StartDate,
                               EndDate = a.EndDate,
                               TourTime = a.TourTime,
                               LocationFrom = a.LocationFrom,
                               LocationTo = a.LocationTo,
                               Price = a.Price,
                               Poster = a.Poster,
                               Descrip = a.Descrip,
                               VehicleId = a.VehicleId,
                               VehicleName = db.Vehicles.Where(x => x.VehicleId == a.VehicleId).FirstOrDefault().VahicleName ?? "",
                           });
            ViewBag.ListTour = lstTour;
            return View();
        }

        public ActionResult ListHotel()
        {
            ViewBag.ListHotel = db.Hotels.ToList();
            return View();

        }
        public ActionResult TourDetail(int tourId = 0)
        {
            var _tour = (from a in db.Tours.Where(x => x.TourId == tourId)
                           select new TourDTO
                           {
                               TourId = a.TourId,
                               TourName = a.TourName,
                               StartDate = a.StartDate,
                               EndDate = a.EndDate,
                               TourTime = a.TourTime,
                               LocationFrom = a.LocationFrom,
                               LocationTo = a.LocationTo,
                               Price = a.Price,
                               Poster = a.Poster,
                               Descrip = a.Descrip,
                               VehicleId = a.VehicleId,
                               VehicleName = db.Vehicles.Where(x => x.VehicleId == a.VehicleId).FirstOrDefault().VahicleName ?? "",
                           }).FirstOrDefault();
            ViewBag.Tour = _tour;
            ViewBag.TourImage = db.TourImages.Where(x => x.TourId == tourId).ToList();
            ViewBag.TourSchedule = db.TourSchedules.Where(x => x.TourId == tourId).ToList();
            return View();
        }

        public ActionResult ListLocation()
        {
            ViewBag.ListLocation = db.Locations.ToList();
            return View();
        }

        public ActionResult BookingTicket(int id = 0)
        {
            var _tour = (from a in db.Tours.Where(x => x.TourId == id)
                         select new TourDTO
                         {
                             TourId = a.TourId,
                             TourName = a.TourName,
                             StartDate = a.StartDate,
                             EndDate = a.EndDate,
                             TourTime = a.TourTime,
                             LocationFrom = a.LocationFrom,
                             LocationTo = a.LocationTo,
                             Price = a.Price,
                             Poster = a.Poster,
                             Descrip = a.Descrip,
                             VehicleId = a.VehicleId,
                             VehicleName = db.Vehicles.Where(x => x.VehicleId == a.VehicleId).FirstOrDefault().VahicleName ?? "",
                         }).FirstOrDefault();
            ViewBag.Tour = _tour;
            ViewBag.TourId = id;
            ViewBag.ListTicket = db.Tickets.ToList();
            return View();
        }

        public ActionResult Location(int id = 0)
        {
            var _location = db.Locations.Where(x => x.LocationId == id).FirstOrDefault();
            return Json(new { success = true, data = _location }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ListTicket(int account_id)
        {
            var ma = db.Customers.Where(x => x.AccountId == account_id).FirstOrDefault().CustomerId;
            ViewBag.ListTicket = db.Orders.ToList() ?? null;
            ViewBag.Customer = db.Customers.Where(x => x.AccountId == account_id).FirstOrDefault() ?? null;
            ViewBag.Balance = db.Accounts.Where(x => x.AccountId == account_id).FirstOrDefault().Balance ?? 0;
            return View();
        }

        public ActionResult NapTien(int id_tk)
        {
            var tk = db.Accounts.Where(x => x.AccountId == id_tk).FirstOrDefault();
            tk.Balance = tk.Balance > 0 ? tk.Balance : 0;
            tk.Balance += 50000;
            db.SubmitChanges();
            return Json(new { success = true }, JsonRequestBehavior.AllowGet);
        }
    }
}