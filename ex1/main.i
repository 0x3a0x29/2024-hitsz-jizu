# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"

# 1 "func.h" 1
int find_substr(char* str, char* pattern, int len1, int len2)
{
    int pos = -1;
    for (int i = 0; i < len1; i++)
    {
        for (int j = 0; j < len2; j++)
            if (str[i + j] != pattern[j])
                break;
            else if (j == len2 - 1)
            {
                pos = i;
                break;
            }
        if (pos != -1) break;
    }

    return pos;
}
# 3 "main.c" 2




int main()
{
    int pos = find_substr("1qab9a0bcabcds13", "bcds", 16, 4);


    return pos;
}
