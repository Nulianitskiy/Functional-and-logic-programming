import java.io.File
import java.util.*

fun main(args: Array<String>) {
    //arrayPrinter(arrayint)
    //println("Func sum ${arrayOp(arrayint,::shortNumArrSum,0)}")
    //println("Func mult ${arrayOp(arrayint,::shortNumArrMult,0)}")
    //println("Func min ${arrayOp(arrayint,::shortNumArrMin,0)}")
    //println("Func max ${arrayOp(arrayint,::shortNumArrMax,0)}")

    //println("Exc 4.9 ${arrayPrinter(getBeforeLastMin(arrayint))}")
    //println("Exc 4.10 = ${countOfExact(arrayint,arrayint2,0)}")
    //println("Exc 4.22 = ${countOfMinInInterval(arrayint,readLine()!!.toInt(),readLine()!!.toInt(),0)}")
    //println("Exc 4.24 = ${arrayPrinter(find2Max(arrayint))}")
    //println("Exc 4.31 = ${countOfEvenInArr(arrayint,0)}")
    //println("Exc 4.34 = ${arrayPrinter(elInDistance(arrayint,readLine()!!.toInt(),readLine()!!.toInt(),0))}")
    //println("Exc 4.40 = ${findMinEven(arrayint)}")
    //println("Exc 4.46 = ")
    //plusMinusStandUp(arrayint)
    //println("Exc 4.58 = ${sum2is3(arrayint,arrayint,0)}")

    val list = createList()
    //println("Exc 5 = ${listOp(list,::numListSum,0)}")
    //println("Exc 8.9 = ${getBeforeLastMin(list)}")
    val list2 = createList()
    println("Exc 8.10 = ${countOfExact(list,list2,0)}")
}
fun myPow(x:Int,cx:Int,y:Int):Int = if(y!=0) myPow(x,cx*x,y-1) else cx
fun myPow(x:Int,y:Int) =  myPow(x,1,y)

///Preparation to Exc 1
fun numArrSum(arr:IntArray,sum:Int): Int =
    if(arr.isNotEmpty())
        numArrSum(remove(arr,0),sum+arr[0])
    else sum
fun shortNumArrSum(arr:IntArray) = numArrSum(arr,0)

fun numArrMult(arr:IntArray,mult:Int): Int =
    if(arr.isNotEmpty())
        numArrMult(remove(arr,0),mult*arr[0])
    else mult
fun shortNumArrMult(arr:IntArray) = numArrMult(arr,1)

fun numArrMin(arr:IntArray,min:Int): Int =
    if(arr.isNotEmpty())
        if(min > arr[0]) numArrMin(remove(arr,0),arr[0])
        else numArrMin(remove(arr,0),min)
    else min
fun shortNumArrMin(arr:IntArray) = numArrMin(arr,arr[0])

fun numArrMax(arr:IntArray,max:Int): Int =
    if(arr.isNotEmpty())
        if(max < arr[0]) numArrMax(remove(arr,0),arr[0])
        else numArrMax(remove(arr,0),max)
    else max
fun shortNumArrMax(arr:IntArray) = numArrMax(arr,arr[0])

///Exc 1-2
fun arrayPrinter(arr:IntArray){
    if(arr.isNotEmpty())
    {
    print(" ${arr[0]}")
    arrayPrinter(remove(arr,0))
    }
    else println()
}

//var arrayint = IntArray(readLine()!!.toInt()) { readLine()!!.toInt() }

fun remove(arr: IntArray, index: Int): IntArray {
    if (index < 0 || index >= arr.size) {
        return arr
    }

    val result = arr.toMutableList()
    result.removeAt(index)
    return result.toIntArray()
}

fun arrayOp(arr:IntArray,func:(arr:IntArray)->Int,x:Int): Int = func(arr)

