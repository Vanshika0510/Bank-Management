namespace InternProjectBankingSystem.ViewModel
{
    public class ViewReport
    {
        public int TransactionId { get; set; }

        public int? AccountNumber { get; set; }

        public string? TransactionType { get; set; }

        public decimal? TransactionAmount { get; set; }

        public int? CreatedBy { get; set; }

        public DateTime? CreatedOn { get; set; }
    }
}
