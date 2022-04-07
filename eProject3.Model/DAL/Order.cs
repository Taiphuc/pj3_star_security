﻿namespace eProject3.Model.DAL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Order")]
    public partial class Order
    {
        public Guid Id { get; set; }

        [Required]
        [StringLength(256)]
        [Display(Name = "Tên")]

        public string UserName { get; set; }

        [Display(Name = "Số điện thoại")]
        [Required]
        [StringLength(50)]
        [DataType(DataType.PhoneNumber)]
        public string Phone { get; set; }

        [Display(Name = "Địa chỉ")]
        [Required]
        [StringLength(256)]

        public string Address { get; set; }
        [Display(Name = "Email")]
        [RegularExpression(@"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z",
        ErrorMessage = "Không đúng định dạng email")]
        [Required]
        [StringLength(256)]
        public string Email { get; set; }

        public decimal? Price { get; set; }

        [Display(Name = "Trạng thái")]
        public bool Status { get; set; }

        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy HH:mm}", ApplyFormatInEditMode = true)]
        [Display(Name = "Ngày đặt hàng")]
        public DateTimeOffset? CreatedOn { get; set; }
        [StringLength(256)]
        [Display(Name = "Ngày tạo")]
        public string CreatedBy { get; set; }
        [Display(Name = "Ngày cập nhật")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy HH:mm}", ApplyFormatInEditMode = true)]
        public DateTimeOffset? ModifiedOn { get; set; }
        [StringLength(256)]
        [Display(Name = "Người cập nhật")]
        public string ModifiedBy { get; set; }
        [Display(Name = "Trạng thái")]
        public bool IsDeleted { get; set; }
    }
}
