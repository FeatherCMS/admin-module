# Admin module

This module provides an admin interface for Feather CMS.

## Installation

You can use the Swift Package Manager to integrate this module.

```swift
// add to your dependencies 
.package(url: "https://github.com/FeatherCMS/admin-module", from: "1.0.0-beta"),

// add to your target
.product(name: "AdminModule", package: "admin-module"),
```

## Admin module hooks

### admin-routes

You can register your own admin endpoints through this hook (only authenticated users with admin access can use them). 

```swift
app.hooks.register("admin-routes", use: (router as! UserRouter).adminRoutesHook)

func adminRoutesHook(args: HookArguments) {
    let req = args["req"] as! Request
    
    /// register your own admin routes here...
}
```

### admin-auth-middlewares

You can return auth middlewares to provide the user authentication logic for the admin endpoints. 

The [User module](https://github.com/FeatherCMS/user-module) provides a guard & redirect middleware and an access middleware for the `UserModel` type. 


```swift
app.hooks.register("admin-auth-middlewares", use: adminAuthMiddlewaresHook)

func adminAuthMiddlewaresHook(args: HookArguments) -> [Middleware] {
    [UserModel.redirectMiddleware(path: "/login/?redirect=/admin/"), UserAccessMiddleware(name: "admin.module.access")]
}
```
