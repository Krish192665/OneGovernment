using System;

namespace OneGovernment.Models
{
    /// <summary>
    /// Demonstrates OOP Abstraction: Abstract base class for all entity models.
    /// </summary>
    public abstract class BaseEntity
    {
        public int Id { get; set; }
        public DateTime CreatedAt { get; set; } = DateTime.Now;

        /// <summary>
        /// Demonstrates OOP Polymorphism: Virtual method overridden by child classes.
        /// </summary>
        public virtual string GetSummary()
        {
            return $"Entity ID: {Id}, Created: {CreatedAt:dd-MM-yyyy}";
        }
    }
}
