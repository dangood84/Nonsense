#include <iostream>
#include <string>
#include <vector>
#include <random>
#include <functional>
#include <algorithm>

// Nonsense Poem Generator - C++ Edition

class PoemGenerator {
private:
    std::vector<std::string> adjectives = {
        "purple", "bouncy", "invisible", "squeaky", "jellied", "grumpy",
        "wobbly", "sparkly", "fuzzy", "peculiar", "luminous", "dizzy",
        "twisted", "bubbly", "slippery", "crooked", "jumbled", "frazzled"
    };
    
    std::vector<std::string> nouns = {
        "penguin", "toaster", "umbrella", "banana", "telescope", "accordion",
        "spatula", "moonbeam", "pickle", "flamingo", "waffle", "bicycle",
        "teapot", "mushroom", "harmonica", "walrus", "pretzel", "chandelier"
    };
    
    std::vector<std::string> verbs = {
        "dances", "wiggles", "somersaults", "yodels", "hiccups", "juggles",
        "sneezes", "bounces", "twirls", "prances", "waddles", "zigzags",
        "tumbles", "flutters", "wobbles", "giggles", "shuffles", "leaps"
    };
    
    std::vector<std::string> adverbs = {
        "backwards", "sideways", "slowly", "frantically", "mysteriously", "gleefully",
        "awkwardly", "gracefully", "clumsily", "eagerly", "suddenly", "softly",
        "wildly", "gently", "rapidly", "lazily", "merrily", "oddly"
    };
    
    std::vector<std::string> prepositions = {
        "under", "over", "through", "around", "beneath", "beside",
        "above", "below", "between", "among", "beyond", "inside"
    };
    
    std::vector<std::string> places = {
        "the garden", "a cloud", "the meadow", "the ocean", "a rainbow",
        "the attic", "a dream", "the forest", "the stars", "a puddle",
        "the moon", "a teacup", "the shadows", "the wind", "a bubble"
    };
    
    std::mt19937 rng;
    
    template<typename T>
    const T& pick(const std::vector<T>& vec) {
        std::uniform_int_distribution<size_t> dist(0, vec.size() - 1);
        return vec[dist(rng)];
    }
    
    std::string capitalize(std::string str) {
        if (!str.empty()) {
            str[0] = std::toupper(str[0]);
        }
        return str;
    }
    
    std::string generateTemplate1() {
        std::string result;
        auto adj1 = pick(adjectives);
        auto noun1 = pick(nouns);
        auto verb1 = pick(verbs);
        auto adv1 = pick(adverbs);
        auto adj2 = pick(adjectives);
        auto noun2 = pick(nouns);
        auto prep1 = pick(prepositions);
        auto place1 = pick(places);
        
        result = "The " + adj1 + " " + noun1 + " " + verb1 + " " + adv1 + ",\n";
        result += "While " + adj2 + " " + noun2 + "s rest " + prep1 + " " + place1 + ".\n";
        result += "With " + pick(adjectives) + " delight and " + pick(adjectives) + " glee,\n";
        result += "They " + pick(verbs) + " together wild and free!";
        
        return result;
    }
    
    std::string generateTemplate2() {
        return pick(adjectives) + " " + pick(nouns) + "\n" +
               pick(verbs) + " " + pick(adverbs) + " " + pick(prepositions) + " " + pick(places) + "\n" +
               pick(adjectives) + " " + pick(nouns) + " " + pick(verbs);
    }
    
    std::string generateTemplate3() {
        auto noun1 = pick(nouns);
        auto noun2 = pick(nouns);
        auto noun3 = pick(nouns);
        
        std::string result;
        result = "Once a " + pick(adjectives) + " " + noun1 + " met a " + pick(adjectives) + " " + noun2 + ",\n";
        result += "They " + pick(verbs) + " " + pick(adverbs) + " " + pick(prepositions) + " " + pick(places) + ".\n";
        result += "\"" + capitalize(pick(adjectives)) + " " + pick(nouns) + "!\" the " + noun1 + " cried,\n";
        result += "As a " + pick(adjectives) + " " + noun3 + " " + pick(verbs) + " by its side.";
        
        return result;
    }
    
    std::string generateTemplate4() {
        auto verb = pick(verbs);
        auto noun = pick(nouns);
        auto adj = pick(adjectives);
        auto adv = pick(adverbs);
        
        std::string result;
        result = "The " + noun + " " + verb + ",\n";
        result += adv + " it " + verb + ",\n";
        result += adj + " and " + pick(adjectives) + " it " + verb + ",\n";
        result += "Oh, how that " + noun + " " + verb + "!";
        
        return result;
    }
    
    std::string generateTemplate5() {
        auto noun1 = pick(nouns);
        auto noun2 = pick(nouns);
        
        std::string result;
        result = "What happens when a " + pick(adjectives) + " " + noun1 + "\n";
        result += "Meets a " + pick(adjectives) + " " + noun2 + " " + pick(prepositions) + " " + pick(places) + "?\n";
        result += "They " + pick(verbs) + " and " + pick(verbs) + " " + pick(adverbs) + ",\n";
        result += "Creating " + pick(adjectives) + " surprises!";
        
        return result;
    }
    
    std::string generateTemplate6() {
        std::string result = "I saw:\n";
        result += "A " + pick(adjectives) + " " + pick(nouns) + " that " + pick(verbs) + " " + pick(adverbs) + ",\n";
        result += "A " + pick(adjectives) + " " + pick(nouns) + " " + pick(prepositions) + " " + pick(places) + ",\n";
        result += "And a " + pick(adjectives) + " " + pick(nouns) + " doing " + pick(adjectives) + " things,\n";
        result += "All while the " + pick(adjectives) + " " + pick(nouns) + " " + pick(verbs) + "!";
        
        return result;
    }

public:
    PoemGenerator() : rng(std::random_device{}()) {}
    
    std::string generatePoem() {
        std::vector<std::function<std::string()>> templates = {
            [this]() { return generateTemplate1(); },
            [this]() { return generateTemplate2(); },
            [this]() { return generateTemplate3(); },
            [this]() { return generateTemplate4(); },
            [this]() { return generateTemplate5(); },
            [this]() { return generateTemplate6(); }
        };
        
        return pick(templates)();
    }
    
    void generatePoems(int count) {
        std::cout << std::string(60, '=') << "\n";
        std::cout << "  🎭 NONSENSE POEM GENERATOR (C++) 🎭\n";
        std::cout << std::string(60, '=') << "\n\n";
        
        for (int i = 1; i <= count; i++) {
            std::cout << "Poem #" << i << ":\n";
            std::cout << std::string(60, '-') << "\n";
            std::cout << generatePoem() << "\n\n";
            
            if (i < count) {
                std::cout << "\n";
            }
        }
        
        std::cout << std::string(60, '=') << "\n";
    }
};

int main(int argc, char* argv[]) {
    int count = 3;
    
    if (argc > 1) {
        count = std::atoi(argv[1]);
        if (count < 1) {
            std::cerr << "Usage: " << argv[0] << " [number_of_poems]\n";
            std::cerr << "Example: " << argv[0] << " 5\n";
            return 1;
        }
    }
    
    PoemGenerator generator;
    generator.generatePoems(count);
    
    return 0;
}
