%1.

%A1
male(antoni).
male(nick).
male(john).
male(george).

female(katerina).
female(sara).
female(helen).
female(maria).

%A2
follows(katerina,sara).
follows(katerina,george).
follows(sara,katerina).
follows(sara,george).
follows(sara,helen).
follows(helen,maria).
follows(maria,helen).
follows(maria,george).
follows(antoni,maria).
follows(antoni,george).
follows(nick,george).
follows(nick,john).
follows(john,george).
follows(john,katerina).
follows(george,john).
follows(george,maria).
follows(george,antoni).

%A3
friends(Friend_one, Friend_two):-
    follows(Friend_one,Friend_two),
    follows(Friend_two,Friend_one).

%A4
male_friends(Specific_person, Male_friend):-
    friends(Specific_person, Male_friend),
    male(Male_friend).

female_friends(Specific_person, Female_friend):-
    friends(Specific_person, Female_friend),
    female(Female_friend).

%A5
same_gender(Person_one, Person_two):-
    male(Person_one),
    male(Person_two).

same_gender(Person_one, Person_two):-
    female(Person_one),
    female(Person_two).
    
same_gender_friends(Friend_one, Friend_two):-
    friends(Friend_one, Friend_two),
    same_gender(Friend_one, Friend_two).

%A6
common_friend(Friend_one, Friend_two, Common_friend):-
    friends(Friend_one, Common_friend),
    friends(Friend_two, Common_friend).
	
recommend_new_friends(Friend_to_recoment , Recoment_to):-
    common_friend(Friend_to_recoment , Recoment_to, _),
    not( friends(Friend_to_recoment , Recoment_to) ), %to make sure they are not already friends
    Friend_to_recoment \= Recoment_to.     %to not recoment the peson we are recomenting to.

%G
%has_birthday(<name>, <day>, <month>, <year>).

has_birthday(sara, 21, 06, 1987).
has_birthday(george, 18, 03, 1975).
has_birthday(john, 27, 05, 1972).
has_birthday(nick, 18, 03, 1982).
has_birthday(antoni, 05, 07, 1989).
has_birthday(katerina, 03, 11, 1975).
has_birthday(helen, 17, 02, 1975).
has_birthday(maria, 05, 07, 1990).

%we assume that if they are born the same year they are the same age
%ignoring that they might have a differense less than a month
same_age(Person_one, Person_two):-              
    has_birthday(Person_one, _, _, Same_year),
    has_birthday(Person_two, _, _, Same_year),
    Person_one \= Person_two.

same_birthday(Person_one, Person_two):-
    has_birthday(Person_one, Same_day, Same_month, Same_year),
    has_birthday(Person_two, Same_day, Same_month, Same_year),
    Person_one \= Person_two.


%2.

is_even(Number):-
    Number mod 2 =:= 0.

is_odd(Number):-
    not( is_even(Number) ).


sum_odd([], 0).                   %base condition if its empty the sum of its odd is 0

sum_odd([Head|Rest], Sum):-
    sum_odd(Rest, Sum_of_odds_in_Rest),  %recursively call the sum_odd/2 without the head
    (is_odd(Head) ->  
    	Sum is Head + Sum_of_odds_in_Rest  %if head is odd add head and result of recursion
    ;   
    	Sum is Sum_of_odds_in_Rest        %else add only the result of the recursion
    ).


%3.

add_at_the_end(X, [], X).    %base case, appenting an element to an empty list results to the element 

%basically adding the elements of the second list (L) one by one
%in the third list (R) untill L is epty end the base case is trigered apenting the X aftrer the L
%in the R
add_at_the_end(X, [Element_to_appent|L_rest], [Element_to_appent|R_rest]) :-  
    add_at_the_end(X, L_rest, R_rest).
    