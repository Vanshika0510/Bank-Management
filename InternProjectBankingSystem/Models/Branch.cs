using System;
using System.Collections.Generic;

namespace InternProjectBankingSystem.Models;

public partial class Branch
{
    public int BranchId { get; set; }

    public string? BranchName { get; set; }

    public string? BranchCity { get; set; }

    public int? UpdatedBy { get; set; }

    public DateTime? UpdatedOn { get; set; }

    public virtual ICollection<Account> Accounts { get; set; } = new List<Account>();

    public virtual ICollection<Employee> Employees { get; set; } = new List<Employee>();
}
