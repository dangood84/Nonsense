program nonsense_poem_generator
    ! Nonsense Poem Generator - Fortran Edition
    implicit none
    
    integer :: count, i, template_num, seed_size, ios
    integer, allocatable :: seed(:)
    character(len=100) :: arg
    real :: r
    
    ! Initialize random number generator
    call random_seed(size=seed_size)
    allocate(seed(seed_size))
    call system_clock(count=seed(1))
    call random_seed(put=seed)
    deallocate(seed)
    
    ! Get number of poems from command line
    count = 3
    if (command_argument_count() > 0) then
        call get_command_argument(1, arg)
        read(arg, *, iostat=ios) count
        if (ios /= 0 .or. count < 1) then
            print *, "Usage: ./nonsense-poem-generator [number_of_poems]"
            print *, "Example: ./nonsense-poem-generator 5"
            stop 1
        end if
    end if
    
    ! Generate poems
    call generate_poems(count)
    
contains

    function pick_adjective() result(word)
        character(len=20) :: word
        character(len=20), dimension(12) :: adjectives
        integer :: idx
        real :: r
        
        adjectives = [character(len=20) :: &
            'purple', 'bouncy', 'invisible', 'squeaky', 'jellied', 'grumpy', &
            'wobbly', 'sparkly', 'fuzzy', 'peculiar', 'luminous', 'dizzy']
        
        call random_number(r)
        idx = int(r * 12) + 1
        word = trim(adjectives(idx))
    end function
    
    function pick_noun() result(word)
        character(len=20) :: word
        character(len=20), dimension(12) :: nouns
        integer :: idx
        real :: r
        
        nouns = [character(len=20) :: &
            'penguin', 'toaster', 'umbrella', 'banana', 'telescope', 'accordion', &
            'spatula', 'moonbeam', 'pickle', 'flamingo', 'waffle', 'bicycle']
        
        call random_number(r)
        idx = int(r * 12) + 1
        word = trim(nouns(idx))
    end function
    
    function pick_verb() result(word)
        character(len=20) :: word
        character(len=20), dimension(12) :: verbs
        integer :: idx
        real :: r
        
        verbs = [character(len=20) :: &
            'dances', 'wiggles', 'somersaults', 'yodels', 'hiccups', 'juggles', &
            'sneezes', 'bounces', 'twirls', 'prances', 'waddles', 'zigzags']
        
        call random_number(r)
        idx = int(r * 12) + 1
        word = trim(verbs(idx))
    end function
    
    function pick_adverb() result(word)
        character(len=20) :: word
        character(len=20), dimension(10) :: adverbs
        integer :: idx
        real :: r
        
        adverbs = [character(len=20) :: &
            'backwards', 'sideways', 'slowly', 'frantically', 'mysteriously', &
            'gleefully', 'awkwardly', 'gracefully', 'clumsily', 'eagerly']
        
        call random_number(r)
        idx = int(r * 10) + 1
        word = trim(adverbs(idx))
    end function
    
    function pick_preposition() result(word)
        character(len=20) :: word
        character(len=20), dimension(10) :: prepositions
        integer :: idx
        real :: r
        
        prepositions = [character(len=20) :: &
            'under', 'over', 'through', 'around', 'beneath', &
            'beside', 'above', 'below', 'between', 'among']
        
        call random_number(r)
        idx = int(r * 10) + 1
        word = trim(prepositions(idx))
    end function
    
    function pick_place() result(word)
        character(len=20) :: word
        character(len=20), dimension(10) :: places
        integer :: idx
        real :: r
        
        places = [character(len=20) :: &
            'the garden', 'a cloud', 'the meadow', 'the ocean', 'a rainbow', &
            'the attic', 'a dream', 'the forest', 'the stars', 'a puddle']
        
        call random_number(r)
        idx = int(r * 10) + 1
        word = trim(places(idx))
    end function
    
    subroutine generate_template1()
        character(len=20) :: adj1, noun1, verb1, adv1, adj2, noun2, prep1, place1
        
        adj1 = pick_adjective()
        noun1 = pick_noun()
        verb1 = pick_verb()
        adv1 = pick_adverb()
        adj2 = pick_adjective()
        noun2 = pick_noun()
        prep1 = pick_preposition()
        place1 = pick_place()
        
        print '(A,A,A,A,A,A,A,A,A)', 'The ', trim(adj1), ' ', trim(noun1), ' ', trim(verb1), ' ', trim(adv1), ','
        print '(A,A,A,A,A,A,A,A)', 'While ', trim(adj2), ' ', trim(noun2), 's rest ', trim(prep1), ' ', trim(place1), '.'
        print '(A,A,A,A,A)', 'With ', trim(pick_adjective()), ' delight and ', trim(pick_adjective()), ' glee,'
        print '(A,A,A)', 'They ', trim(pick_verb()), ' together wild and free!'
    end subroutine
    
    subroutine generate_template2()
        character(len=20) :: verb, noun, adj, adv
        
        verb = pick_verb()
        noun = pick_noun()
        adj = pick_adjective()
        adv = pick_adverb()
        
        print '(A,A,A,A,A)', 'The ', trim(noun), ' ', trim(verb), ','
        print '(A,A,A,A,A)', trim(adv), ' it ', trim(verb), ','
        print '(A,A,A,A,A,A,A)', trim(adj), ' and ', trim(pick_adjective()), ' it ', trim(verb), ','
        print '(A,A,A,A,A)', 'Oh, how that ', trim(noun), ' ', trim(verb), '!'
    end subroutine
    
    subroutine generate_template3()
        print '(A)', 'I saw:'
        print '(A,A,A,A,A,A,A,A,A)', 'A ', trim(pick_adjective()), ' ', trim(pick_noun()), &
              ' that ', trim(pick_verb()), ' ', trim(pick_adverb()), ','
        print '(A,A,A,A,A,A,A,A)', 'A ', trim(pick_adjective()), ' ', trim(pick_noun()), &
              ' ', trim(pick_preposition()), ' ', trim(pick_place()), ','
        print '(A,A,A,A,A,A,A)', 'And a ', trim(pick_adjective()), ' ', trim(pick_noun()), &
              ' doing ', trim(pick_adjective()), ' things,'
        print '(A,A,A,A,A,A,A)', 'All while the ', trim(pick_adjective()), ' ', trim(pick_noun()), &
              ' ', trim(pick_verb()), '!'
    end subroutine
    
    subroutine generate_poem()
        real :: r
        integer :: template_num
        
        call random_number(r)
        template_num = int(r * 3) + 1
        
        select case(template_num)
            case(1)
                call generate_template1()
            case(2)
                call generate_template2()
            case(3)
                call generate_template3()
        end select
    end subroutine
    
    subroutine generate_poems(count)
        integer, intent(in) :: count
        integer :: i
        
        print '(A)', '============================================================'
        print '(A)', '  🎭 NONSENSE POEM GENERATOR (Fortran) 🎭'
        print '(A)', '============================================================'
        print *
        
        do i = 1, count
            print '(A,I0,A)', 'Poem #', i, ':'
            print '(A)', '------------------------------------------------------------'
            call generate_poem()
            print *
            if (i < count) then
                print *
            end if
        end do
        
        print '(A)', '============================================================'
    end subroutine

end program nonsense_poem_generator
