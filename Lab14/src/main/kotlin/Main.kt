import kotlin.math.pow
fun main(args: Array<String>) {
    //println("Answer for sum by up recursion= ${numSumUp(readLine()!!.toInt())}")

    //println("Answer for sum by tail recursion= ${numSumTail(readLine()!!.toInt())}")

    //println("Answer for mult by up recursion= ${numMultUp(readLine()!!.toInt())}")
    //println("Answer for mult by tail recursion= ${numMultTail(readLine()!!.toInt())}")
    //println("Answer for min by up recursion= ${numMinUp(readLine()!!.toInt())}")
    //println("Answer for min by tail recursion= ${numMinTail(readLine()!!.toInt())}")
    //println("Answer for max by up recursion= ${numMaxUp(readLine()!!.toInt())}")
    //println("Answer for max by tail recursion= ${numMaxTail(readLine()!!.toInt())}")

    //println("Answer for analyzer= ${anlDefFunc(readLine()!!.toInt(),::numSumUp,0)}")

    //Сумма всех цифр, если каждая из них меньше 5
    //println("Answer for 1 modern analyzer= ${modernAnl(readLine()!!.toInt(),::numSumUp,::checkAllLow5)}")
    //Произведение всех цифр, если каждая из них больше 5
    //println("Answer for 2 modern analyzer= ${modernAnl(readLine()!!.toInt(),::numMultUp,::checkAllUp5)}")
    //Минимальная цифра в четном мире
    //println("Answer for 3 modern analyzer= ${modernAnl(readLine()!!.toInt(),::numMinUp,::checkAllEven)}")

    //println("Answer for 1 modern Meth= ${recMeth1(readLine()!!.toInt())}")
    //println("Answer for 2 modern Meth= ${recMeth2(readLine()!!.toInt())}")
    //println("Answer for 3 modern Meth= ${recMeth3(readLine()!!.toInt())}")

    //println("Answer for 20 = ${factorialDigitSum(readLine()!!.toInt())}")
    println(anlDefFunc(readLine()!!.toInt(),funByFun(),0))
}
//Exc 1
fun numSumUp(x:Int): Int = if(x/10 == 0) x%10 else numSumUp(x/10)+x%10

//Exc 2
fun numSumTail(x: Int,sum: Int) : Int = if(x>0) numSumTail(x/10,sum+(x%10)) else sum
fun numSumTail(x: Int): Int = numSumTail(x,0)

//Exc 3
fun numMultUp(x:Int): Int = if(x/10 == 0) x%10 else numMultUp(x/10)*(x%10)

fun numMultTail(x:Int,mult:Int): Int = if(x>0) numMultTail(x/10,mult*(x%10)) else mult
fun numMultTail(x: Int): Int = numMultTail(x,1)
//
fun numMinUp(x:Int): Int =
    if(x/10 != 0)
        if((x%100)/10 < x%10) numMinUp(x/10) else numMinUp((x/100)*10+x%10)
    else x

fun numMinTail(x:Int, min:Int): Int =
    if(x>0)
        if(x%10 < min) numMinTail(x/10,x%10) else numMinTail(x/10,min)
    else min
fun numMinTail(x:Int): Int = numMinTail(x,x%10)
//
fun numMaxUp(x:Int): Int =
    if(x/10 != 0)
        if((x%100)/10 > x%10) numMaxUp(x/10) else numMaxUp((x/100)*10+x%10)
    else x

fun numMaxTail(x:Int, max:Int): Int =
    if(x>0)
        if(x%10 > max) numMaxTail(x/10,x%10) else numMaxTail(x/10,max)
    else max
fun numMaxTail(x:Int): Int = numMaxTail(x,x%10)

//Exc 4
fun anlDefFunc(x:Int,func:(x:Int)->Int,Res:Int?):Int = func(x)

//Exc 5
fun modernAnl(x:Int,func:(num:Int)->Int,check:(ch:Int)->Boolean):Int = if(check(x)) func(x) else 0

//Exc 6
fun checkAllLow5(x:Int):Boolean =
    if(x>0)
        if(x%10 >= 5) false else checkAllLow5(x/10)
    else true
fun checkAllUp5(x:Int):Boolean =
    if(x>0)
        if(x%10 < 5) false else checkAllUp5(x/10)
    else true
fun checkAllEven(x:Int):Boolean =
    if(x>0)
        if(x%2 != 0) false else checkAllEven(x/10)
    else true

//Exc 7
fun checkEven(x:Int) = x%2 == 0

fun gcd(a: Int, b: Int): Int {
    if (b == 0) return a
    return gcd(b, a % b)
}
fun recMeth1(orig:Int,cur:Int,count:Int):Int =
    if(cur>0)
        if(checkEven(cur%10) && gcd(cur%10,orig)!=1) recMeth1(orig,cur/10,count+1)
        else recMeth1(orig,cur/10,count)
    else count
fun recMeth1(x:Int) = recMeth1(x,x,0)

//
fun checkDel3(x:Int) = x%3 == 0

fun recMeth2(orig:Int):Int =
    if(orig>0)
        if(checkDel3(numMaxUp(orig))) recMeth2(orig/10) else numMaxUp(orig)
    else -1

//
fun checkLow5(x:Int) = x < 5

fun nd(x:Int,y:Int = 2): Int = if(gcd(x,y) == 1) y else nd(x,y+1)

fun sumLow5(x:Int,sum:Int):Int =
    if(x>0) if(checkLow5(x%10)) sumLow5(x/10,sum+(x%10)) else sumLow5(x/10,sum)
    else sum

fun maxNotPrimeNotND(x:Int,cur:Int): Int =
    if(cur > 0)
        if(gcd(numMaxUp(cur),x)!=1&&numMaxUp(cur)%nd(x,2)!=0) numMaxUp(cur) else maxNotPrimeNotND(x,cur/10)
    else numMaxUp(cur)

fun recMeth3(x:Int): Int = sumLow5(x,0)*maxNotPrimeNotND(x,x)

//Exc 9
//20
fun factorial(num: Int,res:Int): Int =
    if(num>=2) factorial(num-1,res*num)
    else res

fun factorialDigitSum(number: Int) = numSumTail(factorial(number,1),0)

//40
fun myPow(x:Int,cx:Int,y:Int):Int = if(y!=0) myPow(x,cx*x,y-1) else cx
fun myPow(x:Int,y:Int) =  myPow(x,1,y)

fun numCount(x:Int,count: Int):Int = if(x>0) numCount(x/10,count+1) else count

fun getDigByNum(x: Int,num: Int) = (x/myPow(10,numCount(x,0)-num))%10

//Exc 8
fun funByFun():(num:Int)->Int{
    println("Выберите, функцию: 1 - Сумма цифр, 2 - Произведение цифр, 3 - Минимальная цифрв, 4 - Максимальная цифра ")

    return when(readLine()!!.toInt()){
        1 -> ::numSumUp
        2 -> ::numMultUp
        3 -> ::numMinUp
        4 -> ::numMaxUp
        else -> ::numSumUp
    }
}