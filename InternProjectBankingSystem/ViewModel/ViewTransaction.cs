using InternProjectBankingSystem.Models;

namespace InternProjectBankingSystem.ViewModel
{
    public class ViewTransaction
    {
        public int TransactionId { get; set; }

        public int? AccountNumber { get; set; }

        public string? TransactionType { get; set; }

        public decimal? TransactionAmount { get; set; }

        public int? CreatedBy { get; set; }

        public DateTime? CreatedOn { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? UpdatedOn { get;  set; }
    }
}
