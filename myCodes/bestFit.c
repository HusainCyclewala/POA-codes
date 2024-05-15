#include <stdio.h>
int main()
{
    /* VARIABLES.
    no.of.processes int
    no.of.memoryblocks int
    size of processes arr[]
    size of memory blocks arr[]
    memory location arr[]
    visited arr[]
    minimum difference int
    */
    int n_proc = 4, n_mem = 6, mem_loc[100], visited[100] ;
    int mem_sizes[] = {200, 400, 600, 500, 300, 250};
    int process_sizes[] = {357, 210, 468, 491};
    for (int i = 0; i < n_mem; i++)
    {
        visited[i] = 0;
        mem_loc[i] = -1;
    }

    //best fit algo
    for (int i = 0; i < n_proc; i++)
    {
        int min_diff = 9999;
        for (int j = 0; j < n_mem; j++)
        {
            if (mem_sizes[j] - process_sizes[i] < min_diff && mem_sizes[j] - process_sizes[i] >= 0 && visited[j] == 0)
            {
                min_diff = mem_sizes[j] - process_sizes[i];
                mem_loc[i] = j;                                //NO BREAK STATEMENT HERE.
            }
        }
        visited[mem_loc[i]] = 1;        // do visited after all iterations to find the minimum.
    }
    //output
    for (int i = 0; i < n_proc; i++)
    {
        if (mem_loc[i] != -1)
            printf("Process size = %d goes in location %d and hole is %d\n", process_sizes[i], mem_sizes[mem_loc[i]], mem_sizes[mem_loc[i]] - process_sizes[i]);
        else
            printf("%d not allocated to memory", process_sizes[i]);
    }
}