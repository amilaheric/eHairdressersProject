using AutoMapper;
using eHairdressers.Model.Requests;
using eHairdressers.Model.SearchObjects;
using eHairdressers.Services.Database;
using eHairdressers.Services.ProductsStateMachine;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eHairdressers.Services
{
    public class AppointmentService : BaseCRUDService<Model.Appointment,Database.Appointment,AppointmentsSearchObject,AppointmentInsertRequest, AppointmentUpdateRequest>,IAppointmentService
    {
        public AppointmentService(eHairdressersContext context, IMapper mapper) : base(context, mapper)
        {
        }

        //public async Task<Model.Appointments> CheckFreeAppointments(AppointmentsSearchObject appointmentsSearchObject)
        //{
        //    try
        //    {
        //        //var query = "SELECT * FROM C APPOINTMENTS WHERE C.DATE == "
        //        var appointments = await _context.Appointments.Where(
        //            x => x.UserId == appointmentsSearchObject.UserId &&
        //            x.ServiceId == appointmentsSearchObject.ServiceId &&
        //            x.AppointmentDate.Date == appointmentsSearchObject.DateTime.Date).ToListAsync();
        //        //var app = await _context.Appointments.ToListAsync();

        //        return _mapper.Map<Model.Appointments>(appointments);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        public async Task<List<Model.Appointment>> GetAppointmentsByUserIdAsync(int userId)
        {
            var entity = await _context.Appointments.Where(a => a.UserId == userId).ToListAsync();
            return _mapper.Map<List<Model.Appointment>>(entity);
        }
        public override IQueryable<Appointment> AddInclude(IQueryable<Appointment> query, AppointmentsSearchObject? search = null)
        {
            query = query.Include(a => a.Employee)
                 .Include(a => a.Service)
                 .Include(a => a.User);

            return base.AddInclude(query, search);
        }

        public override IQueryable<Appointment> AddFilter(IQueryable<Appointment> query, AppointmentsSearchObject? search = null)
        {
          
                var filteredQuery = base.AddFilter(query, search);

                if (search?.AppointmentDate != null)
                {
                    filteredQuery = filteredQuery.Where(x => x.AppointmentDateTime.Contains(search.AppointmentDate));
                }

                return filteredQuery;
            
        }
    }
}
