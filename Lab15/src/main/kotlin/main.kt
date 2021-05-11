import java.io.File
import java.util.*

fun main(args: Array<String>) {
    //arrayPrinter(arrayint)
    //println("Func sum ${arrayOp(arrayint,::shortNumArrSum,0)}")
    //println("Func mult ${arrayOp(arrayint,::shortNumArrMult,0)}")
    //println("Func min ${arrayOp(arrayint,::shortNumArrMin,0)}")
    //println("Func max ${arrayOp(arrayint,::shortNumArrMax,0)}")

    //println("Exc 4.9 ${arrayPrinter(getBeforeLastMin(arrayint))}")
    println("Exc 4.10 = ${countOfExact(arrayint,arrayint2,0)}")
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