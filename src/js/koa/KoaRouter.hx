package js.koa;

import js.RegExp;
import js.Error;
import haxe.extern.Rest;
import externtype.Mixed2;
import js.koa.Koa;

@:jsRequire("koa-router")
extern class KoaRouter {
    function new(?opt: KoaRouterOptions);

    /**
     * Register route with HEAD method.
     */
    @:overload(function (path: Mixed2<String, RegExp>, middleware: Rest<Middleware>): KoaRouter {})
    function head(name: String, path: Mixed2<String, RegExp>, middleware: Rest<Middleware>): KoaRouter;
    /**
     * Register route with OPTIONS method.
     */
    @:overload(function (path: Mixed2<String, RegExp>, middleware: Rest<Middleware>): KoaRouter {})
    function options(name: String, path: Mixed2<String, RegExp>, middleware: Rest<Middleware>): KoaRouter;
    /**
     * Register route with GET method.
     */
    @:overload(function (path: Mixed2<String, RegExp>, middleware: Rest<Middleware>): KoaRouter {})
    function get(name: String, path: Mixed2<String, RegExp>, middleware: Rest<Middleware>): KoaRouter;
    /**
     * Register route with POST method.
     */
    @:overload(function (path: Mixed2<String, RegExp>, middleware: Rest<Middleware>): KoaRouter {})
    function post(name: String, path: Mixed2<String, RegExp>, middleware: Rest<Middleware>): KoaRouter;
    /**
     * Register route with PUT method.
     */
    @:overload(function (path: Mixed2<String, RegExp>, middleware: Rest<Middleware>): KoaRouter {})
    function put(name: String, path: Mixed2<String, RegExp>, middleware: Rest<Middleware>): KoaRouter;
    /**
     * Register route with PATCH method.
     */
    @:overload(function (path: Mixed2<String, RegExp>, middleware: Rest<Middleware>): KoaRouter {})
    function patch(name: String, path: Mixed2<String, RegExp>, middleware: Rest<Middleware>): KoaRouter;
    /**
     * Register route with DELETE method.
     */
    @:overload(function (path: Mixed2<String, RegExp>, middleware: Rest<Middleware>): KoaRouter {})
    function delete(name: String, path: Mixed2<String, RegExp>, middleware: Rest<Middleware>): KoaRouter;
    /**
     * Register route with DELETE method.
     */
    @:overload(function (path: Mixed2<String, RegExp>, middleware: Rest<Middleware>): KoaRouter {})
    function del(name: String, path: Mixed2<String, RegExp>, middleware: Rest<Middleware>): KoaRouter;

    /**
     * Register route with all methods.
     */
    @:overload(function (path: Mixed2<String, RegExp>, middleware: Rest<Middleware>): KoaRouter {})
    function all(name: String, path: Mixed2<String, RegExp>, middleware: Rest<Middleware>): KoaRouter;

    /**
     * Use given middleware.
     */
    @:overload(function (middleware: Rest<Middleware>): KoaRouter {})
    function use(path: String, middleware: Rest<Middleware>): KoaRouter;

    /**
     * Set the path prefix for a Router instance that was already initialized.
     */
    function prefix(prefix: String): KoaRouter;

    /**
     * Returns router middleware which dispatches a route matching the request.
     */
    function routes(): Middleware;

    /**
     * Returns separate middleware for responding to `OPTIONS` requests with
     * an `Allow` header containing the allowed methods, as well as responding
     * with `405 Method Not Allowed` and `501 Not Implemented` as appropriate.
     **/
    function allowedMethods(?options: KoaRouterAllowedMethodsOptions): Middleware;

    /**
     * Redirect `source` to `destination` URL with optional 30x status `code`.
     */
    function redirect(source: String, destination: String, ?code: Int): KoaRouter;

    /**
     * Lookup route with given `name`.
     */
    function route(name: String): Mixed2<Layer, Bool>;

    /**
     * Generate URL for route. Takes a route name and map of named `params`.
     */
    function url(name: String, params: {}, ?options: KoaRouterUrlOptions): Mixed2<String, Error>;

    /**
     * Run middleware for named route parameters. Useful for auto-loading or validation.
     */
    function param(param: String, middleware: ParamedMiddleware): KoaRouter;

    /**
     * Generate URL from url pattern and given params.
     */
    static function url(path: String, ?params: {}): String;
}

typedef KoaRouterOptions = {
    /**
     * Prefix for all routes.
     */
    @:optional var prefix: String;
    /**
     * Methods which should be supported by the router.
     */
    @:optional var methods: Array<String>;
    @:optional var routerPath: String;
    /**
     * Whether or not routing should be case-sensitive.
     */
    @:optional var sensitive: Bool;
    /**
     * Whether or not routes should matched strictly.
     *
     * If strict matching is enabled, the trailing slash is taken into
     * account when matching routes.
     */
    @:optional var strict: Bool;
}

typedef KoaRouterAllowedMethodsOptions = {
    /**
     * throw error instead of setting status and header
     */
    // TODO Haxe 4
    // @:optional @:native('throw') var throwError: Bool;
    /**
     * throw the returned value in place of the default NotImplemented error
     */
    @:optional var notImplemented: Void -> Dynamic;
    /**
     * throw the returned value in place of the default MethodNotAllowed error
     */
    @:optional var methodNotAllowed: Void -> Dynamic;
}

typedef KoaRouterUrlOptions = {
    var query: String;
}

typedef ParamedMiddleware = Mixed2<
    String -> Context -> Next -> Void,
    String -> Context -> Next -> Promise<Void>
>;

extern class Layer { }