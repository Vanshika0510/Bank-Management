using System;
using System.Collections.Generic;

namespace InternProjectBankingSystem.Models;

public partial class Employee
{
    public int? EmployeeId { get; set; }

    public int? BranchId { get; set; }

    public int? CreatedBy { get; set; }

    public DateTime? CreatedOn { get; set; }

    public int? UpdatedBy { get; set; }

    public DateTime? UpdatedOn { get; set; }

    public int Id { get; set; }

    public virtual Branch? Branch { get; set; }

    public virtual UserDetail? EmployeeNavigation { get; set; }
}
