fun main(args: Array<String>){
    println(findMaxInString(line))
}
val line = readLine()

fun findMaxInString(line:String?): String{
    val list = line!!.split(" ")
    var max = list[0].toInt()
    list.forEach{if(it.toInt()>max) max = it.toInt()}
    return max.toString()
}