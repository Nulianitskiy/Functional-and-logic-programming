fun main(args: Array<String>) {
    numWork(1234)
}
fun numWork(x : Int){
    var sum = 0
    var y = x
    while (y>0){
        sum += y % 10
        y /= 10
    }
    println("Answer is $sum")
}