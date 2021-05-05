fun main(args: Array<String>) {
    println("Answer = ${numSumUp(readLine()!!.toInt())}")
    println("Answer = ${numSumTail(readLine()!!.toInt())}")
}

fun numSumUp(x:Int): Int = if(x/10 == 0) x%10 else numSumUp(x/10)+x%10 //Exc 1

fun numSumTail(x: Int,summ: Int) : Int = if(x>0) numSumTail(x/10,summ+(x%10)) else summ //Exc 2
fun numSumTail(x: Int): Int = numSumTail(x,0)