//fun arrayPrint() {
//    arrayPrinter(arrayint)
//}
/// Exc 3
/*
val array = inputArray()


fun inputArray(): Array<Int> {
    return try {
        selectArrayInputMethod()()//там тип взависимости от того что ввёл меняется функция
    }
    catch(e: Exception) {
        when(e) {
            is NullPointerException, is java.io.FileNotFoundException -> {
                println("\nError: ${e.message}! I'm sorry, select console :(\n")
                inputArray()
            }
            is NumberFormatException -> {
                println("\nError: ${e.message}! Check the file.\n")
                inputArray()
            }
            else -> throw e
        }
    }
}

fun selectArrayInputMethod(): () -> Array<Int> {
    println("How do you want to input array?")
    println("1. Console")
    println("2. Standard file\n")
    print(">: ")

    return when(readLine()) {
        "1" -> {
            println()
            ::inputArrayByConsole
        }
        "2" -> ::inputArrayByFileV2
        else -> {
            println("Invalid method. Try again!\n")
            selectArrayInputMethod()
        }
    }
}

fun inputListByFileV2(): List<Int> =
    try {
        File("ExampleOfList.txt").readText().split(" ").map { it.toInt() }
    }
    catch(e: NullPointerException) { throw e }
    catch(e: java.io.FileNotFoundException) { throw e }
    catch(e: NumberFormatException) { throw e }

fun inputArrayByConsole(): Array<Int> {
    print("Input array (in one line, separated by space)\n>: ")

    return try {
        readLine()!!.split(" ").map { it.toInt() }.toTypedArray()
    }
    catch(e: NumberFormatException) {
        println()
        inputArrayByConsole()
    }
}*/
/// Exc 4.9
fun checkOrDie(arr:IntArray,x:Int): IntArray =
    if(arr[0] != x)
        checkOrDie(remove(arr,0),x)
    else remove(arr,0).reversedArray()


fun getBeforeLastMin(arr:IntArray) = checkOrDie(arr.reversedArray(),shortNumArrMin(arr))

/// Exc 4.10
var arrayint2 = IntArray(readLine()!!.toInt()) { readLine()!!.toInt() }

fun checkOnExact(x:Int,arr: IntArray): Boolean =
    if(arr.isNotEmpty())
        if(x == arr[0]) true
        else checkOnExact(x,remove(arr,0))
    else false

fun countOfExact(arr1:IntArray,arr2:IntArray,count:Int):Int =
    if(arr1.isNotEmpty())
        if(checkOnExact(arr1[0],arr2)) countOfExact(remove(arr1,0),arr2,count+1)
        else countOfExact(remove(arr1,0),arr2,count)
    else count

/// Exc 4.22
fun makeInterval(arr: IntArray,a: Int,b: Int):IntArray =
    if(arr.size>b+1) makeInterval(remove(arr,b),a,b)
    else
        if(a>0) makeInterval(remove(arr,0),a-1,b)
        else arr

fun countOfNum(arr: IntArray,num:Int,count: Int):Int =
    if(arr.isNotEmpty())
        if(arr[0]==num) countOfNum(remove(arr,0),num,count+1)
        else countOfNum(remove(arr,0),num,count+1)
    else count

fun countOfMinInInterval(arr: IntArray,a:Int,b:Int,count:Int): Int = countOfNum(makeInterval(arr,a,b),shortNumArrMin(arr),count)

/// Exc 4.24
fun find2Max(arr: IntArray): IntArray = intArrayOf(shortNumArrMax(arr),shortNumArrMax(remove(arr,arr.indexOf(shortNumArrMax(arr)))))

/// Exc 4.31
fun countOfEvenInArr(arr: IntArray,count:Int):Int =
    if(arr.isNotEmpty())
        if(arr[0] % 2 == 0) countOfEvenInArr(remove(arr,0),count+1)
        else countOfEvenInArr(remove(arr,0),count)
    else count

/// Exc 4.34
fun elInDistance(arr: IntArray,a: Int,b: Int,index: Int): IntArray =
    if(index >= arr.size) arr
    else
        if(arr[index] in a..b) elInDistance(arr,a,b,index+1)
        else elInDistance(remove(arr,index),a,b,0)

/// Exc 4.40
fun findMinEven(arr: IntArray): Int =
    if(arr.isEmpty()) -1
    else
        if(shortNumArrMin(arr)%2 == 0) shortNumArrMin(arr)
        else findMinEven(remove(arr,arr.indexOf(shortNumArrMin(arr))))

