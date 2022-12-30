class Score{
  late double percent;
  late String scoreTag;
  late String scoreDescription;
  late List<CourseDegreePLO> plo;
  late List<String> coursesNames = <String>[];

  Score({required this.scoreTag,required this.plo,required this.scoreDescription}){
    CalculateScore();
  }

  //calculate the final
  //score of the instance
  //using all the PLOs.
  CalculateScore(){

    int length = plo.length;
    double total = 0;

    for(var i = 0; i< length; i++) {
      total = total + ((plo[i].courseDgree / 100) * plo[i].PLOPercent);
      coursesNames.add(plo[i].courseName);
    }

    //remove duplication
    coursesNames = coursesNames.toSet().toList();

    this.percent = total;
  }
}

class CourseDegreePLO{
  late double courseDgree;
  late String courseName;
  late double PLOPercent;
  CourseDegreePLO({required this.courseDgree,required this.courseName, required this.PLOPercent});
}