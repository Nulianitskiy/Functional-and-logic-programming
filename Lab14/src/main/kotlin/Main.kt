fun main(args: Array<String>) {
    //println("Answer for sum by up recursion= ${numSumUp(readLine()!!.toInt())}")

    //println("Answer for sum by tail recursion= ${numSumTail(readLine()!!.toInt())}")

    //println("Answer for mult by up recursion= ${numMultUp(readLine()!!.toInt())}")
    //println("Answer for mult by tail recursion= ${numMultTail(readLine()!!.toInt())}")
    //println("Answer for min by up recursion= ${numMinUp(readLine()!!.toInt())}")
    //println("Answer for min by tail recursion= ${numMinTail(readLine()!!.toInt())}")
    println("Answer for max by up recursion= ${numMaxUp(readLine()!!.toInt())}")
    println("Answer for max by tail recursion= ${numMaxTail(readLine()!!.toInt())}")
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
fun numMinUp(x:Int): Int = if(x/10 != 0) {if((x%100)/10 < x%10) numMinUp(x/10) else numMinUp((x/100)*10+x%10)} else x

fun numMinTail(x:Int, min:Int): Int = if(x>0) if(x%10 < min) numMinTail(x/10,x%10) else numMinTail(x/10,min) else min
fun numMinTail(x:Int): Int = numMinTail(x,x%10)
//
fun numMaxUp(x:Int): Int = if(x/10 != 0) {if((x%100)/10 > x%10) numMaxUp(x/10) else numMaxUp((x/100)*10+x%10)} else x

fun numMaxTail(x:Int, max:Int): Int = if(x>0) if(x%10 > max) numMaxTail(x/10,x%10) else numMaxTail(x/10,max) else max
fun numMaxTail(x:Int): Int = numMaxTail(x,x%10)