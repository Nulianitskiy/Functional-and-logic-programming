import java.util.Objects.equals

fun main(args: Array<String>){
    choserOfMyHeart()
}
//val line = readLine()
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
/// Exc 2
fun choserOfMyHeart(){
    println("Выберите задачу:\n1 - Максимальное число из цифр\n2 - Проверка на палиндром\n3 - Количество слов\n4 - Количество цифр\n")
    val n = readLine()
    val line = readLine()
    when(n){
        "1" -> println(findMaxInString(line))
        "2" -> println(palindromCheck(line))
        "3" -> println(lineSize(line))
        "4" -> println(digitCount(line))
    }
}