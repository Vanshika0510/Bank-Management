using InternProjectBankingSystem.Models;

namespace InternProjectBankingSystem.ViewModel
{
    public class ViewUser
    {
        public int UserId { get; set; }

        public string Name { get; set; }

        public string PhoneNo { get; set; }

        public string City { get; set; }

        public string Password { get; set; }

        public string Email { get; set; }

        public string Role { get; set; }

        //public int? EmployeeId { get; set; }

        public int? BranchId { get; set; }
        public int? CreatedBy { get; set; }

        public DateTime? CreatedOn { get; set; }
        //public int? CustomerId { get; set; }

        //public int? AccountNumber { get; set; }
        public string? PanNo { get; set; }

        //public virtual ICollection<Account> Accounts { get; set; } = new List<Account>();

    }
}
