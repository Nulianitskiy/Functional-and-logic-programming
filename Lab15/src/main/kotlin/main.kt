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
    // println("Exc 4.34 = ${arrayPrinter(elInDistance(arrayint,readLine()!!.toInt(),readLine()!!.toInt(),0))}")
    //println("Exc 4.40 = ${findMinEven(arrayint)}")
    //println("Exc 4.46 = ")
    //plusMinusStandUp(arrayint)
    println("Exc 4.58 = ${sum2is3(arrayint,arrayint,0)}")
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

var arrayint = IntArray(readLine()!!.toInt()) { readLine()!!.toInt() }

fun remove(arr: IntArray, index: Int): IntArray {
    if (index < 0 || index >= arr.size) {
        return arr
    }

    val result = arr.toMutableList()
    result.removeAt(index)
    return result.toIntArray()
}

fun arrayOp(arr:IntArray,func:(arr:IntArray)->Int,x:Int): Int = func(arr)

fun arrayPrint() {
    arrayPrinter(arrayint)
}
/// Exc 3

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