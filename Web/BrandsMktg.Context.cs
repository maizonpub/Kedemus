﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class BrandsMktgBooksEntities : DbContext
    {
        public BrandsMktgBooksEntities()
            : base("name=BrandsMktgBooksEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<BookPoster> BookPosters { get; set; }
        public virtual DbSet<Book> Books { get; set; }
        public virtual DbSet<BooksLevel> BooksLevels { get; set; }
        public virtual DbSet<BookSlide> BookSlides { get; set; }
        public virtual DbSet<BookStory> BookStories { get; set; }
        public virtual DbSet<BookUniteFile> BookUniteFiles { get; set; }
        public virtual DbSet<BookUnite> BookUnites { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<cms_groups> cms_groups { get; set; }
        public virtual DbSet<cms_permissions> cms_permissions { get; set; }
        public virtual DbSet<cms_policies> cms_policies { get; set; }
        public virtual DbSet<cms_user> cms_user { get; set; }
        public virtual DbSet<Content> Contents { get; set; }
        public virtual DbSet<SchoolBook> SchoolBooks { get; set; }
        public virtual DbSet<School> Schools { get; set; }
        public virtual DbSet<StudentLibrary> StudentLibraries { get; set; }
        public virtual DbSet<Student> Students { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
    }
}
