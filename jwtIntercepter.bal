import ballerina/http;
import ballerina/log;


# Request Interceptor used to decode the JWT and authorize the user privileges
service class JwtInterceptor {
    *http:RequestInterceptor;
    isolated resource function 'default [string... path](http:RequestContext ctx, http:Request req)
    returns http:NextService|json|error? {

        string|error jwtAssertion = req.getHeader("x-jwt-assertion");
        log:printInfo("JWT assertion accessed in intercepter: " + check jwtAssertion);

        return {"token got in intercepter code": check jwtAssertion};

        
    }
}