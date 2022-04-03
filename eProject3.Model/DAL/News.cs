namespace eProject3.Model.DAL
{
    using System;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Web.Mvc;

    [Table("News")]
    public partial class News
    {
        public Guid Id { get; set; }
        [DisplayName("Tên")]
        [StringLength(256)]
        [Required(ErrorMessage = "Bạn chưa nhập tiêu Đề")]
        public string Name { get; set; }
        [DisplayName("Tóm tắt")]
        public string Summary { get; set; }
        [StringLength(256)]
        [DisplayName("Tiêu đề")]
        public string MetaTitle { get; set; }
        [DisplayName("Mô tả")]
        [AllowHtml]
        public string Description { get; set; }
        [StringLength(256)]
        [DisplayName("Hình ảnh")]
        public string UrlImage { get; set; }
        [DisplayName("Loại tin tức")]
        public Guid? NewsCategoryId { get; set; }
        public int? Warranty { get; set; }
        [DisplayName("Từ khóa tìm kiếm")]
        [StringLength(256)]
        public string MetaKeywords { get; set; }
        [DisplayName("Mô tả chi tiết")]
        [StringLength(256)]
        public string MetaDescriptions { get; set; }
        public DateTime? TopHot { get; set; }
        public int? ViewCount { get; set; }
        [StringLength(256)]
        public string Tag { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy HH:mm}", ApplyFormatInEditMode = true)]
        [Display(Name = "Ngày tạo")]
        public DateTimeOffset? CreatedOn { get; set; }
        [StringLength(256)]
        public string CreatedBy { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy HH:mm}", ApplyFormatInEditMode = true)]
        public DateTimeOffset? ModifiedOn { get; set; }
        [StringLength(256)]
        public string ModifiedBy { get; set; }
        public bool IsDeleted { get; set; }
        public virtual NewsCategory NewsCategory { get; set; }
    }
}
