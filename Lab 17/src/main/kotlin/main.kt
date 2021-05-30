import abstracts.Passport
import abstracts.Document

fun main(args: Array<String>) {
    val doc1 = Document("0","0","Name","Surname","MiddleName","Male","00-00-0000","City")
    val doc2 = Document("1","1","NoName","NoSurname","NoSurname","Male","01-01-0001","noCity")
    val doc3 = Document("2","1","X","Y","Z","Male","00-00-0001","Geometry")
    printDoc(doc1)
    printDoc(doc2)
    printDoc(doc3)
    //val 10M = create10Million()

}
/// Exc 1
open class Document(val series: String, val number: String, var firstName: String, var lastName:String, var middleName: String, var gender:String, val dateBirth: String, val cityOfBirth: String)

/// Exc 2
fun printDoc(docs: Passport){
    println("Серия ${docs.series} Номер ${docs.number}\nФ.И.О. : ${docs.lastName} ${docs.firstName} ${docs.middleName}" +
            "\nДата рождения : ${docs.dateBirth}\nГород рождения : ${docs.cityOfBirth}\nПол : ${docs.gender}\n\n")
}

/// Exc 3
fun checkDocs(doc1:Passport,doc2:Passport){
    if(doc1.series == doc2.series || doc1.number == doc2.number)
        println("Проблема! Цифры совпадают!\n")
    else println("Все ок!\n")
}

/// Exc 4
fun Passport.validateBeforeSave(){
    fun validate(value:String,fieldName:String){
        if(value.isEmpty()){
            throw IllegalArgumentException("Can`t save doc $series $number: empty $fieldName")
        }
    }
    validate(firstName, "First Name")
    validate(lastName, "Last Name")
}
fun saveDoc(doc:Passport){
    doc.validateBeforeSave()
}

/// Exc 5
fun create10Million(): Array<Passport>{
    val myDocs = Array(10000000) { randDoc() }
    //myDocs.forEach{printDoc(it)}
    return myDocs
}

fun randDoc(): Passport{
    return Document("0","0","","","","","","")
}
fun getRandomString(length: Int) : String {
    val allowedChars = ('A'..'Z') + ('a'..'z') + ('0'..'9')
    return (1..length)
        .map { allowedChars.random() }
        .joinToString("")
}