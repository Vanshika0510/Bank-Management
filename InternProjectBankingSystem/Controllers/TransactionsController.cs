using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using InternProjectBankingSystem.Models;
using InternProjectBankingSystem.ViewModel;

namespace InternProjectBankingSystem.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TransactionsController : ControllerBase
    {
        private readonly BankingDbContext _context;

        public TransactionsController(BankingDbContext context)
        {
            _context = context;
        }

        //Get all Transaction Details
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Transaction>>> TransactionDetails()
        {
            if (_context.Transactions == null)
            {
                return NotFound();
            }
            
            return await _context.Transactions.ToListAsync();
        }

        //Get Transaction Details of Particular Account Number
        [HttpGet("{id}")]
        public async Task<ActionResult<ViewTransaction>> TransactionDetailsByAccNo(int id)
        {
          if (_context.Transactions == null)
          {
              return NotFound();
          }
            var transaction = await _context.Transactions.Where(a=>a.AccountNumber==id).ToListAsync();

            if (transaction == null)
            {
                return NotFound();
            }

            //return await (from t in _context.Transactions
            //              from acc in _context.Accounts
            //              where acc.AccountNumber == id
            //              select new ViewTransaction
            //              {
            //                  TransactionId = t.TransactionId,
            //                  TransactionAmount = t.TransactionAmount,
            //                  TransactionType = t.TransactionType,
            //                  AccountNumber = acc.AccountNumber,
            //                  CreatedBy = t.CreatedBy,
            //                  CreatedOn = t.CreatedOn
            //              }).FirstOrDefaultAsync();
            return Ok(transaction);
        }

        //Create New Transaction
        [HttpPost]
        public async Task<ActionResult<int>> CreateTransaction(ViewTransaction transaction)
        {
            if (_context.Transactions == null)
            {
                return Problem("Entity set 'BankingDbContext.Transactions'  is null.");
            }
            Transaction t=new Transaction();
            t.AccountNumber = transaction.AccountNumber;
            t.TransactionType = transaction.TransactionType;
            t.TransactionAmount = transaction.TransactionAmount;
            t.CreatedBy = transaction.CreatedBy;
            t.CreatedOn= DateTime.Now;
            
            _context.Transactions.Add(t);
            await _context.SaveChangesAsync();
            var act = await _context.Accounts.FindAsync(t.AccountNumber);
            if(act!=null)
            {
                act.UpdatedBy = transaction.UpdatedBy;
                act.UpdatedOn = DateTime.Now;
                if (t.TransactionType == "Withdraw")
                {
                    act.Balance -= t.TransactionAmount;
                }
                else if (t.TransactionType == "Deposit")
                {
                    act.Balance += t.TransactionAmount;
                }
                _context.Accounts.Update(act);
            }
            await _context.SaveChangesAsync();

            return t.TransactionId;
        }
        
        private bool TransactionExists(int id)
        {
            return (_context.Transactions?.Any(e => e.TransactionId == id)).GetValueOrDefault();
        }
    }
}
