package futil

import "core:fmt"


showList :: proc(v: [$S]$T) {
    for e in v {
        fmt.printf("%v, ",e)
    }
    fmt.printf("\n")
}

fmap :: proc(f: proc($T)->$U, vs: [$S]T) -> (out:[S]U) {
    for e,i in vs  {
        out[i] = f(e)
    }
    return out
}

forEach :: proc(f: proc($T)->$U, vs:[]T) {
    for e in vs {
        e = f(e)
    }
}

fold :: proc(f: proc($T,T)->$U, init: T, vs: [$S]T) -> (out:U) {
    out = f(init,vs[0])
    for i:=1; i<len(vs); i+=1 {
        out = f(out, vs[i])
    }
    return out
}
ndo :: proc(n: int, f: $T) {
    for i:=0; i<n; i+=1 { f() }
}

add :: proc(a:$T, b:T) -> T {
    return a+b
}
sub :: proc(a:$T, b:T) -> T {
    return a-b
}
mul :: proc(a:$T, b:T) -> T {
    return a*b
}
div :: proc(a:$T, b:T) -> T {
    return a/b
}
mod :: proc(a:$T, b:T) -> T {
    return a%b
}

@(private)
main :: proc() {
    fmt.printf("Hello, World!\n");
    ss := [?]rune{'a','b','c','d','e'}
    is := [?]int{1,2,3,4,5,6,7,8}
    fs := [?]f64{1.5,2.5,3.5,4.5,5.5,6.5,7.5,8.5}

    ndo(10, proc(){fmt.printf("10")})

    showList(ss)
    showList(is)
    showList(fs)

    showList(is * 2)
}

