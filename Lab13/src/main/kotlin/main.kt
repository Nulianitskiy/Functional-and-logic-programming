fun main(args: Array<String>) {
    numSum(1234)
    numMin(1234)
    numMax(1234)
    numMult(1234)
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
