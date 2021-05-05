import jdk.nashorn.internal.objects.NativeArray.forEach

fun main(args: Array<String>) {
    println("Hello world!")
}
fun numSum(x : Int):Int{
    var sum = 0
    var y = x
    while (y>0){
        sum += y % 10
        y /= 10
    }
    println("Sum is $sum")
    return sum
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
        if(gcd(c,x)!=1) {count++
            print("$c , ")}
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
        if (y % 10 > max && gcd(y % 10, x)!=1 && (y % 10) % mindel != 0) max = y % 10
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

fun choser(){
    println("Итак, есть 4 варианта:\n 1 - Поиск суммы цифр \n 2 - Поиск минимума \n " +
            "3 - Поиск максимума \n 4 - Поиск произведения цифр \n " +
            "5 - Найти количество четных чисел, не взаимно простых с данным \n " +
            "6 - Найти максимальную цифры числа, не делящуюся на 3 \n " +
            "7 - Найти произведение максимального числа, не взаимно простого\n " +
            "с данным, не делящегося на наименьший делитель исходно числа, и\n " +
            "суммы цифр числа, меньших 5 \n " +
            "8 - Factorial digit sum \n " +
            " Любой другой символ остановит программу")
    var choser = readLine()
    when(choser){
        "1" -> {println("Введите значение: ")
            val y = readLine()!!.toInt()
            numSum(y)
            choser()}
        "2" ->{println("Введите значение: ")
            val y = readLine()!!.toInt()
            numMin(y)
            choser()}
        "3"->{println("Введите значение: ")
            val y = readLine()!!.toInt()
            numMax(y)
            choser()}
        "4"->{println("Введите значение: ")
            val y = readLine()!!.toInt()
            numMult(y)
            choser()}
        "5"->{println("Введите значение: ")
            val y = readLine()!!.toInt()
            meth1(y)
            choser()}
        "6"->{println("Введите значение: ")
            val y = readLine()!!.toInt()
            meth2(y)
            choser()}
        "7"->{println("Введите значение: ")
            val y = readLine()!!.toInt()
            meth3(y)
            choser()}
        "8"->{println("Введите значение: ")
            val y = readLine()!!.toInt()
            factorialDigitSum(y)
            choser()}
        else -> println("Ок, значит, на этом мы и закончим")
    }
}

fun factorial(num: Int): Long {//10.20
    var result = 1L
    for (i in 2..num) result *= i
    return result
}
fun factorialDigitSum(number: Int): Int{
    var res = factorial(number).toInt()
    return numSum(res)
}
fun countDigits(num:Int,count:Int):Int = if(num >0) countDigits(num/10,count+1) else  count

fun digitInNum(num:Int,i:Int): Int {
    var number = num
    for(n in 0..i-countDigits(num,0))
        number /=10
    return number%10
}
fun charlemagne(num:Int):Int {
    var number = num
    var i = 0
    var n = 0
    while (number >= n){
        i++
        n = countDigits(i,0)
        number -= n
    }
    return digitInNum(number,n)
}