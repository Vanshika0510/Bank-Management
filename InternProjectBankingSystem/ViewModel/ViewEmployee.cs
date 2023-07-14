using InternProjectBankingSystem.Models;

namespace InternProjectBankingSystem.ViewModel
{
    public class ViewEmployee
    {
        public int EmpId { get; set; }

        public string Name { get; set; }

        public string PhoneNo { get; set; }

        public string City { get; set; }

        public string Password { get; set; }

        public string Email { get; set; }

        public string Role { get; set; }

        public int? CreatedBy { get; set; }

        public DateTime? CreatedOn { get; set; }
        public int? BranchId { get; set; }
        public int? UpdatedBy { get; set;}
        public DateTime? UpdatedOn { get;set; }
        // public virtual UserDetail? EmployeeNavigation { get; set; }
    }
}
