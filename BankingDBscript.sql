USE [master]
GO
/****** Object:  Database [BankingDB]    Script Date: 7/14/2023 4:26:21 PM ******/
CREATE DATABASE [BankingDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BankingDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BankingDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BankingDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BankingDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BankingDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BankingDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BankingDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BankingDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BankingDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BankingDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BankingDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BankingDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BankingDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BankingDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BankingDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BankingDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BankingDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BankingDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BankingDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BankingDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BankingDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BankingDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BankingDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BankingDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BankingDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BankingDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BankingDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BankingDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BankingDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BankingDB] SET  MULTI_USER 
GO
ALTER DATABASE [BankingDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BankingDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BankingDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BankingDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BankingDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BankingDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BankingDB', N'ON'
GO
ALTER DATABASE [BankingDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [BankingDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BankingDB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/14/2023 4:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountNumber] [int] IDENTITY(1,1) NOT NULL,
	[AccountType] [varchar](50) NULL,
	[Balance] [decimal](18, 0) NULL,
	[Branch_ID] [int] NULL,
	[User_ID] [int] NULL,
	[Created_by] [int] NULL,
	[Created_on] [date] NULL,
	[Updated_by] [int] NULL,
	[Updated_on] [date] NULL,
 CONSTRAINT [PK_AccountTable] PRIMARY KEY CLUSTERED 
(
	[AccountNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 7/14/2023 4:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[Branch_ID] [int] IDENTITY(1,1) NOT NULL,
	[Branch_Name] [varchar](50) NULL,
	[Branch_City] [varchar](50) NULL,
	[Updated_By] [int] NULL,
	[Updated_On] [datetime] NULL,
 CONSTRAINT [PK_BranchTable] PRIMARY KEY CLUSTERED 
(
	[Branch_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 7/14/2023 4:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_ID] [int] NULL,
	[Created_by] [int] NULL,
	[Created_on] [date] NULL,
	[Updated_by] [int] NULL,
	[Updated_on] [date] NULL,
	[Pan_no] [varchar](50) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__Customer__3214EC0716534FE4] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 7/14/2023 4:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Employee_ID] [int] NULL,
	[Branch_ID] [int] NULL,
	[Created_by] [int] NULL,
	[Created_on] [date] NULL,
	[Updated_by] [int] NULL,
	[Updated_on] [date] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__Employee__3214EC0730E692CA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 7/14/2023 4:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[Transaction_ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountNumber] [int] NULL,
	[Transaction_type] [varchar](50) NULL,
	[Transaction_amount] [decimal](18, 0) NULL,
	[Created_by] [int] NULL,
	[Created_on] [date] NULL,
 CONSTRAINT [PK_TransactionTable] PRIMARY KEY CLUSTERED 
(
	[Transaction_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 7/14/2023 4:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[user_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Phone_no] [varchar](10) NULL,
	[City] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Role] [varchar](50) NULL,
 CONSTRAINT [PK_User_Table] PRIMARY KEY CLUSTERED 
(
	[user_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountNumber], [AccountType], [Balance], [Branch_ID], [User_ID], [Created_by], [Created_on], [Updated_by], [Updated_on]) VALUES (1, N'Saving', CAST(3000 AS Decimal(18, 0)), 2, 12, NULL, CAST(N'2023-07-07' AS Date), 12, CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Account] ([AccountNumber], [AccountType], [Balance], [Branch_ID], [User_ID], [Created_by], [Created_on], [Updated_by], [Updated_on]) VALUES (2, N'Checking', CAST(456000 AS Decimal(18, 0)), 1, 12, NULL, CAST(N'2023-07-11' AS Date), NULL, NULL)
INSERT [dbo].[Account] ([AccountNumber], [AccountType], [Balance], [Branch_ID], [User_ID], [Created_by], [Created_on], [Updated_by], [Updated_on]) VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccountNumber], [AccountType], [Balance], [Branch_ID], [User_ID], [Created_by], [Created_on], [Updated_by], [Updated_on]) VALUES (7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccountNumber], [AccountType], [Balance], [Branch_ID], [User_ID], [Created_by], [Created_on], [Updated_by], [Updated_on]) VALUES (8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccountNumber], [AccountType], [Balance], [Branch_ID], [User_ID], [Created_by], [Created_on], [Updated_by], [Updated_on]) VALUES (9, N'Saving', NULL, 3, 20, 18, CAST(N'2023-07-13' AS Date), NULL, NULL)
INSERT [dbo].[Account] ([AccountNumber], [AccountType], [Balance], [Branch_ID], [User_ID], [Created_by], [Created_on], [Updated_by], [Updated_on]) VALUES (10, N'Checking', NULL, 1, 23, 23, CAST(N'2023-07-13' AS Date), 23, CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Account] ([AccountNumber], [AccountType], [Balance], [Branch_ID], [User_ID], [Created_by], [Created_on], [Updated_by], [Updated_on]) VALUES (11, N'Checking', NULL, 1, 22, 22, CAST(N'2023-07-13' AS Date), 22, CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Account] ([AccountNumber], [AccountType], [Balance], [Branch_ID], [User_ID], [Created_by], [Created_on], [Updated_by], [Updated_on]) VALUES (12, N'Cheking', CAST(9000 AS Decimal(18, 0)), 3, 32, 31, CAST(N'2023-07-14' AS Date), 32, CAST(N'2023-07-14' AS Date))
INSERT [dbo].[Account] ([AccountNumber], [AccountType], [Balance], [Branch_ID], [User_ID], [Created_by], [Created_on], [Updated_by], [Updated_on]) VALUES (13, N'Saving', CAST(0 AS Decimal(18, 0)), 5, 37, 35, CAST(N'2023-07-14' AS Date), NULL, NULL)
INSERT [dbo].[Account] ([AccountNumber], [AccountType], [Balance], [Branch_ID], [User_ID], [Created_by], [Created_on], [Updated_by], [Updated_on]) VALUES (14, N'Saving', CAST(24000 AS Decimal(18, 0)), 5, 37, 35, CAST(N'2023-07-14' AS Date), 0, CAST(N'2023-07-14' AS Date))
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Branch] ON 

INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name], [Branch_City], [Updated_By], [Updated_On]) VALUES (1, N'SBI-Delhi', N'Delhi', NULL, NULL)
INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name], [Branch_City], [Updated_By], [Updated_On]) VALUES (2, N'SBI-Aligarh', N'Aligarh', 1, CAST(N'2023-07-14T11:22:24.087' AS DateTime))
INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name], [Branch_City], [Updated_By], [Updated_On]) VALUES (3, N'SBI-Noida', N'Noida', NULL, NULL)
INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name], [Branch_City], [Updated_By], [Updated_On]) VALUES (4, N'SBI-Gurugram', N'Gurugram', NULL, NULL)
INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name], [Branch_City], [Updated_By], [Updated_On]) VALUES (5, N'SBI-Gurugram', N'Gurugram', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Branch] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Customer_ID], [Created_by], [Created_on], [Updated_by], [Updated_on], [Pan_no], [Id]) VALUES (12, NULL, CAST(N'2023-07-07' AS Date), NULL, NULL, N'Zyuis7890267', 1)
INSERT [dbo].[Customer] ([Customer_ID], [Created_by], [Created_on], [Updated_by], [Updated_on], [Pan_no], [Id]) VALUES (19, 18, CAST(N'2023-07-13' AS Date), NULL, NULL, N'vhjuy786h', 3)
INSERT [dbo].[Customer] ([Customer_ID], [Created_by], [Created_on], [Updated_by], [Updated_on], [Pan_no], [Id]) VALUES (20, 18, CAST(N'2023-07-13' AS Date), NULL, NULL, N'vhjd78', 4)
INSERT [dbo].[Customer] ([Customer_ID], [Created_by], [Created_on], [Updated_by], [Updated_on], [Pan_no], [Id]) VALUES (23, 22, CAST(N'2023-07-13' AS Date), NULL, NULL, N'bhdjk89k', 5)
INSERT [dbo].[Customer] ([Customer_ID], [Created_by], [Created_on], [Updated_by], [Updated_on], [Pan_no], [Id]) VALUES (32, 31, CAST(N'2023-07-14' AS Date), 31, CAST(N'2023-07-14' AS Date), N'bhjkui', 6)
INSERT [dbo].[Customer] ([Customer_ID], [Created_by], [Created_on], [Updated_by], [Updated_on], [Pan_no], [Id]) VALUES (33, 31, CAST(N'2023-07-14' AS Date), NULL, NULL, N'bjhkui78', 7)
INSERT [dbo].[Customer] ([Customer_ID], [Created_by], [Created_on], [Updated_by], [Updated_on], [Pan_no], [Id]) VALUES (36, 35, CAST(N'2023-07-14' AS Date), NULL, NULL, N'vghju7', 8)
INSERT [dbo].[Customer] ([Customer_ID], [Created_by], [Created_on], [Updated_by], [Updated_on], [Pan_no], [Id]) VALUES (37, 35, CAST(N'2023-07-14' AS Date), 35, CAST(N'2023-07-14' AS Date), N'vghj67', 9)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Employee_ID], [Branch_ID], [Created_by], [Created_on], [Updated_by], [Updated_on], [Id]) VALUES (8, NULL, NULL, CAST(N'2023-07-06' AS Date), NULL, NULL, 1)
INSERT [dbo].[Employee] ([Employee_ID], [Branch_ID], [Created_by], [Created_on], [Updated_by], [Updated_on], [Id]) VALUES (13, NULL, 1, CAST(N'2023-07-13' AS Date), NULL, NULL, 4)
INSERT [dbo].[Employee] ([Employee_ID], [Branch_ID], [Created_by], [Created_on], [Updated_by], [Updated_on], [Id]) VALUES (15, 1, 1, CAST(N'2023-07-13' AS Date), NULL, NULL, 5)
INSERT [dbo].[Employee] ([Employee_ID], [Branch_ID], [Created_by], [Created_on], [Updated_by], [Updated_on], [Id]) VALUES (18, 3, 1, CAST(N'2023-07-13' AS Date), NULL, NULL, 7)
INSERT [dbo].[Employee] ([Employee_ID], [Branch_ID], [Created_by], [Created_on], [Updated_by], [Updated_on], [Id]) VALUES (22, 1, 1, CAST(N'2023-07-13' AS Date), NULL, NULL, 9)
INSERT [dbo].[Employee] ([Employee_ID], [Branch_ID], [Created_by], [Created_on], [Updated_by], [Updated_on], [Id]) VALUES (25, NULL, 1, CAST(N'2023-07-13' AS Date), NULL, NULL, 10)
INSERT [dbo].[Employee] ([Employee_ID], [Branch_ID], [Created_by], [Created_on], [Updated_by], [Updated_on], [Id]) VALUES (26, NULL, 1, CAST(N'2023-07-13' AS Date), NULL, NULL, 11)
INSERT [dbo].[Employee] ([Employee_ID], [Branch_ID], [Created_by], [Created_on], [Updated_by], [Updated_on], [Id]) VALUES (27, 1, 1, CAST(N'2023-07-13' AS Date), NULL, NULL, 12)
INSERT [dbo].[Employee] ([Employee_ID], [Branch_ID], [Created_by], [Created_on], [Updated_by], [Updated_on], [Id]) VALUES (29, 1, 0, CAST(N'2023-07-13' AS Date), NULL, NULL, 14)
INSERT [dbo].[Employee] ([Employee_ID], [Branch_ID], [Created_by], [Created_on], [Updated_by], [Updated_on], [Id]) VALUES (30, 3, 1, CAST(N'2023-07-13' AS Date), 1, CAST(N'2023-07-14' AS Date), 15)
INSERT [dbo].[Employee] ([Employee_ID], [Branch_ID], [Created_by], [Created_on], [Updated_by], [Updated_on], [Id]) VALUES (31, 3, 1, CAST(N'2023-07-14' AS Date), 1, CAST(N'2023-07-14' AS Date), 16)
INSERT [dbo].[Employee] ([Employee_ID], [Branch_ID], [Created_by], [Created_on], [Updated_by], [Updated_on], [Id]) VALUES (34, 5, 1, CAST(N'2023-07-14' AS Date), NULL, NULL, 17)
INSERT [dbo].[Employee] ([Employee_ID], [Branch_ID], [Created_by], [Created_on], [Updated_by], [Updated_on], [Id]) VALUES (35, 1, 1, CAST(N'2023-07-14' AS Date), 1, CAST(N'2023-07-14' AS Date), 18)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Transaction] ON 

