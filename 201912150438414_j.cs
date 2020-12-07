namespace Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class j : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Sys_Users",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        UserName = c.String(nullable: false, maxLength: 255),
                        FullName = c.String(nullable: false, maxLength: 100),
                        Gender = c.Boolean(nullable: false),
                        Password = c.String(nullable: false, maxLength: 128),
                        LastLogin = c.DateTime(),
                        BirthDate = c.DateTime(nullable: false),
                        Tel = c.String(maxLength: 50),
                        Email = c.String(nullable: false, maxLength: 50),
                        Avatar = c.String(maxLength: 500),
                        CheckChange = c.DateTime(),
                        Locked = c.Boolean(nullable: false),
                        CreatedBy = c.String(maxLength: 255),
                        CreatedAt = c.DateTime(nullable: false),
                        ModifiedBy = c.String(maxLength: 255),
                        ModifiedAt = c.DateTime(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Products",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        Title = c.String(nullable: false, maxLength: 500),
                        Price = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Unit = c.String(),
                        Ingredient = c.String(maxLength: 500),
                        Note = c.String(maxLength: 500),
                        Origin = c.String(maxLength: 500),
                        DateOfManufacture = c.DateTime(),
                        ImageUrl = c.String(maxLength: 500),
                        Content = c.String(),
                        CategoryId = c.Guid(nullable: false),
                        Locked = c.Boolean(nullable: false),
                        CreatedBy = c.String(maxLength: 255),
                        CreatedAt = c.DateTime(nullable: false),
                        ModifiedBy = c.String(maxLength: 255),
                        ModifiedAt = c.DateTime(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Categories", t => t.CategoryId, cascadeDelete: true)
                .Index(t => t.CategoryId);
            
            CreateTable(
                "dbo.Categories",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        Name = c.String(nullable: false, maxLength: 500),
                        Description = c.String(maxLength: 250),
                        Locked = c.Boolean(nullable: false),
                        CreatedBy = c.String(maxLength: 255),
                        CreatedAt = c.DateTime(nullable: false),
                        ModifiedBy = c.String(maxLength: 255),
                        ModifiedAt = c.DateTime(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.ArticleCategories",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        Name = c.String(nullable: false, maxLength: 500),
                        Description = c.String(maxLength: 250),
                        ParentId = c.Guid(),
                        Locked = c.Boolean(nullable: false),
                        CreatedBy = c.String(maxLength: 255),
                        CreatedAt = c.DateTime(nullable: false),
                        ModifiedBy = c.String(maxLength: 255),
                        ModifiedAt = c.DateTime(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.ArticleCategories", t => t.ParentId)
                .Index(t => t.ParentId);
            
            CreateTable(
                "dbo.Articles",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        Title = c.String(nullable: false, maxLength: 500),
                        TitleNormalize = c.String(maxLength: 500),
                        Description = c.String(maxLength: 1000),
                        Tags = c.String(maxLength: 2000),
                        ImageUrl = c.String(maxLength: 500),
                        Content = c.String(nullable: false),
                        Color = c.String(maxLength: 10),
                        Position = c.Int(),
                        ArticleCategoryId = c.Guid(nullable: false),
                        Locked = c.Boolean(nullable: false),
                        CreatedBy = c.String(maxLength: 255),
                        CreatedAt = c.DateTime(nullable: false),
                        ModifiedBy = c.String(maxLength: 255),
                        ModifiedAt = c.DateTime(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.ArticleCategories", t => t.ArticleCategoryId, cascadeDelete: true)
                .Index(t => t.ArticleCategoryId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Articles", "ArticleCategoryId", "dbo.ArticleCategories");
            DropForeignKey("dbo.ArticleCategories", "ParentId", "dbo.ArticleCategories");
            DropForeignKey("dbo.Products", "CategoryId", "dbo.Categories");
            DropIndex("dbo.Articles", new[] { "ArticleCategoryId" });
            DropIndex("dbo.ArticleCategories", new[] { "ParentId" });
            DropIndex("dbo.Products", new[] { "CategoryId" });
            DropTable("dbo.Articles");
            DropTable("dbo.ArticleCategories");
            DropTable("dbo.Categories");
            DropTable("dbo.Products");
            DropTable("dbo.Sys_Users");
        }
    }
}
