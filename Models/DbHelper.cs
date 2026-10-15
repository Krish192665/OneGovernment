using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace OneGovernment.Models
{
    /// <summary>
    /// Data Access Layer (DAL) demonstrating Database Connectivity with ADO.NET,
    /// Parameterized SQL Queries (SQL Injection Prevention), and Collection Implementation (List<T>).
    /// </summary>
    public static class DbHelper
    {
        private static string GetConnectionString()
        {
            var connSettings = ConfigurationManager.ConnectionStrings["OneGovernmentDB"];
            if (connSettings != null && !string.IsNullOrEmpty(connSettings.ConnectionString))
            {
                return connSettings.ConnectionString;
            }

            // Fallback for local runtime
            string appData = AppDomain.CurrentDomain.GetData("DataDirectory") as string;
            string dbPath = System.IO.Path.Combine(appData ?? @"D:\Final\OneGovernment\App_Data", "OneGovernment.mdf");
            return $@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename={dbPath};Integrated Security=True;Connect Timeout=30";
        }

        // ==========================================
        // 1. USER AUTHENTICATION & REGISTRATION
        // ==========================================

        public static User AuthenticateUser(string emailOrPhone, string password)
        {
            using (SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                string query = @"SELECT UserId, FullName, Email, PhoneNumber, Age, Role, Password, CreatedAt 
                                 FROM Users 
                                 WHERE (LOWER(Email) = LOWER(@Identifier) OR PhoneNumber = @Identifier) 
                                   AND Password = @Password";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Identifier", emailOrPhone.Trim());
                    cmd.Parameters.AddWithValue("@Password", password.Trim());

                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return new User
                            {
                                Id = Convert.ToInt32(reader["UserId"]),
                                FullName = reader["FullName"].ToString(),
                                Email = reader["Email"].ToString(),
                                PhoneNumber = reader["PhoneNumber"] != DBNull.Value ? reader["PhoneNumber"].ToString() : "",
                                Age = reader["Age"] != DBNull.Value ? Convert.ToInt32(reader["Age"]) : 0,
                                Role = reader["Role"].ToString(),
                                Password = reader["Password"].ToString(),
                                CreatedAt = Convert.ToDateTime(reader["CreatedAt"])
                            };
                        }
                    }
                }
            }
            return null;
        }

        public static bool RegisterUser(User user, out string errorMessage)
        {
            errorMessage = string.Empty;
            using (SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                // Check if user already exists
                string checkQuery = "SELECT COUNT(1) FROM Users WHERE LOWER(Email) = LOWER(@Email)";
                using (SqlCommand checkCmd = new SqlCommand(checkQuery, conn))
                {
                    checkCmd.Parameters.AddWithValue("@Email", user.Email);
                    conn.Open();
                    int count = Convert.ToInt32(checkCmd.ExecuteScalar());
                    if (count > 0)
                    {
                        errorMessage = "An account with this email address already exists.";
                        return false;
                    }
                }

                // Insert new user
                string insertQuery = @"INSERT INTO Users (FullName, Email, PhoneNumber, Age, Role, Password, CreatedAt)
                                       VALUES (@FullName, @Email, @PhoneNumber, @Age, @Role, @Password, GETDATE());
                                       SELECT SCOPE_IDENTITY();";

                using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@FullName", user.FullName ?? "");
                    cmd.Parameters.AddWithValue("@Email", user.Email);
                    cmd.Parameters.AddWithValue("@PhoneNumber", (object)user.PhoneNumber ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Age", user.Age > 0 ? (object)user.Age : DBNull.Value);
                    cmd.Parameters.AddWithValue("@Role", string.IsNullOrEmpty(user.Role) ? "Citizen" : user.Role);
                    cmd.Parameters.AddWithValue("@Password", user.Password);

                    object newId = cmd.ExecuteScalar();
                    if (newId != null && newId != DBNull.Value)
                    {
                        user.Id = Convert.ToInt32(newId);
                        return true;
                    }
                }
            }
            errorMessage = "Failed to register user. Please try again.";
            return false;
        }

        public static User GetUserByEmail(string email)
        {
            using (SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                string query = "SELECT UserId, FullName, Email, PhoneNumber, Age, Role, CreatedAt FROM Users WHERE LOWER(Email) = LOWER(@Email)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email.Trim());
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return new User
                            {
                                Id = Convert.ToInt32(reader["UserId"]),
                                FullName = reader["FullName"].ToString(),
                                Email = reader["Email"].ToString(),
                                PhoneNumber = reader["PhoneNumber"] != DBNull.Value ? reader["PhoneNumber"].ToString() : "",
                                Age = reader["Age"] != DBNull.Value ? Convert.ToInt32(reader["Age"]) : 0,
                                Role = reader["Role"].ToString(),
                                CreatedAt = Convert.ToDateTime(reader["CreatedAt"])
                            };
                        }
                    }
                }
            }
            return null;
        }

        public static bool UpdateUserProfile(User user)
        {
            using (SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                string query = @"UPDATE Users 
                                 SET FullName = @FullName, 
                                     PhoneNumber = @PhoneNumber, 
                                     Age = @Age, 
                                     Role = @Role 
                                 WHERE LOWER(Email) = LOWER(@Email)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@FullName", user.FullName ?? "");
                    cmd.Parameters.AddWithValue("@PhoneNumber", (object)user.PhoneNumber ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Age", user.Age > 0 ? (object)user.Age : DBNull.Value);
                    cmd.Parameters.AddWithValue("@Role", string.IsNullOrEmpty(user.Role) ? "Citizen" : user.Role);
                    cmd.Parameters.AddWithValue("@Email", user.Email);

                    conn.Open();
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }

        public static bool UpdateUserPassword(string email, string newPassword)
        {
            using (SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                string query = "UPDATE Users SET Password = @Password WHERE LOWER(Email) = LOWER(@Email)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Password", newPassword.Trim());
                    cmd.Parameters.AddWithValue("@Email", email.Trim());

                    conn.Open();
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }

        // ==========================================
        // 2. COLLECTIONS: SERVICE CATEGORIES & APPS
        // ==========================================

        public static List<ServiceCategory> GetAllCategories()
        {
            List<ServiceCategory> list = new List<ServiceCategory>();

            using (SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                string query = "SELECT CategoryId, CategoryKey, CategoryName, Description, PageUrl, IsActive FROM ServiceCategories WHERE IsActive = 1 ORDER BY CategoryName";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            list.Add(new ServiceCategory
                            {
                                Id = Convert.ToInt32(reader["CategoryId"]),
                                CategoryKey = reader["CategoryKey"].ToString(),
                                CategoryName = reader["CategoryName"].ToString(),
                                Description = reader["Description"].ToString(),
                                PageUrl = reader["PageUrl"].ToString(),
                                IsActive = Convert.ToBoolean(reader["IsActive"])
                            });
                        }
                    }
                }
            }
            return list;
        }

        public static string SubmitServiceApplication(ServiceApplication app)
        {
            string appNo = "OG-" + DateTime.Now.ToString("yyyyMMdd") + "-" + new Random().Next(1000, 9999);
            app.ApplicationNo = appNo;

            using (SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                string query = @"INSERT INTO ServiceApplications 
                                 (ApplicationNo, UserId, ApplicantName, ApplicantEmail, ApplicantPhone, ServiceCategory, ApplicationType, Status, Address, City, Remarks, AppliedAt)
                                 VALUES 
                                 (@AppNo, @UserId, @Name, @Email, @Phone, @Category, @Type, @Status, @Address, @City, @Remarks, GETDATE());
                                 SELECT SCOPE_IDENTITY();";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@AppNo", app.ApplicationNo);
                    cmd.Parameters.AddWithValue("@UserId", app.UserId.HasValue ? (object)app.UserId.Value : DBNull.Value);
                    cmd.Parameters.AddWithValue("@Name", app.ApplicantName ?? "");
                    cmd.Parameters.AddWithValue("@Email", app.ApplicantEmail ?? "");
                    cmd.Parameters.AddWithValue("@Phone", (object)app.ApplicantPhone ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Category", app.ServiceCategory ?? "General");
                    cmd.Parameters.AddWithValue("@Type", app.ApplicationType ?? "New Application");
                    cmd.Parameters.AddWithValue("@Status", string.IsNullOrEmpty(app.Status) ? "Submitted" : app.Status);
                    cmd.Parameters.AddWithValue("@Address", (object)app.Address ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@City", (object)app.City ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Remarks", (object)app.Remarks ?? DBNull.Value);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    return appNo;
                }
            }
        }

        public static List<ServiceApplication> GetApplicationsByUser(string email)
        {
            List<ServiceApplication> list = new List<ServiceApplication>();

            using (SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                string query = @"SELECT ApplicationId, ApplicationNo, ApplicantName, ApplicantEmail, ApplicantPhone, ServiceCategory, ApplicationType, Status, Address, City, Remarks, AppliedAt
                                 FROM ServiceApplications
                                 WHERE LOWER(ApplicantEmail) = LOWER(@Email)
                                 ORDER BY AppliedAt DESC";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email.Trim());
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            list.Add(new ServiceApplication
                            {
                                Id = Convert.ToInt32(reader["ApplicationId"]),
                                ApplicationNo = reader["ApplicationNo"].ToString(),
                                ApplicantName = reader["ApplicantName"].ToString(),
                                ApplicantEmail = reader["ApplicantEmail"].ToString(),
                                ApplicantPhone = reader["ApplicantPhone"] != DBNull.Value ? reader["ApplicantPhone"].ToString() : "",
                                ServiceCategory = reader["ServiceCategory"].ToString(),
                                ApplicationType = reader["ApplicationType"].ToString(),
                                Status = reader["Status"].ToString(),
                                Address = reader["Address"] != DBNull.Value ? reader["Address"].ToString() : "",
                                City = reader["City"] != DBNull.Value ? reader["City"].ToString() : "",
                                Remarks = reader["Remarks"] != DBNull.Value ? reader["Remarks"].ToString() : "",
                                CreatedAt = Convert.ToDateTime(reader["AppliedAt"])
                            });
                        }
                    }
                }
            }
            return list;
        }

        public static bool SaveContactInquiry(string fullName, string email, string phone, string category, string subject, string message)
        {
            using (SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                string query = @"INSERT INTO ContactInquiries (FullName, Email, PhoneNumber, ServiceCategory, Subject, Message, Status, SubmittedAt)
                                 VALUES (@FullName, @Email, @Phone, @Category, @Subject, @Message, 'Pending', GETDATE())";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@FullName", fullName ?? "");
                    cmd.Parameters.AddWithValue("@Email", email ?? "");
                    cmd.Parameters.AddWithValue("@Phone", (object)phone ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Category", (object)category ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Subject", subject ?? "");
                    cmd.Parameters.AddWithValue("@Message", message ?? "");

                    conn.Open();
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }
    }
}
