print((lambda input:
    sum(sorted(map(
        (lambda Y:
            Y(
                lambda f: lambda i, acc=0: (
                    (lambda n:
                        (lambda _: f(n, acc+i))
                        if n > 0
                        else (lambda _: acc+i)
                    )(next(input, 0))
                )(None)
            )
        )(lambda f: (lambda g: f(g(g)))(lambda g: f(lambda *a: g(g)(*a)))),
        input
    ), reverse=True)[:3])
)(
    map(
        (lambda i: int(i) if len(i) else 0),
        open('input.txt').read().split('\n')
    )
))
