#include <stdio.h>

#define HIGH 8
typedef int numbers[HIGH];
numbers a;

int main() {
    readarray();
    quicksort(a, 0, HIGH-1);
    writearray();
}

// read values from command line into array 'a'
void readarray() {
    int i;
    for(i = 0; i < HIGH; i++) {    // scan each value from user input
        scanf("%d", &a[i]);
    }
}

// write sorted array 'a' to command line
void writearray() {
    int i;
    for(i = 1; i <= HIGH; i++) {    // iterate through 'a'
        printf("%d ", a[i-1]);
    }
    printf("\n");   // new line
}

// quicksort function
void quicksort(numbers a, int m, int n) {
    int i;

    if(n > m) {
        i = partition(a, m, n);
        quicksort(a, m, i);
        quicksort(a, i+1, n);
    }
}

// partition array 'a'
int partition(numbers a, int y, int z) {
    int i, j, x;
    
    x = a[y];
    i = y - 1;
    j = z + 1;

    while(i < j) {
        do {
            j--;
        } while (a[j] > x);

        do {
            i++;
        } while (a[i] < x);

        if(i < j) {
            exchange(&a[i], &a[j]);
        }
    }

    return j;
}

// swap two values in array 'a'
void exchange(int *a, int *b) {
    int t;
    t = *a;
    *a = *b;
    *b = t;
}