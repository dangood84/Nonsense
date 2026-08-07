program NonsensePoemGenerator;
{$mode objfpc}{$H+}

uses
  SysUtils, DateUtils;

type
  TWordArray = array of string;

const
  ADJECTIVES: array[0..11] of string = (
    'purple', 'bouncy', 'invisible', 'squeaky', 'jellied', 'grumpy',
    'wobbly', 'sparkly', 'fuzzy', 'peculiar', 'luminous', 'dizzy'
  );
  
  NOUNS: array[0..11] of string = (
    'penguin', 'toaster', 'umbrella', 'banana', 'telescope', 'accordion',
    'spatula', 'moonbeam', 'pickle', 'flamingo', 'waffle', 'bicycle'
  );
  
  VERBS: array[0..11] of string = (
    'dances', 'wiggles', 'somersaults', 'yodels', 'hiccups', 'juggles',
    'sneezes', 'bounces', 'twirls', 'prances', 'waddles', 'zigzags'
  );
  
  ADVERBS: array[0..9] of string = (
    'backwards', 'sideways', 'slowly', 'frantically', 'mysteriously',
    'gleefully', 'awkwardly', 'gracefully', 'clumsily', 'eagerly'
  );
  
  PREPOSITIONS: array[0..9] of string = (
    'under', 'over', 'through', 'around', 'beneath',
    'beside', 'above', 'below', 'between', 'among'
  );
  
  PLACES: array[0..9] of string = (
    'the garden', 'a cloud', 'the meadow', 'the ocean', 'a rainbow',
    'the attic', 'a dream', 'the forest', 'the stars', 'a puddle'
  );

function PickAdjective: string;
begin
  Result := ADJECTIVES[Random(Length(ADJECTIVES))];
end;

function PickNoun: string;
begin
  Result := NOUNS[Random(Length(NOUNS))];
end;

function PickVerb: string;
begin
  Result := VERBS[Random(Length(VERBS))];
end;

function PickAdverb: string;
begin
  Result := ADVERBS[Random(Length(ADVERBS))];
end;

function PickPreposition: string;
begin
  Result := PREPOSITIONS[Random(Length(PREPOSITIONS))];
end;

function PickPlace: string;
begin
  Result := PLACES[Random(Length(PLACES))];
end;

function Capitalize(const S: string): string;
begin
  if Length(S) > 0 then
    Result := UpCase(S[1]) + Copy(S, 2, Length(S) - 1)
  else
    Result := S;
end;

procedure GenerateTemplate1;
var
  adj1, noun1, verb1, adv1: string;
  adj2, noun2, prep1, place1: string;
begin
  adj1 := PickAdjective;
  noun1 := PickNoun;
  verb1 := PickVerb;
  adv1 := PickAdverb;
  adj2 := PickAdjective;
  noun2 := PickNoun;
  prep1 := PickPreposition;
  place1 := PickPlace;
  
  WriteLn('The ', adj1, ' ', noun1, ' ', verb1, ' ', adv1, ',');
  WriteLn('While ', adj2, ' ', noun2, 's rest ', prep1, ' ', place1, '.');
  WriteLn('With ', PickAdjective, ' delight and ', PickAdjective, ' glee,');
  WriteLn('They ', PickVerb, ' together wild and free!');
end;

procedure GenerateTemplate2;
var
  verb, noun, adj, adv: string;
begin
  verb := PickVerb;
  noun := PickNoun;
  adj := PickAdjective;
  adv := PickAdverb;
  
  WriteLn('The ', noun, ' ', verb, ',');
  WriteLn(adv, ' it ', verb, ',');
  WriteLn(adj, ' and ', PickAdjective, ' it ', verb, ',');
  WriteLn('Oh, how that ', noun, ' ', verb, '!');
end;

procedure GenerateTemplate3;
begin
  WriteLn('I saw:');
  WriteLn('A ', PickAdjective, ' ', PickNoun, ' that ', PickVerb, ' ', PickAdverb, ',');
  WriteLn('A ', PickAdjective, ' ', PickNoun, ' ', PickPreposition, ' ', PickPlace, ',');
  WriteLn('And a ', PickAdjective, ' ', PickNoun, ' doing ', PickAdjective, ' things,');
  WriteLn('All while the ', PickAdjective, ' ', PickNoun, ' ', PickVerb, '!');
end;

procedure GeneratePoem;
var
  template: Integer;
begin
  template := Random(3);
  case template of
    0: GenerateTemplate1;
    1: GenerateTemplate2;
    2: GenerateTemplate3;
  end;
end;

procedure GeneratePoems(count: Integer);
var
  i: Integer;
begin
  WriteLn(StringOfChar('=', 60));
  WriteLn('  🎭 NONSENSE POEM GENERATOR (Pascal) 🎭');
  WriteLn(StringOfChar('=', 60));
  WriteLn;
  
  for i := 1 to count do
  begin
    WriteLn('Poem #', i, ':');
    WriteLn(StringOfChar('-', 60));
    GeneratePoem;
    WriteLn;
    if i < count then
      WriteLn;
  end;
  
  WriteLn(StringOfChar('=', 60));
end;

var
  count: Integer;
  errorCode: Integer;
begin
  Randomize;
  
  count := 3;
  if ParamCount > 0 then
  begin
    Val(ParamStr(1), count, errorCode);
    if (errorCode <> 0) or (count < 1) then
    begin
      WriteLn(StdErr, 'Usage: ', ParamStr(0), ' [number_of_poems]');
      WriteLn(StdErr, 'Example: ', ParamStr(0), ' 5');
      Halt(1);
    end;
  end;
  
  GeneratePoems(count);
end.
