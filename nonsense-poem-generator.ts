#!/usr/bin/env ts-node

/**
 * Nonsense Poem Generator
 * Generates random nonsensical poems using word banks and templates
 */

// Word banks for random selection
const adjectives = [
    'purple', 'bouncy', 'invisible', 'squeaky', 'jellied', 'grumpy',
    'wobbly', 'sparkly', 'fuzzy', 'peculiar', 'luminous', 'dizzy',
    'twisted', 'bubbly', 'slippery', 'crooked', 'jumbled', 'frazzled'
];

const nouns = [
    'penguin', 'toaster', 'umbrella', 'banana', 'telescope', 'accordion',
    'spatula', 'moonbeam', 'pickle', 'flamingo', 'waffle', 'bicycle',
    'teapot', 'mushroom', 'harmonica', 'walrus', 'pretzel', 'chandelier'
];

const verbs = [
    'dances', 'wiggles', 'somersaults', 'yodels', 'hiccups', 'juggles',
    'sneezes', 'bounces', 'twirls', 'prances', 'waddles', 'zigzags',
    'tumbles', 'flutters', 'wobbles', 'giggles', 'shuffles', 'leaps'
];

const adverbs = [
    'backwards', 'sideways', 'slowly', 'frantically', 'mysteriously', 'gleefully',
    'awkwardly', 'gracefully', 'clumsily', 'eagerly', 'suddenly', 'softly',
    'wildly', 'gently', 'rapidly', 'lazily', 'merrily', 'oddly'
];

const prepositions = [
    'under', 'over', 'through', 'around', 'beneath', 'beside',
    'above', 'below', 'between', 'among', 'beyond', 'inside'
];

const places = [
    'the garden', 'a cloud', 'the meadow', 'the ocean', 'a rainbow',
    'the attic', 'a dream', 'the forest', 'the stars', 'a puddle',
    'the moon', 'a teacup', 'the shadows', 'the wind', 'a bubble'
];

// Helper function to pick a random item from an array
function pick<T>(array: T[]): T {
    return array[Math.floor(Math.random() * array.length)];
}

// Poem templates
const poemTemplates = [
    // Template 1: Four-line AABB rhyme-ish structure
    () => {
        const adj1 = pick(adjectives);
        const noun1 = pick(nouns);
        const verb1 = pick(verbs);
        const adv1 = pick(adverbs);
        
        const adj2 = pick(adjectives);
        const noun2 = pick(nouns);
        const prep1 = pick(prepositions);
        const place1 = pick(places);
        
        return `The ${adj1} ${noun1} ${verb1} ${adv1},
While ${adj2} ${noun2}s rest ${prep1} ${place1}.
With ${pick(adjectives)} delight and ${pick(adjectives)} glee,
They ${pick(verbs)} together wild and free!`;
    },
    
    // Template 2: Haiku-style (5-7-5 syllables approximation)
    () => {
        return `${pick(adjectives)} ${pick(nouns)}
${pick(verbs)} ${pick(adverbs)} ${pick(prepositions)} ${pick(places)}
${pick(adjectives)} ${pick(nouns)} ${pick(verbs)}`;
    },
    
    // Template 3: Nonsense narrative
    () => {
        const noun1 = pick(nouns);
        const noun2 = pick(nouns);
        const noun3 = pick(nouns);
        
        return `Once a ${pick(adjectives)} ${noun1} met a ${pick(adjectives)} ${noun2},
They ${pick(verbs)} ${pick(adverbs)} ${pick(prepositions)} ${pick(places)}.
"${pick(adjectives).charAt(0).toUpperCase() + pick(adjectives).slice(1)} ${pick(nouns)}!" the ${noun1} cried,
As a ${pick(adjectives)} ${noun3} ${pick(verbs)} by its side.`;
    },
    
    // Template 4: Repetitive structure
    () => {
        const verb = pick(verbs);
        const adv = pick(adverbs);
        const adj = pick(adjectives);
        const noun = pick(nouns);
        
        return `The ${noun} ${verb},
${adv} it ${verb},
${adj} and ${pick(adjectives)} it ${verb},
Oh, how that ${noun} ${verb}!`;
    },
    
    // Template 5: Question and answer
    () => {
        const noun1 = pick(nouns);
        const noun2 = pick(nouns);
        
        return `What happens when a ${pick(adjectives)} ${noun1}
Meets a ${pick(adjectives)} ${noun2} ${pick(prepositions)} ${pick(places)}?
They ${pick(verbs)} and ${pick(verbs)} ${pick(adverbs)},
Creating ${pick(adjectives)} surprises!`;
    },
    
    // Template 6: List poem
    () => {
        return `I saw:
A ${pick(adjectives)} ${pick(nouns)} that ${pick(verbs)} ${pick(adverbs)},
A ${pick(adjectives)} ${pick(nouns)} ${pick(prepositions)} ${pick(places)},
And a ${pick(adjectives)} ${pick(nouns)} doing ${pick(adjectives)} things,
All while the ${pick(adjectives)} ${pick(nouns)} ${pick(verbs)}!`;
    }
];

// Generate a single poem
function generatePoem(): string {
    const template = pick(poemTemplates);
    return template();
}

// Generate multiple poems
function generatePoems(count: number): void {
    console.log('='.repeat(60));
    console.log('  🎭 NONSENSE POEM GENERATOR 🎭');
    console.log('='.repeat(60));
    console.log();
    
    for (let i = 1; i <= count; i++) {
        console.log(`Poem #${i}:`);
        console.log('-'.repeat(60));
        console.log(generatePoem());
        console.log();
        
        if (i < count) {
            console.log();
        }
    }
    
    console.log('='.repeat(60));
}

// Main execution
if (require.main === module) {
    const args = process.argv.slice(2);
    const count = args.length > 0 ? parseInt(args[0], 10) : 3;
    
    if (isNaN(count) || count < 1) {
        console.error('Usage: ts-node nonsense-poem-generator.ts [number_of_poems]');
        console.error('Example: ts-node nonsense-poem-generator.ts 5');
        process.exit(1);
    }
    
    generatePoems(count);
}

// Export for use as a module
export { generatePoem, generatePoems };
