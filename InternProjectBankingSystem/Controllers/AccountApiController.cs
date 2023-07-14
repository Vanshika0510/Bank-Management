using InternProjectBankingSystem.Models;
using InternProjectBankingSystem.ViewModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace InternProjectBankingSystem.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountApiController : ControllerBase
    {
        private readonly BankingDbContext _context;

        public AccountApiController(BankingDbContext context)
        {
            _context = context;
        }

        //GET: API
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Account>>> AccountDetails()
        {
            if (_context.Accounts == null)
            {
                return NotFound();
            }
            return await _context.Accounts.ToListAsync();
        }

        // GET: api/Accounts/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ViewAccount>> AccountDetailsByUserID(int id)
        {
            if (_context.Accounts == null)
            {
                return NotFound();
            }
            var account = await _context.Accounts.FindAsync(id);

            if (account == null)
            {
                return NotFound();
            }
            //return await (from act in _context.Accounts
            //              where act.UserId == id
            //              select new ViewAccount
            //              {
            //                  AccountNumber = act.AccountNumber,
            //                  AccountType = act.AccountType,
            //                  Balance = act.Balance,
            //                  BranchId = act.BranchId,
            //                  UserId = act.UserId,
            //                  CreatedBy = act.CreatedBy,
            //                  CreatedOn = act.CreatedOn
            //              }).FirstOrDefaultAsync();
            return Ok(account);
        }

        //Post: API
        [HttpPost]
        public async Task<ActionResult<int>> CreateAccount(ViewAccount account)
        {
            if (_context.Customers == null)
            {
                return Problem("Entity set 'BankingDbContext.Customers'  is null.");
            }
            Account act = new Account();
            act.AccountType = account.AccountType;
            act.Balance = 0;
            act.BranchId = account.BranchId;
            act.UserId = account.UserId;
            act.CreatedBy = account.CreatedBy;
            act.CreatedOn = DateTime.Now;
            _context.Accounts.Add(act);
            await _context.SaveChangesAsync();

            await _context.SaveChangesAsync();
            return act.AccountNumber;
        }

        private bool AccountExists(int? id)
        {
            return (_context.Accounts?.Any(e => e.AccountNumber == id)).GetValueOrDefault();
        }
    }
}
