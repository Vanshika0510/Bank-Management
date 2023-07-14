using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace InternProjectBankingSystem.Models;

public partial class BankingDbContext : DbContext
{
    public BankingDbContext()
    {
    }

    public BankingDbContext(DbContextOptions<BankingDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Account> Accounts { get; set; }

    public virtual DbSet<Branch> Branches { get; set; }

    public virtual DbSet<Customer> Customers { get; set; }

    public virtual DbSet<Employee> Employees { get; set; }

    public virtual DbSet<Transaction> Transactions { get; set; }

    public virtual DbSet<UserDetail> UserDetails { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=localhost;Database=BankingDB;Trusted_Connection=True;TrustServerCertificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Account>(entity =>
        {
            entity.HasKey(e => e.AccountNumber).HasName("PK_AccountTable");

            entity.ToTable("Account");

            entity.Property(e => e.AccountType)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Balance).HasColumnType("decimal(18, 0)");
            entity.Property(e => e.BranchId).HasColumnName("Branch_ID");
            entity.Property(e => e.CreatedBy)
                .HasDefaultValueSql("((0))")
                .HasColumnName("Created_by");
            entity.Property(e => e.CreatedOn)
                .HasColumnType("date")
                .HasColumnName("Created_on");
            entity.Property(e => e.UpdatedBy).HasColumnName("Updated_by");
            entity.Property(e => e.UpdatedOn)
                .HasColumnType("date")
                .HasColumnName("Updated_on");
            entity.Property(e => e.UserId).HasColumnName("User_ID");

            entity.HasOne(d => d.Branch).WithMany(p => p.Accounts)
                .HasForeignKey(d => d.BranchId)
                .HasConstraintName("FK_AccountTable_BranchTable");

            entity.HasOne(d => d.User).WithMany(p => p.Accounts)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK_AccountTable_User_Table");
        });

        modelBuilder.Entity<Branch>(entity =>
        {
            entity.HasKey(e => e.BranchId).HasName("PK_BranchTable");

            entity.ToTable("Branch");

            entity.Property(e => e.BranchId).HasColumnName("Branch_ID");
            entity.Property(e => e.BranchCity)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("Branch_City");
            entity.Property(e => e.BranchName)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("Branch_Name");
            entity.Property(e => e.UpdatedBy).HasColumnName("Updated_By");
            entity.Property(e => e.UpdatedOn)
                .HasColumnType("datetime")
                .HasColumnName("Updated_On");
        });

        modelBuilder.Entity<Customer>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Customer__3214EC0716534FE4");

            entity.ToTable("Customer");

            entity.Property(e => e.CreatedBy).HasColumnName("Created_by");
            entity.Property(e => e.CreatedOn)
                .HasColumnType("date")
                .HasColumnName("Created_on");
            entity.Property(e => e.CustomerId).HasColumnName("Customer_ID");
            entity.Property(e => e.PanNo)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("Pan_no");
            entity.Property(e => e.UpdatedBy).HasColumnName("Updated_by");
            entity.Property(e => e.UpdatedOn)
                .HasColumnType("date")
                .HasColumnName("Updated_on");

            entity.HasOne(d => d.CustomerNavigation).WithMany(p => p.Customers)
                .HasForeignKey(d => d.CustomerId)
                .HasConstraintName("FK_Customer_Table_User_Table");
        });

        modelBuilder.Entity<Employee>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Employee__3214EC0730E692CA");

            entity.ToTable("Employee");

            entity.Property(e => e.BranchId).HasColumnName("Branch_ID");
            entity.Property(e => e.CreatedBy).HasColumnName("Created_by");
            entity.Property(e => e.CreatedOn)
                .HasColumnType("date")
                .HasColumnName("Created_on");
            entity.Property(e => e.EmployeeId).HasColumnName("Employee_ID");
            entity.Property(e => e.UpdatedBy).HasColumnName("Updated_by");
            entity.Property(e => e.UpdatedOn)
                .HasColumnType("date")
                .HasColumnName("Updated_on");

            entity.HasOne(d => d.Branch).WithMany(p => p.Employees)
                .HasForeignKey(d => d.BranchId)
                .HasConstraintName("FK_Employee_Table_BranchTable");

            entity.HasOne(d => d.EmployeeNavigation).WithMany(p => p.Employees)
                .HasForeignKey(d => d.EmployeeId)
                .HasConstraintName("FK_Employee_Table_User_Table");
        });

        modelBuilder.Entity<Transaction>(entity =>
        {
            entity.HasKey(e => e.TransactionId).HasName("PK_TransactionTable");

            entity.ToTable("Transaction");

            entity.Property(e => e.TransactionId).HasColumnName("Transaction_ID");
            entity.Property(e => e.CreatedBy).HasColumnName("Created_by");
            entity.Property(e => e.CreatedOn)
                .HasColumnType("date")
                .HasColumnName("Created_on");
            entity.Property(e => e.TransactionAmount)
                .HasColumnType("decimal(18, 0)")
                .HasColumnName("Transaction_amount");
            entity.Property(e => e.TransactionType)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("Transaction_type");

            entity.HasOne(d => d.AccountNumberNavigation).WithMany(p => p.Transactions)
                .HasForeignKey(d => d.AccountNumber)
                .HasConstraintName("FK_TransactionTable_AccountTable");
        });

        modelBuilder.Entity<UserDetail>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PK_User_Table");

            entity.Property(e => e.UserId).HasColumnName("user_ID");
            entity.Property(e => e.City)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Email)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Password)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.PhoneNo)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("Phone_no");
            entity.Property(e => e.Role)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
