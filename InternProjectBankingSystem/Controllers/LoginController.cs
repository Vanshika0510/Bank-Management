using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using InternProjectBankingSystem.Models;
using InternProjectBankingSystem.ViewModel;
using Microsoft.DotNet.Scaffolding.Shared.Messaging;
using Microsoft.AspNetCore.SignalR;

namespace InternProjectBankingSystem.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly BankingDbContext _context;

        public LoginController(BankingDbContext context)
        {
            _context = context;
        }
        
        //Authenticate user and return his/her Id and Role
        [HttpPost]
        public async Task<ActionResult<Role>> Login(ViewLogin user)
        {
            var display = _context.UserDetails.Where(m => m.Email == user.Email && m.Password == user.Password).FirstOrDefault();
            if (display != null)
            {
                return await (from u in _context.UserDetails
                              where u.Email == user.Email && u.Password == user.Password
                              select new Role
                              {
                                  id = u.UserId,
                                  role = u.Role
                              }).FirstOrDefaultAsync();
            }
            return BadRequest();

        }
        


        private bool UserDetailExists(int id)
        {
            return (_context.UserDetails?.Any(e => e.UserId == id)).GetValueOrDefault();
        }
    }
}
