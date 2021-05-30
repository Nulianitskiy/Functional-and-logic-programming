package abstracts

abstract class Passport(
    val series: String,
    val number: String,
    val firstName: String,
    val lastName: String,
    val middleName: String,
    val gender: String,
    val dateBirth: String,
    val cityOfBirth: String
){
    val startTime = System.currentTimeMillis()
    abstract fun searchDoc(doc: Passport)
    val totalTime = System.currentTimeMillis()
}
class Document(series: String, number: String, firstName: String, lastName: String, middleName: String, gender: String, dateBirth: String, cityOfBirth: String) :
    Passport(series, number, firstName,  lastName,  middleName,  gender,  dateBirth, cityOfBirth) {

    override fun searchDoc(doc: Passport) {
        val manul =
            Document("2", "1", "X", "Y", "Z", "Male", "00-00-0001", "Geometry")
        println("Время: ${(totalTime - startTime)}")
    }
}