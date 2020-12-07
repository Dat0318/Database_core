namespace Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class a : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.ProductOrders",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        ProductId = c.Guid(nullable: false),
                        OrderId = c.Guid(nullable: false),
                        Amount = c.Int(nullable: false),
                        Locked = c.Boolean(nullable: false),
                        CreatedBy = c.String(maxLength: 255),
                        CreatedAt = c.DateTime(nullable: false),
                        ModifiedBy = c.String(maxLength: 255),
                        ModifiedAt = c.DateTime(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Orders", t => t.OrderId, cascadeDelete: true)
                .ForeignKey("dbo.Products", t => t.ProductId, cascadeDelete: true)
                .Index(t => t.ProductId)
                .Index(t => t.OrderId);
            
            CreateTable(
                "dbo.Orders",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        Address = c.String(nullable: false, maxLength: 500),
                        Phone = c.String(nullable: false),
                        Email = c.String(maxLength: 500),
                        FullName = c.String(maxLength: 500),
                        Locked = c.Boolean(nullable: false),
                        CreatedBy = c.String(maxLength: 255),
                        CreatedAt = c.DateTime(nullable: false),
                        ModifiedBy = c.String(maxLength: 255),
                        ModifiedAt = c.DateTime(),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.ProductOrders", "ProductId", "dbo.Products");
            DropForeignKey("dbo.ProductOrders", "OrderId", "dbo.Orders");
            DropIndex("dbo.ProductOrders", new[] { "OrderId" });
            DropIndex("dbo.ProductOrders", new[] { "ProductId" });
            DropTable("dbo.Orders");
            DropTable("dbo.ProductOrders");
        }
    }
}
