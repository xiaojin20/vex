module server

import ctx

pub struct Middleware {
    handler ctx.MutHandlerFunc
}

pub fn (mut srv Server) use(handler fn (req mut ctx.Req, res mut ctx.Resp)) {
    mut mw := Middleware{ handler: ctx.MutHandlerFunc(handler) }
    
    srv.middlewares << mw
}