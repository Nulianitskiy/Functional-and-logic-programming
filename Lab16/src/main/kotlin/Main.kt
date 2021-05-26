import java.util.Objects.equals

fun main(args: Array<String>){
    val line = readLine()
    kirillIsExit(line)
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
    println("Выберите задачу:\n1 - Максимальное число из цифр\n2 - Проверка на палиндром\n3 - Количество слов\n4 - Количество цифр")
    println("\n5 - Сколько чисел меньше 5\n6 - Сколько чисел больше 5\n7 - Неиспользованная латиница")
    val n = readLine()
    val line = readLine()
    when(n){
        "1" -> println(findMaxInString(line))
        "2" -> println(palindromCheck(line))
        "3" -> println(lineSize(line))
        "4" -> println(digitCount(line))
        "5" -> println(low5(line))
        "6" -> println(high5(line))
        "7" -> kirillIsExit(line)
    }
}
/// Exc 3
/*
fun dateCorrect(): Boolean {
    val line = readLine()
    val date = line!!.split(" ")
    val months = listOf("января","февраля","марта","апреля","мая","июня","июля","августа","сентября","октября","ноября","декабря")
    return date[0] in 0..31 && date[2] in 0..10000
}*/
/// Exc 4.4
fun low5(line:String?): Int {
    val charList = line!!.toCharArray()
    var n = 0
    charList.forEach { if (it.toInt() in 48..52) n += 1 }
    return n
}
/// Exc 4.15
fun high5(line:String?): Int {
    val charList = line!!.toCharArray()
    var n = 0
    charList.forEach { if (it.toInt() in 53..57) n += 1 }
    return n
}
/// Exc 4.11
fun kirillIsExit(line:String?){
    val charList = line!!.toCharArray()
    kirillCheck(charList,65)
}
fun kirillCheck(chList:CharArray,n:Int) {
    if (n <= 122)
        if (n.toChar() !in chList) {
            print(" ${n.toChar()}")
            kirillCheck(chList, n + 1)
        } else kirillCheck(chList, n + 1)
}