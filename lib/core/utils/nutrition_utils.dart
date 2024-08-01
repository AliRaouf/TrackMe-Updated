class NutritionUtils {
  static String remainingString(int number, int targetnumber) {
    if (targetnumber == 0) {
      return "Add your Target Now!";
    } else if (number == 0) {
      return "$targetnumber Remaining";
    } else if (targetnumber - number <= 0) {
      return "Congrats You Finished it!";
    } else {
      return "${targetnumber - number} Remaining";
    }
  }

  static double remainingPercentage(int number, int targetnumber) {
    if ((number / targetnumber).isFinite) {
      if (number / targetnumber > 1) {
        return 1;
      } else {
        return (number / targetnumber);
      }
    } else {
      return 0;
    }
  }
}
