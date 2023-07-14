using InternProjectBankingSystem.Models;
using InternProjectBankingSystem.ViewModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Migrations.Operations;
using System.Xml.Linq;

namespace InternProjectBankingSystem.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AdminController : ControllerBase
    {
        private readonly BankingDbContext _context;

        public AdminController(BankingDbContext context)
        {
            _context = context;
        }

        //GetEmployeeDetails
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ViewEmployee>>> EmployeeDetails()
        {

            if (_context.UserDetails == null)
            {
                return NotFound();
            }
            return await (from emp in _context.Employees
                         from user in _context.UserDetails
                         where emp.EmployeeId ==user.UserId
                         select new ViewEmployee
                         {
                             EmpId = user.UserId,
                             Name = user.Name,
                             PhoneNo = user.PhoneNo,
                             City = user.City,
                             Email = user.Email,
                             Role=user.Role,
                             BranchId=emp.BranchId,
                             Password = user.Password,
                             CreatedBy = emp.CreatedBy,
                             CreatedOn = emp.CreatedOn,
                             UpdatedBy = emp.UpdatedBy,
                             UpdatedOn = emp.UpdatedOn
                         }).ToListAsync();
        }

        //Get Employee Details By EmployeeID
        [HttpGet("{id}")]
        public async Task<ActionResult<ViewEmployee>> EmployeeDetailsByID(int id)
        {
            if (_context.UserDetails == null)
            {
                return NotFound();
            }
            var empDetail = await _context.Employees.Where(e=>e.EmployeeId==id).FirstOrDefaultAsync();

            if (empDetail == null)
            {
                return NotFound();
            }
            //return await (from emp in _context.Employees
            //              from user in _context.UserDetails
            //              where user.UserId == id
            //              select new ViewEmployee
            //              {
            //                  EmpId = user.UserId,
            //                  Name = user.Name,
            //                  Role = user.Role,
            //                  PhoneNo = user.PhoneNo,
            //                  City = user.City,
            //                  Email = user.Email,
            //                  Password = user.Password,
            //                  BranchId = emp.BranchId,
            //                  CreatedBy = emp.CreatedBy,
            //                  CreatedOn = emp.CreatedOn,
            //                  UpdatedBy=emp.UpdatedBy,
            //                  UpdatedOn = emp.UpdatedOn
            //              }).FirstOrDefaultAsync();
            return Ok(empDetail);
        }


        //Register New Employee
        [HttpPost]
        public async Task<ActionResult<int>> RegisterEmployee(ViewEmployee employee)
        {
            if (_context.UserDetails == null)
            {
                return Problem("Entity set 'BankingDbContext.UserDetails'  is null.");
            }
            UserDetail emp = new UserDetail();
            emp.Name = employee.Name;
            emp.Email = employee.Email;
            emp.City = employee.City;
            emp.Role = employee.Role;
            emp.PhoneNo = employee.PhoneNo;
            emp.Password = employee.Password;
            _context.UserDetails.Add(emp);
            await _context.SaveChangesAsync();
            Employee emp1 = new Employee();
            emp1.EmployeeId = emp.UserId;
            emp1.CreatedBy = employee.CreatedBy;
            emp1.CreatedOn = DateTime.Now;
            emp1.BranchId = employee.BranchId;
            _context.Employees.Add(emp1);
            await _context.SaveChangesAsync();

            return emp.UserId;
        }

        //Update Employee's Branch
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateEmployeeDetails(int id,int branchid, int updatedBy)
        {
            var emp2 = await _context.Employees.Where(e => e.EmployeeId == id).FirstOrDefaultAsync();
            if (emp2 == null)
                return BadRequest();
            emp2.BranchId = branchid;
            emp2.UpdatedOn = DateTime.Now;
            emp2.UpdatedBy = updatedBy;
            _context.Employees.Update(emp2);
            

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EmployeeExists(id))
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
        private bool EmployeeExists(int id)
        {
            return (_context.Employees?.Any(e => e.EmployeeId == id)).GetValueOrDefault();
        }
    }
}
