using System;
using System.Collections.Generic;

namespace InternProjectBankingSystem.Models;

public partial class Customer
{
    public int? CustomerId { get; set; }

    public int? CreatedBy { get; set; }

    public DateTime? CreatedOn { get; set; }

    public int? UpdatedBy { get; set; }

    public DateTime? UpdatedOn { get; set; }

    public string? PanNo { get; set; }

    public int Id { get; set; }

    public virtual UserDetail? CustomerNavigation { get; set; }
}
