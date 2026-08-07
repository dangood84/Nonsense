import java.util.Random;

/**
 * Nonsense Poem Generator - Java Edition
 * Generates random nonsensical poems using word banks and templates
 */
public class NonsensePoemGenerator {
    
    private static final String[] ADJECTIVES = {
        "purple", "bouncy", "invisible", "squeaky", "jellied", "grumpy",
        "wobbly", "sparkly", "fuzzy", "peculiar", "luminous", "dizzy",
        "twisted", "bubbly", "slippery", "crooked", "jumbled", "frazzled"
    };
    
    private static final String[] NOUNS = {
        "penguin", "toaster", "umbrella", "banana", "telescope", "accordion",
        "spatula", "moonbeam", "pickle", "flamingo", "waffle", "bicycle",
        "teapot", "mushroom", "harmonica", "walrus", "pretzel", "chandelier"
    };
    
    private static final String[] VERBS = {
        "dances", "wiggles", "somersaults", "yodels", "hiccups", "juggles",
        "sneezes", "bounces", "twirls", "prances", "waddles", "zigzags",
        "tumbles", "flutters", "wobbles", "giggles", "shuffles", "leaps"
    };
    
    private static final String[] ADVERBS = {
        "backwards", "sideways", "slowly", "frantically", "mysteriously", "gleefully",
        "awkwardly", "gracefully", "clumsily", "eagerly", "suddenly", "softly",
        "wildly", "gently", "rapidly", "lazily", "merrily", "oddly"
    };
    
    private static final String[] PREPOSITIONS = {
        "under", "over", "through", "around", "beneath", "beside",
        "above", "below", "between", "among", "beyond", "inside"
    };
    
    private static final String[] PLACES = {
        "the garden", "a cloud", "the meadow", "the ocean", "a rainbow",
        "the attic", "a dream", "the forest", "the stars", "a puddle",
        "the moon", "a teacup", "the shadows", "the wind", "a bubble"
    };
    
    private final Random random;
    
    public NonsensePoemGenerator() {
        this.random = new Random();
    }
    
    private String pick(String[] array) {
        return array[random.nextInt(array.length)];
    }
    
    private String capitalize(String str) {
        if (str == null || str.isEmpty()) {
            return str;
        }
        return Character.toUpperCase(str.charAt(0)) + str.substring(1);
    }
    
    private String generateTemplate1() {
        String adj1 = pick(ADJECTIVES);
        String noun1 = pick(NOUNS);
        String verb1 = pick(VERBS);
        String adv1 = pick(ADVERBS);
        String adj2 = pick(ADJECTIVES);
        String noun2 = pick(NOUNS);
        String prep1 = pick(PREPOSITIONS);
        String place1 = pick(PLACES);
        
        return String.format("The %s %s %s %s,\n" +
                           "While %s %ss rest %s %s.\n" +
                           "With %s delight and %s glee,\n" +
                           "They %s together wild and free!",
                           adj1, noun1, verb1, adv1,
                           adj2, noun2, prep1, place1,
                           pick(ADJECTIVES), pick(ADJECTIVES),
                           pick(VERBS));
    }
    
    private String generateTemplate2() {
        return String.format("%s %s\n%s %s %s %s\n%s %s %s",
                           pick(ADJECTIVES), pick(NOUNS),
                           pick(VERBS), pick(ADVERBS), pick(PREPOSITIONS), pick(PLACES),
                           pick(ADJECTIVES), pick(NOUNS), pick(VERBS));
    }
    
    private String generateTemplate3() {
        String noun1 = pick(NOUNS);
        String noun2 = pick(NOUNS);
        String noun3 = pick(NOUNS);
        
        return String.format("Once a %s %s met a %s %s,\n" +
                           "They %s %s %s %s.\n" +
                           "\"%s %s!\" the %s cried,\n" +
                           "As a %s %s %s by its side.",
                           pick(ADJECTIVES), noun1, pick(ADJECTIVES), noun2,
                           pick(VERBS), pick(ADVERBS), pick(PREPOSITIONS), pick(PLACES),
                           capitalize(pick(ADJECTIVES)), pick(NOUNS), noun1,
                           pick(ADJECTIVES), noun3, pick(VERBS));
    }
    
    private String generateTemplate4() {
        String verb = pick(VERBS);
        String noun = pick(NOUNS);
        String adj = pick(ADJECTIVES);
        String adv = pick(ADVERBS);
        
        return String.format("The %s %s,\n%s it %s,\n%s and %s it %s,\n" +
                           "Oh, how that %s %s!",
                           noun, verb, adv, verb, adj, pick(ADJECTIVES), verb,
                           noun, verb);
    }
    
    private String generateTemplate5() {
        String noun1 = pick(NOUNS);
        String noun2 = pick(NOUNS);
        
        return String.format("What happens when a %s %s\n" +
                           "Meets a %s %s %s %s?\n" +
                           "They %s and %s %s,\n" +
                           "Creating %s surprises!",
                           pick(ADJECTIVES), noun1,
                           pick(ADJECTIVES), noun2, pick(PREPOSITIONS), pick(PLACES),
                           pick(VERBS), pick(VERBS), pick(ADVERBS),
                           pick(ADJECTIVES));
    }
    
    private String generateTemplate6() {
        return String.format("I saw:\n" +
                           "A %s %s that %s %s,\n" +
                           "A %s %s %s %s,\n" +
                           "And a %s %s doing %s things,\n" +
                           "All while the %s %s %s!",
                           pick(ADJECTIVES), pick(NOUNS), pick(VERBS), pick(ADVERBS),
                           pick(ADJECTIVES), pick(NOUNS), pick(PREPOSITIONS), pick(PLACES),
                           pick(ADJECTIVES), pick(NOUNS), pick(ADJECTIVES),
                           pick(ADJECTIVES), pick(NOUNS), pick(VERBS));
    }
    
    public String generatePoem() {
        int template = random.nextInt(6);
        switch (template) {
            case 0: return generateTemplate1();
            case 1: return generateTemplate2();
            case 2: return generateTemplate3();
            case 3: return generateTemplate4();
            case 4: return generateTemplate5();
            case 5: return generateTemplate6();
            default: return generateTemplate1();
        }
    }
    
    public void generatePoems(int count) {
        System.out.println("=".repeat(60));
        System.out.println("  🎭 NONSENSE POEM GENERATOR (Java) 🎭");
        System.out.println("=".repeat(60));
        System.out.println();
        
        for (int i = 1; i <= count; i++) {
            System.out.println("Poem #" + i + ":");
            System.out.println("-".repeat(60));
            System.out.println(generatePoem());
            System.out.println();
            
            if (i < count) {
                System.out.println();
            }
        }
        
        System.out.println("=".repeat(60));
    }
    
    public static void main(String[] args) {
        int count = 3;
        
        if (args.length > 0) {
            try {
                count = Integer.parseInt(args[0]);
                if (count < 1) {
                    throw new IllegalArgumentException();
                }
            } catch (Exception e) {
                System.err.println("Usage: java NonsensePoemGenerator [number_of_poems]");
                System.err.println("Example: java NonsensePoemGenerator 5");
                System.exit(1);
            }
        }
        
        NonsensePoemGenerator generator = new NonsensePoemGenerator();
        generator.generatePoems(count);
    }
}
