using System;
using System.Collections.Generic;

namespace InternProjectBankingSystem.Models;

public partial class UserDetail
{
    public int UserId { get; set; }

    public string? Name { get; set; }

    public string? PhoneNo { get; set; }

    public string? City { get; set; }

    public string? Password { get; set; }

    public string? Email { get; set; }

    public string? Role { get; set; }

    public virtual ICollection<Account> Accounts { get; set; } = new List<Account>();

    public virtual ICollection<Customer> Customers { get; set; } = new List<Customer>();

    public virtual ICollection<Employee> Employees { get; set; } = new List<Employee>();
}
