using System.ComponentModel.DataAnnotations;

namespace eHairdressers.Services.Database
{
    public class Reviews
    {
        [Key]
        public int ReviewId { get; set; }

        public int ProductId { get; set; }

        public int CustomerId { get; set; }

        public DateTime Date { get; set; }

        public int Review { get; set; }

        public virtual Customers Customer { get; set; } = null!;

        public virtual Products Product { get; set; } = null!;
    }
}