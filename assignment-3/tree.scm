(define (insert lst x)
    (cond
        ((null? lst) (list x '() '()))
        ((= x (car lst)) lst)
        ((< x (car lst))
         (list(car lst)(insert (cadr lst) x)(caddr lst)))
        ((> x (car lst))
         (list(car lst)(cadr lst)(insert (caddr lst)x)))))

(define (member? lst x)
    (cond
        ((null? lst) #f)
        ((< x (car lst))
         (member (cadr lst) x))
        ((> x (car lst))
         (member (caddr lst) x))
         (else #t)))