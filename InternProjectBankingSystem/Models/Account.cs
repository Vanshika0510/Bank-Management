using System;
using System.Collections.Generic;

namespace InternProjectBankingSystem.Models;

public partial class Account
{
    public int AccountNumber { get; set; }

    public string? AccountType { get; set; }

    public decimal? Balance { get; set; }

    public int? BranchId { get; set; }

    public int? UserId { get; set; }

    public int? CreatedBy { get; set; }

    public DateTime? CreatedOn { get; set; }

    public int? UpdatedBy { get; set; }

    public DateTime? UpdatedOn { get; set; }

    public virtual Branch? Branch { get; set; }

    public virtual ICollection<Transaction> Transactions { get; set; } = new List<Transaction>();

    public virtual UserDetail? User { get; set; }
}
