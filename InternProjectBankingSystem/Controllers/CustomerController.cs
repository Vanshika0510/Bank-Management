using InternProjectBankingSystem.Models;
using InternProjectBankingSystem.ViewModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;



namespace InternProjectBankingSystem.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomerController : ControllerBase
    {
        private readonly BankingDbContext _context;

        public CustomerController(BankingDbContext context)
        {
            _context = context;
        }

        //GetCustomerDetails
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ViewCustomer>>> GetCustomerDetails()
        {
            if (_context.UserDetails == null)
            {
                return NotFound();
            }
            return await (from c in _context.Customers
                          from user in _context.UserDetails
                          where c.CustomerId == user.UserId
                          select new ViewCustomer
                          {
                              CustomerId = user.UserId,
                              Name = user.Name,
                              Role = user.Role,
                              PanNo = c.PanNo,
                              PhoneNo = user.PhoneNo,
                              City = user.City,
                              Email = user.Email,
                              Password = user.Password,
                              CreatedBy = c.CreatedBy,
                              CreatedOn = c.CreatedOn
                          }).ToListAsync();
        }


        //Get Customer Details By Customer Id
        [HttpGet("{id}")]
        public async Task<ActionResult> GetCustomerDetailsById(int id)
        {
            if (_context.UserDetails == null)
            {
                return NotFound();
            }
            var customerDetail = await _context.Customers.Where(c=>c.CustomerId==id).FirstOrDefaultAsync();

            if (customerDetail == null)
            {
                return NotFound();
            }
            //return await (from c in _context.Customers
            //              from user in _context.UserDetails
            //              where user.UserId == id
            //              select new ViewCustomer
            //              {
            //                  CustomerId = user.UserId,
            //                  Name = user.Name,
            //                  Role = user.Role,
            //                  PhoneNo = user.PhoneNo,
            //                  City = user.City,
            //                  Email = user.Email,
            //                  Password = user.Password,
            //                  PanNo=c.PanNo,
            //                  CreatedBy = c.CreatedBy,
            //                  CreatedOn = c.CreatedOn
            //              }).FirstOrDefaultAsync();
            return Ok(customerDetail);
        }

        //Register New Customer
        [HttpPost]
        public async Task<ActionResult<int>> RegisterCustomer(ViewCustomer customer)
        {
            if (_context.UserDetails == null)
            {
                return Problem("Entity set 'BankingDbContext.UserDetails'  is null.");
            }
            UserDetail c = new UserDetail();
            c.Name = customer.Name;
            c.Email = customer.Email;
            c.City = customer.City;
            c.Role = customer.Role;
            c.PhoneNo = customer.PhoneNo;
            c.Password = customer.Password;
            _context.UserDetails.Add(c);
            await _context.SaveChangesAsync();
            Customer c1 = new Customer();
            c1.CustomerId = c.UserId;
            c1.PanNo = customer.PanNo;
            c1.CreatedBy = customer.CreatedBy;
            c1.CreatedOn = DateTime.Now;
            _context.Customers.Add(c1);
            await _context.SaveChangesAsync();
            return c.UserId;
        }


        //Update Customer's PanNo
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateCustomerDetails(int id, string panno, int updatedby)
        {
            var c = await _context.Customers.Where(c=>c.CustomerId==id).FirstOrDefaultAsync();
            if (c == null)
                return BadRequest();
            c.PanNo = panno;
            c.UpdatedBy = updatedby;
            c.UpdatedOn = DateTime.Now;
            _context.Customers.Update(c);

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CustomerExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return Ok("Updated Successfully");
        }
        private bool CustomerExists(int id)
        {
            return (_context.Customers?.Any(e => e.CustomerId == id)).GetValueOrDefault();
        }
    }
}