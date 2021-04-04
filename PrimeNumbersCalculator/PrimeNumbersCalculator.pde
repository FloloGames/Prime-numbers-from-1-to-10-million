int start = 1;
int end = 10;

float progress = 0;

void setup() {
  rectMode(CORNERS);
  size(800, 800);
  fill(255);
  stroke(255);
  thread("getPrimes");
}
void draw() {
  background(0);
  rect(0, height/4, progress, height/1.5);
}
void getPrimes() {
  ArrayList<Integer> primes = getPrimes(start, end);
  String[] toSave = new String[1];
  toSave[0] = "";
  for (int i = 0; i < primes.size(); i++) {
    int c = primes.get(i);
    toSave[0] += str(c) + ", ";
    progress = map(i, 0, primes.size(), 0, width);
  }
  progress = width;
  String saveName = "Primes_between__" + str(start) + "_" + str(end) + ".txt";
  saveStrings(saveName, toSave);
  fill(0, 255, 0);
}
ArrayList<Integer> getPrimes(int s, int e) {
  ArrayList<Integer> primes = new ArrayList<Integer>();

  for (int n = s; n < e; n++) {
    boolean isPrime = true;

    int i = 2;

    while (i <= n/2) {
      if (n % i == 0) {
        isPrime = false;
        break;
      }
      i++;
    }
    if (isPrime) {
      primes.add(n);
    }
    progress = map(n, s, e, 0, width);
  }
  progress = width;
  return primes;
}
