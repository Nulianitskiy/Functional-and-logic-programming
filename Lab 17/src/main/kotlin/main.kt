fun main(args: Array<String>) {
    val doc1 = Docs(0,0,"Name","Surname","MiddleName","Male","00-00-0000","City")
    val doc2 = Docs(1,1,"NoName","NoSurname","NoSurname","Male","01-01-0001","noCity")
    val doc3 = Docs(2,1,"X","","Z","Male","00-00-0001","Geometry")
    printDoc(doc1)
    printDoc(doc2)
    printDoc(doc3)
    saveDoc(doc3)
}
/// Exc 1
class Docs(val series: Int, val number: Int, var firstName: String, var lastName:String, var middleName: String, var gender:String, val dateBirth: String, val cityOfBirth: String)

/// Exc 2
fun printDoc(docs: Docs){
    println("Серия ${docs.series} Номер ${docs.number}\nФ.И.О. : ${docs.lastName} ${docs.firstName} ${docs.middleName}" +
            "\nДата рождения : ${docs.dateBirth}\nГород рождения : ${docs.cityOfBirth}\nПол : ${docs.gender}\n\n")
}

/// Exc 3
fun checkDocs(doc1:Docs,doc2:Docs){
    if(doc1.series == doc2.series || doc1.number == doc2.number)
        println("Проблема! Цифры совпадают!\n")
    else println("Все ок!\n")
}

/// Exc 4
fun Docs.validateBeforeSave(){
    fun validate(value:String,fieldName:String){
        if(value.isEmpty()){
            throw IllegalArgumentException("Can`t save doc $series $number: empty $fieldName")
        }
    }
    validate(firstName, "First Name")
    validate(lastName, "Last Name")
}
fun saveDoc(doc:Docs){
    doc.validateBeforeSave()
}