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
        public ActionResult BuyTicket(TicketDTO req)
        {
            ViewBag.ListTour = db.Tours.ToList();

            var customerId = db.Customers.Where(x => x.AccountId == req.AccountId).FirstOrDefault().CustomerId;
            var _order = new Order();
            _order.TicketId = req.TicketId;
            _order.Status = 1;
            _order.CreatedAt = DateTime.Now;
            _order.QRCode = "{ success = true, TicketId =" + req.TicketId + ", OrderId = " + _order.OrderId + ", AccountId = " + req.AccountId + "}";
            db.Orders.InsertOnSubmit(_order);
            db.SubmitChanges();

            var tk = db.Accounts.Where(x => x.AccountId == req.AccountId).FirstOrDefault();
            tk.Balance -= req.Price;
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
            var listVote = (from a in db.VoteTours
                            select new VoteTourDTO
                            {
                                VoteTourId = a.VoteTourId,
                                AccountId = a.AccountId,
                                TourId = a.TourId,
                                Star = a.Star,
                                Comment = a.Comment,
                                CreatedAt = a.CreatedAt,
                                UserName = db.Accounts.Where(x => x.AccountId == a.AccountId).FirstOrDefault().UserName ?? ""
                            }
                            ).Where(t => t.TourId == tourId).ToList();
            ViewBag.ListVote = listVote.OrderByDescending(x => x.VoteTourId).ToList();
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
            ViewBag.ListTicket = db.Tickets.ToList();
            return View();
        }

        public ActionResult Location(int id = 0)
        {
            var _location = db.Locations.Where(x => x.LocationId == id).FirstOrDefault();
            return Json(new { success = true, data = _location }, JsonRequestBehavior.AllowGet);
        }
    }
}