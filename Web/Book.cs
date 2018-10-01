//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Web
{
    using System;
    using System.Collections.Generic;
    
    public partial class Book
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Book()
        {
            this.BookPosters = new HashSet<BookPoster>();
            this.BookUnites = new HashSet<BookUnite>();
            this.BookSlides = new HashSet<BookSlide>();
            this.BookStories = new HashSet<BookStory>();
            this.SchoolBooks = new HashSet<SchoolBook>();
            this.StudentLibraries = new HashSet<StudentLibrary>();
        }
    
        public int id { get; set; }
        public string title { get; set; }
        public string pdf { get; set; }
        public string thumb { get; set; }
        public Nullable<bool> isAvailable { get; set; }
        public Nullable<int> levelId { get; set; }
        public string lang { get; set; }
        public Nullable<int> categoryId { get; set; }
        public Nullable<bool> isSingleBook { get; set; }
        public string VimeoId { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BookPoster> BookPosters { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BookUnite> BookUnites { get; set; }
        public virtual BooksLevel BooksLevel { get; set; }
        public virtual Category Category { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BookSlide> BookSlides { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BookStory> BookStories { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SchoolBook> SchoolBooks { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StudentLibrary> StudentLibraries { get; set; }
    }
}
