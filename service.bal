import ballerina/http;

JwtInterceptor jwtInterceptor = new;

@http:ServiceConfig {
    cors: {
        allowOrigins: ["*"],
        allowMethods: ["GET", "POST", "PUT", "PATCH", "DELETE"],
        allowHeaders: ["Authorization", "Content-Type", "Content-Type", "Accept"],
        allowCredentials: false,
        maxAge: 84900
    },
    interceptors: [jwtInterceptor]
}


service / on new http:Listener(9090) {


    resource function get tokenProcess(http:Request req) returns json|error {


         string xjwt = check req.getHeader("x-jwt-assertion");   


        return { "token got in service code": xjwt};


    }

}