/// Exc 4.46
fun plusMinusStandUp(arr:IntArray){
    arr.forEach { if(it >= 0) print(" $it") }
    arr.forEach { if (it < 0) print(" $it") }
}

/// Exc 4.58
fun sum2is3(arrOr: IntArray,arrCur: IntArray,count: Int): Int =
    if (arrCur.isNotEmpty()) {
        var n = 0
        arrCur.forEach { if (checkOnExact(arrCur[0] + it, arrOr)) n++ }
        sum2is3(arrOr,remove(arrCur,0),count+n)
    }
    else count

/// Exc 5
fun numListSum(list:MutableList<Int>,sum:Int): Int =
    if(list.isNotEmpty()){
        val l = list[0]
        list.removeAt(0)
        numListSum(list,sum+l)
    }
    else sum
fun numListSum(list:MutableList<Int>) = numListSum(list,0)

fun numListMult(list:MutableList<Int>,mult:Int): Int =
    if(list.isNotEmpty()) {
        val l = list[0]
        list.removeAt(0)
        numListMult(list,mult * l)
    }
    else mult
fun numListMult(list:MutableList<Int>) = numListMult(list,1)

fun numListMin(list:MutableList<Int>,min:Int): Int =
    if(list.isNotEmpty())
        if(min > list[0]) {
            val l = list[0]
            list.removeAt(0)
            numListMin(list, l)
        }
        else {
            list.removeAt(0)
            numListMin(list,min)
        }
    else min
fun numListMin(list:MutableList<Int>) = numListMin(list,list[0])

fun numListMax(list:MutableList<Int>,max:Int): Int =
    if(list.isNotEmpty())
        if(max < list[0]) {
            val l = list[0]
            list.removeAt(0)
            numListMin(list, l)
        }
        else {
            list.removeAt(0)
            numListMin(list,max)
        }
    else max
fun numListMax(list:MutableList<Int>) = numListMin(list,list[0])

fun listOp(list:MutableList<Int>,func:(list:MutableList<Int>)->Int,x:Int): Int = func(list)

fun listPrinter(list:MutableList<Int>){
    if(list.isNotEmpty())
    {
        print(" ${list[0]}")
        list.removeAt(0)
        listPrinter(list)
    }
    else println()
}
fun createHelpList(list:MutableList<Int>,n:Int): MutableList<Int> =
    if(n!=0) {
        list.add(readLine()!!.toInt())
        createHelpList(list,n-1)
    }
    else list

fun createList(): MutableList<Int> {
    println("Введите размер списка: ")
    val n = readLine()!!.toInt()
    println("Вводите элементы списка: ")
    val list = mutableListOf<Int>()
    createHelpList(list,n)
    return list
}

/// Exc 6

/// Exc 7

/// Exc 8
//8.9
fun listCheckOrDie(list:MutableList<Int>,x:Int): MutableList<Int> {
    val n = list.size - 1
    if (list[n] != x) {
        list.removeAt(n)
        getBeforeLastMin(list)
    }
    else
        list.removeAt(n)
    return list
}

fun getBeforeLastMin(list:MutableList<Int>):MutableList<Int> {
    val listCopy = list.toMutableList()
    val min = numListMin(listCopy)
    listCheckOrDie(list,min)
    return list
}
//8.10
fun checkOnExact(x:Int,list:MutableList<Int>): Boolean =
    if(list.isNotEmpty())
        if(x == list[0]) true
        else{
            list.removeAt(0)
            checkOnExact(x,list)
        }
    else false

fun countOfExact(list1:MutableList<Int>,list2:MutableList<Int>,count:Int):Int =
    if(list1.isNotEmpty()) {
        val list2Copy = list2.toMutableList()
        if (checkOnExact(list1[0], list2Copy)) {
            list1.removeAt(0)
            countOfExact(list1, list2, count + 1)
        }
        else {
            list1.removeAt(0)
            countOfExact(list1, list2, count)
        }
    }
    else count
// 8.22