INSERT [dbo].[Transaction] ([Transaction_ID], [AccountNumber], [Transaction_type], [Transaction_amount], [Created_by], [Created_on]) VALUES (1, 1, N'Deposit', CAST(1000 AS Decimal(18, 0)), 12, CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Transaction] ([Transaction_ID], [AccountNumber], [Transaction_type], [Transaction_amount], [Created_by], [Created_on]) VALUES (2, 1, N'Deposit', CAST(1000 AS Decimal(18, 0)), 12, CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Transaction] ([Transaction_ID], [AccountNumber], [Transaction_type], [Transaction_amount], [Created_by], [Created_on]) VALUES (3, 1, N'Deposit', CAST(1000 AS Decimal(18, 0)), 12, CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Transaction] ([Transaction_ID], [AccountNumber], [Transaction_type], [Transaction_amount], [Created_by], [Created_on]) VALUES (4, 1, N'Deposit', CAST(1000 AS Decimal(18, 0)), 12, CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Transaction] ([Transaction_ID], [AccountNumber], [Transaction_type], [Transaction_amount], [Created_by], [Created_on]) VALUES (5, 1, N'Deposit', CAST(1000 AS Decimal(18, 0)), 12, CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Transaction] ([Transaction_ID], [AccountNumber], [Transaction_type], [Transaction_amount], [Created_by], [Created_on]) VALUES (6, 10, N'Deposit', CAST(1000 AS Decimal(18, 0)), 23, CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Transaction] ([Transaction_ID], [AccountNumber], [Transaction_type], [Transaction_amount], [Created_by], [Created_on]) VALUES (7, 11, N'Deposit', CAST(1000 AS Decimal(18, 0)), 22, CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Transaction] ([Transaction_ID], [AccountNumber], [Transaction_type], [Transaction_amount], [Created_by], [Created_on]) VALUES (8, 12, N'Deposit', CAST(10000 AS Decimal(18, 0)), 32, CAST(N'2023-07-14' AS Date))
INSERT [dbo].[Transaction] ([Transaction_ID], [AccountNumber], [Transaction_type], [Transaction_amount], [Created_by], [Created_on]) VALUES (9, 12, N'Withdraw', CAST(1000 AS Decimal(18, 0)), 32, CAST(N'2023-07-14' AS Date))
INSERT [dbo].[Transaction] ([Transaction_ID], [AccountNumber], [Transaction_type], [Transaction_amount], [Created_by], [Created_on]) VALUES (10, 14, N'Deposit', CAST(12000 AS Decimal(18, 0)), 37, CAST(N'2023-07-14' AS Date))
INSERT [dbo].[Transaction] ([Transaction_ID], [AccountNumber], [Transaction_type], [Transaction_amount], [Created_by], [Created_on]) VALUES (12, 14, N'Deposit', CAST(12000 AS Decimal(18, 0)), 37, CAST(N'2023-07-14' AS Date))
SET IDENTITY_INSERT [dbo].[Transaction] OFF
GO
SET IDENTITY_INSERT [dbo].[UserDetails] ON 

INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (1, N'Vanshika', N'8767876785', N'Aligarh', N'vanshika', N'vanshika@gmail.com', N'Admin')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (2, N'Anshul', N'9876785678', N'Aligarh', N'xyz', N'abc@gmail.com', N'Employee')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (3, N'Ankit', N'9785643245', N'Aligarh', N'1234', N'ankit@gmail.com', N'Employee')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (5, N'Arushi', N'5678987675', N'Lucknow', N'abhj', N'arushi@gmail.com', N'Employee')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (6, N'Simran', N'9876789567', N'Lucknow', N'xyz', N'simran@gmail.com', N'Employee')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (7, N'Simran', N'9878675436', N'Lucknow', N'xyzgh', N'simran@gmail.com', N'Employee')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (8, N'Harshit', N'6789098767', N'Aligarh', N'xyh', N'xyz@gmail.com', N'Employee')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (9, N'Kavish', N'8978986789', N'Lucknow', N'xvhj', N'kavi@gmail.com', N'Employee')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (10, N'Kavish', N'8978986789', N'Lucknow', N'xvhj', N'kavi@gmail.com', N'Employee')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (11, N'Kavish', N'7896785678', N'Lucknow', N'nhjk', N'abc@gmail.com', N'Employee')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (12, N'Rajib', N'6789098767', N'Delhi', N'rajib', N'rajib@gmail.com', N'Customer')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (13, N'Simran', N'9878986756', N'Lucknow', N'simran', N'simran@gmail.com', N'Employee')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (14, N'Priyanshi', N'9878986756', N'Kanpur', N'priyanshi', N'priyanshi@gmail.com', N'Employee')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (15, N'Priyanshi', N'9878986756', N'Kanpur', N'priyanshi', N'priyanshi@gmail.com', N'Employee')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (18, N'Naman', N'9876785645', N'Noida', N'naman', N'naman@gmail.com', N'Employee')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (19, N'Nancy', N'8978675678', N'Noida', N'nancy', N'nancy@gmail.com', N'Customer')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (20, N'Nancy', N'8987675647', N'Noida', N'nancy', N'nancy@gmail.com', N'Customer')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (21, N'Smriti', N'8987675678', N'Delhi', N'smriti', N'smriti@gmail.com', N'Employee')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (22, N'Smriti', N'8987675678', N'Delhi', N'smriti', N'smriti@gmail.com', N'Employee')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (23, N'Megha', N'9878675678', N'Delhi', N'megha', N'megha@gmail.com', N'Customer')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (24, N'Mansi', N'8978967856', N'Aligarh', N'mansi', N'mansi@gmail.com', N'Employee')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (25, N'Mansi', N'8978967856', N'Aligarh', N'mansi', N'mansi@gmail.com', N'Employee')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (26, N'Mansi', N'8978678567', N'Delhi', N'mansi', N'mansi@gmail.com', N'Employee')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (27, N'Abhay', N'8978987678', N'Delhi', N'abhay', N'abhay@gmail.com', N'Employee')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (28, N'string', N'string', N'string', N'string', N'string', N'string')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (29, N'string', N'string', N'string', N'string', N'string', N'string')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (30, N'Priya', N'7898767567', N'Delhi', N'priya', N'priya@gmail.com', N'Employee')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (31, N'Kartik', N'9876787656', N'Noida', N'kartik', N'kartik@gmail.com', N'Employee')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (32, N'Ayush', N'7896879089', N'Delhi', N'ayush', N'ayush@gmail.com', N'Customer')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (33, N'Ayush', N'7896879089', N'Delhi', N'ayush', N'ayush@gmail.com', N'Customer')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (34, N'Yash', N'9876789876', N'Gurugram', N'yash', N'yash@gmail.com', N'Employee')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (35, N'Yash', N'9876789876', N'Gurugram', N'yash', N'yash@gmail.com', N'Employee')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (36, N'Raghav', N'8987898767', N'Delhi', N'raghav', N'raghav@gmail.com', N'Customer')
INSERT [dbo].[UserDetails] ([user_ID], [Name], [Phone_no], [City], [Password], [Email], [Role]) VALUES (37, N'Raghav', N'8987898767', N'Delhi', N'raghav', N'raghav@gmail.com', N'Customer')
SET IDENTITY_INSERT [dbo].[UserDetails] OFF
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_Created_by]  DEFAULT ((0)) FOR [Created_by]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_AccountTable_BranchTable] FOREIGN KEY([Branch_ID])
REFERENCES [dbo].[Branch] ([Branch_ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_AccountTable_BranchTable]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_AccountTable_User_Table] FOREIGN KEY([User_ID])
REFERENCES [dbo].[UserDetails] ([user_ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_AccountTable_User_Table]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Table_User_Table] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[UserDetails] ([user_ID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Table_User_Table]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Table_BranchTable] FOREIGN KEY([Branch_ID])
REFERENCES [dbo].[Branch] ([Branch_ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Table_BranchTable]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Table_User_Table] FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[UserDetails] ([user_ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Table_User_Table]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_TransactionTable_AccountTable] FOREIGN KEY([AccountNumber])
REFERENCES [dbo].[Account] ([AccountNumber])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_TransactionTable_AccountTable]
GO
USE [master]
GO
ALTER DATABASE [BankingDB] SET  READ_WRITE 
GO
