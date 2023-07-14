using InternProjectBankingSystem.Models;
using InternProjectBankingSystem.ViewModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace InternProjectBankingSystem.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TransactionReportController : ControllerBase
    {
        private readonly BankingDbContext _context;

        public TransactionReportController(BankingDbContext context)
        {
            _context = context;
        }
        [HttpGet("{transactionDateTime}")]
        public async Task<ActionResult<IEnumerable<ViewReport>>> GetReport(DateTime transactionDateTime)
        {
            var report = await _context.Transactions.Where(dt => dt.CreatedOn == transactionDateTime).ToListAsync();
            if(report == null)
            { 
                return NotFound();
            }
            return Ok(report);
        }

    }
}
