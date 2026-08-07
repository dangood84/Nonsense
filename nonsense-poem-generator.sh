#!/bin/bash

# Nonsense Poem Generator - Bash Edition
# Generates random nonsense poems

# Word banks
adjectives=("purple" "bouncy" "invisible" "squeaky" "jellied" "grumpy" "wobbly" "sparkly" "fuzzy" "peculiar" "luminous" "dizzy")
nouns=("penguin" "toaster" "umbrella" "banana" "telescope" "accordion" "spatula" "moonbeam" "pickle" "flamingo" "waffle" "bicycle")
verbs=("dances" "wiggles" "somersaults" "yodels" "hiccups" "juggles" "sneezes" "bounces" "twirls" "prances" "waddles" "zigzags")
adverbs=("backwards" "sideways" "slowly" "frantically" "mysteriously" "gleefully" "awkwardly" "gracefully" "clumsily" "eagerly")
prepositions=("under" "over" "through" "around" "beneath" "beside" "above" "below" "between" "among")
places=("the garden" "a cloud" "the meadow" "the ocean" "a rainbow" "the attic" "a dream" "the forest" "the stars" "a puddle")

# Function to pick random element from array
pick() {
    local array_name=$1[@]
    local array=("${!array_name}")
    echo "${array[$RANDOM % ${#array[@]}]}"
}

# Poem template functions
generate_template1() {
    local adj1=$(pick adjectives)
    local noun1=$(pick nouns)
    local verb1=$(pick verbs)
    local adv1=$(pick adverbs)
    local adj2=$(pick adjectives)
    local noun2=$(pick nouns)
    local prep1=$(pick prepositions)
    local place1=$(pick places)
    
    echo "The $adj1 $noun1 $verb1 $adv1,"
    echo "While $adj2 ${noun2}s rest $prep1 $place1."
    echo "With $(pick adjectives) delight and $(pick adjectives) glee,"
    echo "They $(pick verbs) together wild and free!"
}

generate_template2() {
    local noun1=$(pick nouns)
    local noun2=$(pick nouns)
    local noun3=$(pick nouns)
    
    echo "Once a $(pick adjectives) $noun1 met a $(pick adjectives) $noun2,"
    echo "They $(pick verbs) $(pick adverbs) $(pick prepositions) $(pick places)."
    echo "\"$(pick adjectives | awk '{print toupper(substr($0,1,1)) substr($0,2)}') $(pick nouns)!\" the $noun1 cried,"
    echo "As a $(pick adjectives) $noun3 $(pick verbs) by its side."
}

generate_template3() {
    local verb=$(pick verbs)
    local adv=$(pick adverbs)
    local adj=$(pick adjectives)
    local noun=$(pick nouns)
    
    echo "The $noun $verb,"
    echo "$adv it $verb,"
    echo "$adj and $(pick adjectives) it $verb,"
    echo "Oh, how that $noun $verb!"
}

generate_template4() {
    echo "I saw:"
    echo "A $(pick adjectives) $(pick nouns) that $(pick verbs) $(pick adverbs),"
    echo "A $(pick adjectives) $(pick nouns) $(pick prepositions) $(pick places),"
    echo "And a $(pick adjectives) $(pick nouns) doing $(pick adjectives) things,"
    echo "All while the $(pick adjectives) $(pick nouns) $(pick verbs)!"
}

# Generate a single poem
generate_poem() {
    local template=$((RANDOM % 4 + 1))
    case $template in
        1) generate_template1 ;;
        2) generate_template2 ;;
        3) generate_template3 ;;
        4) generate_template4 ;;
    esac
}

# Main function
main() {
    local count=${1:-3}
    
    echo "============================================================"
    echo "  🎭 NONSENSE POEM GENERATOR (Bash Edition) 🎭"
    echo "============================================================"
    echo
    
    for ((i=1; i<=count; i++)); do
        echo "Poem #$i:"
        echo "------------------------------------------------------------"
        generate_poem
        echo
        
        if [ $i -lt $count ]; then
            echo
        fi
    done
    
    echo "============================================================"
}

# Run if executed directly
if [ "${BASH_SOURCE[0]}" -ef "$0" ]; then
    main "$@"
fi
