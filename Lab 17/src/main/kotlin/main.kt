fun main(args: Array<String>) {
    printDoc(Docs(0,0,"Name","Surname","MiddleName","Male","00-00-0000","City"))
}
class Docs(val series: Int, val number: Int, var firstName: String, var lastName:String, var middleName: String, var gender:String, val dateBirth: String, val cityOfBirth: String)

fun printDoc(docs: Docs){
    println("Серия ${docs.series} Номер ${docs.number}\nФ.И.О. : ${docs.lastName} ${docs.firstName} ${docs.middleName}" +
            "\nДата рождения : ${docs.dateBirth}\nГород рождения : ${docs.cityOfBirth}\nПол : ${docs.gender}")
}
