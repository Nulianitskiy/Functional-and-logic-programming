import java.util.Objects.equals

fun main(args: Array<String>){
    println(digitCount(line))
}
val line = readLine()
/// Exc 1
fun findMaxInString(line:String?): String{
    val list = line!!.split(" ")
    var max = list[0].toInt()
    list.forEach{if(it.toInt()>max) max = it.toInt()}
    return max.toString()
}
/// Exc 2.4
fun palindromCheck(line:String?):Boolean = equals(line,line!!.reversed())
/// Exc 2.11
fun lineSize(line:String?):Int = line!!.split(" ").size
/// Exc 2.15
fun digitCount(line:String?):Int {
    return try{
        line!!.toInt()
        line.length
    }
    catch (e: Exception){
        0
    }
}