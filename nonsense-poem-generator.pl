% Nonsense Poem Generator - Prolog Edition
% To run: swipl -g main -t halt nonsense-poem-generator.pl [count]

:- initialization(main, main).

% Word banks
adjective('purple').
adjective('bouncy').
adjective('invisible').
adjective('squeaky').
adjective('jellied').
adjective('grumpy').
adjective('wobbly').
adjective('sparkly').
adjective('fuzzy').
adjective('peculiar').
adjective('luminous').
adjective('dizzy').

noun('penguin').
noun('toaster').
noun('umbrella').
noun('banana').
noun('telescope').
noun('accordion').
noun('spatula').
noun('moonbeam').
noun('pickle').
noun('flamingo').
noun('waffle').
noun('bicycle').

verb('dances').
verb('wiggles').
verb('somersaults').
verb('yodels').
verb('hiccups').
verb('juggles').
verb('sneezes').
verb('bounces').
verb('twirls').
verb('prances').
verb('waddles').
verb('zigzags').

adverb('backwards').
adverb('sideways').
adverb('slowly').
adverb('frantically').
adverb('mysteriously').
adverb('gleefully').
adverb('awkwardly').
adverb('gracefully').
adverb('clumsily').
adverb('eagerly').

preposition('under').
preposition('over').
preposition('through').
preposition('around').
preposition('beneath').
preposition('beside').
preposition('above').
preposition('below').
preposition('between').
preposition('among').

place('the garden').
place('a cloud').
place('the meadow').
place('the ocean').
place('a rainbow').
place('the attic').
place('a dream').
place('the forest').
place('the stars').
place('a puddle').

% Pick random element from a category
pick_random(Category, Word) :-
    findall(W, call(Category, W), Words),
    length(Words, Len),
    Len > 0,
    random_between(1, Len, Index),
    nth1(Index, Words, Word).

% Capitalize first letter
capitalize_first(Word, Capitalized) :-
    atom_chars(Word, [First|Rest]),
    upcase_atom(First, Upper),
    atom_chars(Capitalized, [Upper|Rest]).

% Poem templates
generate_template1 :-
    pick_random(adjective, Adj1),
    pick_random(noun, Noun1),
    pick_random(verb, Verb1),
    pick_random(adverb, Adv1),
    pick_random(adjective, Adj2),
    pick_random(noun, Noun2),
    pick_random(preposition, Prep1),
    pick_random(place, Place1),
    pick_random(adjective, Adj3),
    pick_random(adjective, Adj4),
    pick_random(verb, Verb2),
    format('The ~w ~w ~w ~w,~n', [Adj1, Noun1, Verb1, Adv1]),
    format('While ~w ~ws rest ~w ~w.~n', [Adj2, Noun2, Prep1, Place1]),
    format('With ~w delight and ~w glee,~n', [Adj3, Adj4]),
    format('They ~w together wild and free!~n', [Verb2]).

generate_template2 :-
    pick_random(verb, Verb),
    pick_random(noun, Noun),
    pick_random(adjective, Adj1),
    pick_random(adjective, Adj2),
    pick_random(adverb, Adv),
    format('The ~w ~w,~n', [Noun, Verb]),
    format('~w it ~w,~n', [Adv, Verb]),
    format('~w and ~w it ~w,~n', [Adj1, Adj2, Verb]),
    format('Oh, how that ~w ~w!~n', [Noun, Verb]).

generate_template3 :-
    pick_random(adjective, Adj1),
    pick_random(noun, Noun1),
    pick_random(verb, Verb1),
    pick_random(adverb, Adv1),
    pick_random(adjective, Adj2),
    pick_random(noun, Noun2),
    pick_random(preposition, Prep1),
    pick_random(place, Place1),
    pick_random(adjective, Adj3),
    pick_random(noun, Noun3),
    pick_random(verb, Verb2),
    format('I saw:~n', []),
    format('A ~w ~w that ~w ~w,~n', [Adj1, Noun1, Verb1, Adv1]),
    format('A ~w ~w ~w ~w,~n', [Adj2, Noun2, Prep1, Place1]),
    format('And a ~w ~w doing ~w things,~n', [Adj3, Noun3, Adj3]),
    format('All while the ~w ~w ~w!~n', [Adj1, Noun2, Verb2]).

% Generate a single poem
generate_poem :-
    random_between(1, 3, Template),
    (   Template = 1 -> generate_template1
    ;   Template = 2 -> generate_template2
    ;   Template = 3 -> generate_template3
    ).

% Generate multiple poems
generate_poems(0) :- !.
generate_poems(N) :-
    N > 0,
    Count is 4 - N,
    format('Poem #~w:~n', [Count]),
    format('------------------------------------------------------------~n', []),
    generate_poem,
    nl,
    (N > 1 -> nl ; true),
    N1 is N - 1,
    generate_poems(N1).

% Main entry point
main(Argv) :-
    (   Argv = [CountAtom|_],
        atom_number(CountAtom, Count),
        Count > 0
    ->  true
    ;   Count = 3
    ),
    format('============================================================~n', []),
    format('  🎭 NONSENSE POEM GENERATOR (Prolog) 🎭~n', []),
    format('============================================================~n', []),
    nl,
    generate_poems(Count),
    format('============================================================~n', []).

main :-
    current_prolog_flag(argv, Argv),
    main(Argv).
