fun main(args: Array<String>) {
    meth1(12345)
}
fun numSum(x : Int){
    var sum = 0
    var y = x
    while (y>0){
        sum += y % 10
        y /= 10
    }
    println("Sum is $sum")
}
fun numMin(x:Int){
    var min = x % 10
    var y = x
    while (y > 0){
        if (y % 10 < min) min = y % 10
        y /= 10
    }
    println("Min is $min")
}
fun numMax(x:Int){
    var max = x % 10
    var y = x
    while (y > 0){
        if (y % 10 > max) max = y % 10
        y /= 10
    }
    println("Max is $max")
}
fun numMult(x:Int){
    var mult = 1
    var y = x
    while (y > 0){
        mult *= y % 10
        y /= 10
    }
    println("Mult is $mult")
}

fun gcd(a: Int, b: Int): Int {
    if (b == 0) return a
    return gcd(b, a % b)
}

fun meth1(x: Int){
    var count = 0
    var y = x
    var c = 1
    while(y>0){
        c = y%10
        y/=10
        if(c%2==1) continue
        if(gcd(c,x)==1) count++
    }
    println("Method1 = $count")
}
