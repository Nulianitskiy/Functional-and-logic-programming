fun main(args: Array<String>) {
    meth1(12345)
    meth2(123456)
    var ans = meth3(123456789)
    println("Method3 = $ans")
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

fun meth2(x:Int){
    var max = -1
    var y = x
    while (y > 0){
        if (y % 10 > max && (y%10)%3 !=0) max = y % 10
        y /= 10
    }
    println("modernMax is $max")
}

fun minDel(x:Int): Int{
    var i = 2
    while(x % i !=0) i++
    return i
}
fun meth3(x:Int):Int{
    var max = -1
    var sum = 0
    var y = x
    var mindel = minDel(x)
    while (y > 0){
        if (y % 10 > max && gcd(y % 10, x)==1 && (y % 10) % mindel != 0) max = y % 10
        if (y % 10 < 5) sum += y % 10
        y /= 10
    }
    if(max<0){
        println("Число говна конечно")
        return -1
    }
    println("max = $max sum = $sum")
    return max*sum
}