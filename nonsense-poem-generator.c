#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

/* Nonsense Poem Generator - C Edition */

/* Word banks */
const char *adjectives[] = {
    "purple", "bouncy", "invisible", "squeaky", "jellied", "grumpy",
    "wobbly", "sparkly", "fuzzy", "peculiar", "luminous", "dizzy"
};
const int adjectives_count = 12;

const char *nouns[] = {
    "penguin", "toaster", "umbrella", "banana", "telescope", "accordion",
    "spatula", "moonbeam", "pickle", "flamingo", "waffle", "bicycle"
};
const int nouns_count = 12;

const char *verbs[] = {
    "dances", "wiggles", "somersaults", "yodels", "hiccups", "juggles",
    "sneezes", "bounces", "twirls", "prances", "waddles", "zigzags"
};
const int verbs_count = 12;

const char *adverbs[] = {
    "backwards", "sideways", "slowly", "frantically", "mysteriously", "gleefully",
    "awkwardly", "gracefully", "clumsily", "eagerly"
};
const int adverbs_count = 10;

const char *prepositions[] = {
    "under", "over", "through", "around", "beneath", "beside",
    "above", "below", "between", "among"
};
const int prepositions_count = 10;

const char *places[] = {
    "the garden", "a cloud", "the meadow", "the ocean", "a rainbow",
    "the attic", "a dream", "the forest", "the stars", "a puddle"
};
const int places_count = 10;

/* Helper function to pick random element */
const char* pick_string(const char *array[], int count) {
    return array[rand() % count];
}

/* Capitalize first letter */
void capitalize(char *str) {
    if (str[0] >= 'a' && str[0] <= 'z') {
        str[0] = str[0] - 32;
    }
}

/* Poem generation templates */
void generate_template1() {
    const char *adj1 = pick_string(adjectives, adjectives_count);
    const char *noun1 = pick_string(nouns, nouns_count);
    const char *verb1 = pick_string(verbs, verbs_count);
    const char *adv1 = pick_string(adverbs, adverbs_count);
    const char *adj2 = pick_string(adjectives, adjectives_count);
    const char *noun2 = pick_string(nouns, nouns_count);
    const char *prep1 = pick_string(prepositions, prepositions_count);
    const char *place1 = pick_string(places, places_count);
    
    printf("The %s %s %s %s,\n", adj1, noun1, verb1, adv1);
    printf("While %s %ss rest %s %s.\n", adj2, noun2, prep1, place1);
    printf("With %s delight and %s glee,\n", 
           pick_string(adjectives, adjectives_count),
           pick_string(adjectives, adjectives_count));
    printf("They %s together wild and free!\n", pick_string(verbs, verbs_count));
}

void generate_template2() {
    const char *noun1 = pick_string(nouns, nouns_count);
    const char *noun2 = pick_string(nouns, nouns_count);
    const char *noun3 = pick_string(nouns, nouns_count);
    const char *adj1 = pick_string(adjectives, adjectives_count);
    char adj_cap[50];
    strcpy(adj_cap, adj1);
    capitalize(adj_cap);
    
    printf("Once a %s %s met a %s %s,\n",
           pick_string(adjectives, adjectives_count), noun1,
           pick_string(adjectives, adjectives_count), noun2);
    printf("They %s %s %s %s.\n",
           pick_string(verbs, verbs_count),
           pick_string(adverbs, adverbs_count),
           pick_string(prepositions, prepositions_count),
           pick_string(places, places_count));
    printf("\"%s %s!\" the %s cried,\n", adj_cap, pick_string(nouns, nouns_count), noun1);
    printf("As a %s %s %s by its side.\n",
           pick_string(adjectives, adjectives_count), noun3,
           pick_string(verbs, verbs_count));
}

void generate_template3() {
    const char *verb = pick_string(verbs, verbs_count);
    const char *noun = pick_string(nouns, nouns_count);
    const char *adj = pick_string(adjectives, adjectives_count);
    const char *adv = pick_string(adverbs, adverbs_count);
    
    printf("The %s %s,\n", noun, verb);
    printf("%s it %s,\n", adv, verb);
    printf("%s and %s it %s,\n", adj, pick_string(adjectives, adjectives_count), verb);
    printf("Oh, how that %s %s!\n", noun, verb);
}

void generate_template4() {
    printf("I saw:\n");
    printf("A %s %s that %s %s,\n",
           pick_string(adjectives, adjectives_count),
           pick_string(nouns, nouns_count),
           pick_string(verbs, verbs_count),
           pick_string(adverbs, adverbs_count));
    printf("A %s %s %s %s,\n",
           pick_string(adjectives, adjectives_count),
           pick_string(nouns, nouns_count),
           pick_string(prepositions, prepositions_count),
           pick_string(places, places_count));
    printf("And a %s %s doing %s things,\n",
           pick_string(adjectives, adjectives_count),
           pick_string(nouns, nouns_count),
           pick_string(adjectives, adjectives_count));
    printf("All while the %s %s %s!\n",
           pick_string(adjectives, adjectives_count),
           pick_string(nouns, nouns_count),
           pick_string(verbs, verbs_count));
}

void generate_poem() {
    int template = rand() % 4;
    switch(template) {
        case 0: generate_template1(); break;
        case 1: generate_template2(); break;
        case 2: generate_template3(); break;
        case 3: generate_template4(); break;
    }
}

void generate_poems(int count) {
    printf("============================================================\n");
    printf("  🎭 NONSENSE POEM GENERATOR (C Edition) 🎭\n");
    printf("============================================================\n\n");
    
    for (int i = 1; i <= count; i++) {
        printf("Poem #%d:\n", i);
        printf("------------------------------------------------------------\n");
        generate_poem();
        printf("\n");
        if (i < count) {
            printf("\n");
        }
    }
    
    printf("============================================================\n");
}

int main(int argc, char *argv[]) {
    srand(time(NULL));
    
    int count = 3;
    if (argc > 1) {
        count = atoi(argv[1]);
        if (count < 1) {
            fprintf(stderr, "Usage: %s [number_of_poems]\n", argv[0]);
            fprintf(stderr, "Example: %s 5\n", argv[0]);
            return 1;
        }
    }
    
    generate_poems(count);
    return 0;
}
