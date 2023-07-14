using InternProjectBankingSystem.Models;
using InternProjectBankingSystem.ViewModel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;


namespace InternProjectBankingSystem.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BranchController : ControllerBase
    {
        private readonly BankingDbContext _context;

        public BranchController(BankingDbContext context)
        {
            _context = context;
        }
        
        //Get Branch Details
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ViewBranch>>> GetBranchDetails()
        {
            if (_context.Branches == null)
            {
                return NotFound();
            }
            
            return await (from b in _context.Branches
                          select new ViewBranch
                          {
                              Id = b.BranchId,
                              Name = b.BranchName,
                              City = b.BranchCity
                          }).ToListAsync();
        }

        //Create New Branch
        [HttpPost]
        public async Task<ActionResult<int>> CreateBranch(ViewBranch branch)
        {
            Branch b=new Branch();
            b.BranchName = branch.Name;
            b.BranchCity=branch.City;
            _context.Branches.Add(b);
            await _context.SaveChangesAsync();

            return b.BranchId;
        }

        //Update Branch's Name & City
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateBranch(int id,string branchName,string city,int updatedby)
        {
            var b=await _context.Branches.FindAsync(id);
            if (b ==null)
            {
                return BadRequest();
            }
            
            b.BranchName=branchName;
            b.BranchCity = city;
            b.UpdatedBy = updatedby;
            b.UpdatedOn = DateTime.Now;

            _context.Branches.Update(b);

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BranchExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }
        private bool BranchExists(int id)
        {
            return (_context.Branches?.Any(e => e.BranchId == id)).GetValueOrDefault();
        }
    }
}
