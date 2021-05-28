import java.io.File
import java.util.Objects.equals

fun main(args: Array<String>){
    //choserOfMyHeart()
    //println(dateCorrect())
    val fileList = getListByFileLineByLineUsingForEachLine("C:\\Users\\User\\Desktop\\Resources\\2 Course\\Funkcionalnoe_i_logicheskoe_prevozmoganie\\Lab16\\In.txt")
    println(sortListByNumbAfter(fileList))
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
    val list = mutableListOf<Char>()
    var n = 0
    val charList = line!!.toCharArray()
    charList.forEach {
        if (it !in list) {
            n++
            list.add(it)
        }
    }
    return n
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

fun dateCorrect(): Boolean {
    val line = readLine()
    val date = line!!.split(" ")
    val months = listOf("января","февраля","марта","апреля","мая","июня","июля","августа","сентября","октября","ноября","декабря")
    return date[0].toInt() in 0..31 && date[1] in months && date[2].toInt() in 0..10000
}
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
        if (n.toChar() !in chList && n.toInt() !in 91..96) {
            print(" ${n.toChar()}")
            kirillCheck(chList, n + 1)
        } else kirillCheck(chList, n + 1)
}
/// Exc 5
fun getListByFileLineByLineUsingForEachLine(fileName: String): MutableList<String>{
    val list = mutableListOf<String>()
    File(fileName).forEachLine { list.add(it) }
    return list
}

fun sortList(list: MutableList<String>): List<String> = list.sortedBy { it.length }
/// Exc 6
fun sortListByWords(list: MutableList<String>) = list.sortedBy { it.count(::checkSpace) }
fun checkSpace(ch:Char) = ch.toInt() == 32
/// Exc 7
fun sortListByNumbAfter(list:MutableList<String>) = list.sort()
fun sorterForCheckNumb(line:String?): Int {
    val charList = line!!.toCharArray()
    var n = 0
    var cur = 2
    if (cur < charList.size)
        if (charListRunner(charList, cur)) {
            n += 1
            cur += 1
        } else cur += 1
    return n
}
fun charListRunner(charList:CharArray,cur:Int): Boolean =
    charList[cur-2].toInt() in 48..57 && charList[cur-1].toInt() == 32 && (charList[cur].toInt() in 65..90 || charList[cur].toInt() in 97..122)
