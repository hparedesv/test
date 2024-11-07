import { Injectable } from '@angular/core';
import { HttpInterceptor, HttpRequest, HttpHandler, HttpEvent } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable()
export class AuthInterceptorService implements HttpInterceptor {

    constructor() {}

    intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {

        if (req.url.includes('/auth/login')) {
            return next.handle(req);
        }

        const newHeaders: any = {};
        let hasContentType = false;
        for (const key of req.headers.keys()) {
            if (key.toLowerCase() === 'content-type') {
                hasContentType = true;
            }
            newHeaders[key] = req.headers.get(key);
        }

        if (!hasContentType) {
            if(!(req.body instanceof FormData)) {
                newHeaders['Content-Type'] = 'application/json';
            } else {
                newHeaders['Content-Type'] = 'application/x-www-form-urlencoded';
            }
        }

        if (req.method !== 'GET') {
            const token =  localStorage.getItem('token');
            newHeaders['Authorization'] = `Bearer ${token}`;
        }

        req = req.clone({
            setHeaders: newHeaders
        });
        return next.handle(req);
    }
}
