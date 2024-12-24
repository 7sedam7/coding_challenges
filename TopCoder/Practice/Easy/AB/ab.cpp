/*
 * https://arena.topcoder.com/#/u/practiceCode/16319/46378/13642/1/325040
 * You are given two integers: N and K. Lun the dog is interested in strings that satisfy the following conditions:
 *   - The string has exactly N characters, each of which is either A or B.
 *   - The string s has exactly K pairs (i, j) (0 <= i < j <= N-1) such that s[i] = A and s[j] = B.
 * 
 * If there exists a string that satisfies the conditions, find and return any such string. Otherwise, return an empty string.
*/

#include <iostream>

using namespace std;

class AB
{
  public:
    string createString(int N, int K)
    {
      int aCount = findNumberOfAs(N, K);
      if (aCount == -1) 
      {
        return "";
      }
      int k = aCount * (N-aCount);
      int lastAPosition = -1;
      if (k > K)
      {
        lastAPosition = (aCount - 1) + (k - K);
        aCount--;
      }
      
      char *chars = (char *)malloc((N+1) * sizeof(char));
      chars[N] = '\0';
      for (int i = 0; i < N; ++i)
      {
        chars[i] = 'B';
        if (i < aCount || i == lastAPosition)
        {
          chars[i] = 'A';
        }
      }

      return chars;
    }

  private:
    int findNumberOfAs(int N, int K)
    {
      int M = N / 2;
      for (int i = 1; i <= M; i++)
      {
        if (i * (N-i) >= K)
        {
          return i;
        }
      }
      return -1;
    }

};

int main(void)
{
	int N = 50, K = 412;
	AB ab;
  for (int i = 2; i < N; i++)
  {
    for (int j = 0; j < i*(i-1)/2; j++)
    {
      cout << i << "," << j << "," << ab.createString(i, j) << endl;
    }
  }
}
