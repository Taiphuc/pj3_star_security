using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eProject3.Model.DAL
{
    [Table("Career")]
    public class Career
    {
        public Guid Id { get; set; }

        [Display(Name = "Tiêu đề")]
        [Required(ErrorMessage = "Bạn chưa nhập tiêu đề")]
        [StringLength(255)]
        public string Name { get; set; }

        [Display(Name = "Mô tả")]
        public string Description { get; set; }

        [Display(Name = "Link ảnh")]
        public string UrlImage { get; set; }


        [Display(Name = "Ngày tạo")]
        public DateTimeOffset? CreatedOn { get; set; }

        [StringLength(50)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy HH:mm}", ApplyFormatInEditMode = true)]
        [Display(Name = "Người tạo")]
        public string CreatedBy { get; set; }

        public DateTimeOffset? ModifiedOn { get; set; }
        [StringLength(50)]
        [Display(Name = "Người cập nhật")]
        public string ModifiedBy { get; set; }

        [Display(Name = "Trạng thái")]
        public bool IsDeleted { get; set; }
        public Guid? BusinessId { get; set; }
        public virtual Business Business { get; set; }
    }
}
