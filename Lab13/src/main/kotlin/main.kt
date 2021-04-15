fun main(args: Array<String>) {
    var language = readLine();
    when(language){
        "Prolog", "Kotlin" -> println("Ты подлиза! Фу!")
        "C#" -> println("Мое вам почтение!")
        "C++" -> println("Ну, с кем не бывает...")
        "Python" -> println("Кшш Кш Кшшшш!")
        else -> println("Прости, братик, моему создателю было лень, и он не придумал, что ответить на это")
    }
}