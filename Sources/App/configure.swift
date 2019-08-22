import Vapor

public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    
    // Register providers first
    //    try services.register(FluentSQLiteProvider())
    
    // Register routes to the router.
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)
    
    // Register middleware.
    var middlewares = MiddlewareConfig()
    middlewares.use(FileMiddleware.self)
    middlewares.use(ErrorMiddleware.self)
    services.register(middlewares)
    
    // Configure a database.
    //    let sqlite = try SQLiteDatabase(storage: .memory)
    
    // Register the configured SQLite database to the database config.
    //    var databases = DatabasesConfig()
    //    databases.add(database: sqlite, as: .sqlite)
    //    services.register(databases)
    
    // Configure migrations.
    //    var migrations = MigrationConfig()
    //    migrations.add(model: .self, database: .sqlite)
    //    services.register(migrations)
}
