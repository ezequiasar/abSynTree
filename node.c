#include <stdlib.h>
#include <string.h>
#include <stdio.h>


struct node{
    char* value;
    struct node *left;
    struct node *right;
};

struct symbols{
    char symbol[8];
    struct symbols *next;
};

void create(char* val, struct node *right, struct node *left){
    struct node *new;
    new = malloc(sizeof (struct node));
    new->value = (char *) malloc(sizeof(char)*16);
    strcpy(new->value, val);
    new-> left = left;
    new-> right = right;
    printf("%s\n", new->value);
}

/**void imprimirPre(struct node *reco)
{
    if (reco != NULL)
    {
        printf("%i-",reco->info);
        imprimirPre(reco->izq);
        imprimirPre(reco->der);
    }
}**/
 int main(int argc, char const *argv[]) {
    create("hola", NULL, NULL);
    return 0;
}
