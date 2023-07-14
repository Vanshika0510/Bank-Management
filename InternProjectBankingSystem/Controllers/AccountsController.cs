//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Threading.Tasks;
//using Microsoft.AspNetCore.Http;
//using Microsoft.AspNetCore.Mvc;
//using Microsoft.EntityFrameworkCore;
//using InternProjectBankingSystem.Models;
//using InternProjectBankingSystem.ViewModel;

//namespace InternProjectBankingSystem.Controllers
//{
//    [Route("api/[controller]")]
//    [ApiController]
//    public class AccountsController : ControllerBase
//    {
//        private readonly BankingDbContext _context;

//        public AccountsController(BankingDbContext context)
//        {
//            _context = context;
//        }

//        // GET: api/Accounts
//        //[HttpGet]
//        //public async Task<ActionResult<IEnumerable<ViewAccount>>> GetAccounts()
//        //{
//        //    if (_context.Accounts == null)
//        //    {
//        //        return NotFound();
//        //    }
//        //    return (from act in _context.Accounts
//        //            from cust in _context.Customers
//        //            where 
//        //            select new ViewAccount
//        //            {
//        //                AccountNumber = act.AccountNumber,
//        //                AccountType = act.AccountType,
//        //                Balance = act.Balance,
//        //                BranchId = act.BranchId,
//        //                UserId = act.UserId,
//        //                CreatedBy = act.CreatedBy,
//        //                CreatedOn = act.CreatedOn
//        //            }).ToListAsync();
//        //}

//        // GET: api/Accounts/5
//        //[HttpGet("{accNo}")]
//        //public async Task<ActionResult<ViewAccount>> GetAccount(int id)
//        //{
//        //    if (_context.Accounts == null)
//        //    {
//        //        return NotFound();
//        //    }
//        //    var account = await _context.Accounts.FindAsync(id);

//        //    if (account == null)
//        //    {
//        //        return NotFound();
//        //    }

//        //    return await (from act in _context.Accounts
//        //            from cust in _context.Customers
//        //            from b in _context.Branches
//        //            where act.AccountNumber == id
//        //            select new ViewAccount
//        //            {
//        //                AccountNumber = act.AccountNumber,
//        //                AccountType = act.AccountType,
//        //                Balance = act.Balance,
//        //                BranchId = b.BranchId,
//        //                UserId = cust.CustomerId,
//        //                CreatedBy = act.CreatedBy,
//        //                CreatedOn = act.CreatedOn
//        //            }).ToListAsync(); 
//        //}

//        //// PUT: api/Accounts/5
//        //// To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
//        //[HttpPut("{id}")]
//        //public async Task<IActionResult> PutAccount(int id, Account account)
//        //{
//        //    if (id != account.AccountNumber)
//        //    {
//        //        return BadRequest();
//        //    }

//        //    _context.Entry(account).State = EntityState.Modified;

//        //    try
//        //    {
//        //        await _context.SaveChangesAsync();
//        //    }
//        //    catch (DbUpdateConcurrencyException)
//        //    {
//        //        if (!AccountExists(id))
//        //        {
//        //            return NotFound();
//        //        }
//        //        else
//        //        {
//        //            throw;
//        //        }
//        //    }

//        //    return NoContent();
//        //}

//        // POST: api/Accounts
//        [HttpPost]
//        public async Task<ActionResult<int>> CreateAccount(ViewAccount account)
//        {
//            if (_context.Customers == null)
//            {
//                return Problem("Entity set 'BankingDbContext.Customers'  is null.");
//            }
//            Account act = new Account();
//            act.AccountType = account.AccountType;
//            act.Balance= account.Balance;
//            act.BranchId = account.BranchId;
//            act.UserId = account.UserId;
//            act.CreatedBy=account.CreatedBy;
//            act.CreatedOn=DateTime.Now;
//            _context.Accounts.Add(act);
//            await _context.SaveChangesAsync();

//            await _context.SaveChangesAsync();

//            return act.AccountNumber;
//        }

//        private bool AccountExists(int id)
//        {
//            return (_context.Accounts?.Any(e => e.AccountNumber == id)).GetValueOrDefault();
//        }
//    }
//}
