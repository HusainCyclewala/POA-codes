#include <stdio.h>


void main()
{
    //n_proc= no. of processes, n_mem= no. of memory blocks
    /* VARIABLES.
    no.of.processes int
    no.of.memoryblocks int
    size of processes arr[]
    size of memory blocks arr[]
    memory location arr[]
    visited arr[]
    last int
    */

    int temp, n_proc = 4, n_mem = 6, mem_loc[100], visited[100], last = 0;
    int mem_sizes[] = {200, 400, 600, 500, 300, 250};
    int process_sizes[] = {357, 210, 568, 491};
    for (int i = 0; i < n_mem; i++)
    {
        visited[i] = 0;
        mem_loc[i] = -1;
    }

    //next fit algo
    for (int i = 0; i < n_proc; i++)
    {
        for (int j = last; j < n_mem; j++)    //NEW
        {
            if (process_sizes[i] <= mem_sizes[j] && visited[j] == 0)
            {
                mem_loc[i] = j;
                visited[j] = 1;
                last = j;       //NEW
                break;          // REMEMBER TO PUT BREAK
            }
        }
    }
    //output
    printf("\n\n");
    for (int i = 0; i < n_proc; i++)
    {
        if (mem_loc[i] != -1)
            printf("Process size = %d goes in location %d and hole is %d\n", process_sizes[i], mem_sizes[mem_loc[i]], mem_sizes[mem_loc[i]] - process_sizes[i]);
        else
            printf("%d not allocated to memory\n", process_sizes[i]);
    }
}