:- dynamic(user_query/1).

% Консультація бази знань
:- consult('knowledge.pl').

% Запитувати про інформацію
ask_about_university :-
    write('Hi, I am here to tell you about Taras Shevchenko University. What do you want to know about Taras Shevchenko University?'), nl,
    repeat,
    write('What is in your mind: '),
    read(UserInput),
    assert(user_query(UserInput)),
    handle_query(UserInput),
    write('Do you want to ask more? (y/n): '),
    read(Continue),
    (Continue == y -> fail ; true).

% Обробка запиту
handle_query(asked('name of the university')) :-
    query_name(Name),
    format('The name of the university is ~w.~n', [Name]).
handle_query(asked('introduction')) :-
    query_introduction(Intro),
    format('~w~n', [Intro]).
handle_query(asked('history of taras shevchenko university')) :-
    query_history(History),
    format('Brief history: ~w~n', [History]).
handle_query(asked('location of taras shevchenko university')) :-
    query_location(Location),
    format('Location: ~w~n', [Location]).
handle_query(asked('area of taras shevchenko university')) :-
    query_area(Area),
    format('Total area of Taras Shevchenko University is about ~w.~n', [Area]).
handle_query(asked('current vice chancellor')) :-
    query_vice_chancellor(VC),
    format('The current vice chancellor of Taras Shevchenko University is ~w.~n', [VC]).
handle_query(asked('number of faculties')) :-
    query_number_of_faculties(Num),
    format('Total faculties: ~w~n', [Num]).
handle_query(asked('number of departments')) :-
    query_number_of_departments(Num),
    format('Total departments: ~w~n', [Num]).
handle_query(asked('number of institutes')) :-
    query_number_of_institutes(Num),
    format('Total institutes: ~w~n', [Num]).
handle_query(asked('faculties of taras shevchenko university')) :-
    query_faculties(Facs),
    format('Faculties are: ~w~n', [Facs]).
handle_query(asked('departments of taras shevchenko university')) :-
    query_departments(Depts),
    format('Departments are: ~w~n', [Depts]).
handle_query(asked('about department of computer science')) :-
    query_about_cse(AboutCSE),
    format('About Department of Computer Science: ~w~n', [AboutCSE]).
handle_query(asked('chairman of computer science')) :-
    query_chairman_of_cse(Chairman),
    format('Chairman of Department of Computer Science: ~w~n', [Chairman]).
handle_query(asked('who developed')) :-
    query_developers(Devs),
    format('Developers: ~w~n', [Devs]).
handle_query(_) :-
    write('Sorry, I cannot understand your question.'), nl.

% Виконати запит
query_name(Name) :- name(Name).
query_introduction(Intro) :- introduction('taras_shevchenko_uni', Intro).
query_history(History) :- history('taras_shevchenko_uni', History).
query_location(Location) :- location('taras_shevchenko_uni', Location).
query_area(Area) :- area('taras_shevchenko_uni', Area).
query_vice_chancellor(VC) :- vice_chancellor('taras_shevchenko_uni', VC).
query_number_of_faculties(Num) :- number_of_faculties('taras_shevchenko_uni', Num).
query_number_of_departments(Num) :- number_of_departments('taras_shevchenko_uni', Num).
query_number_of_institutes(Num) :- number_of_institutes('taras_shevchenko_uni', Num).
query_faculties(Facs) :- faculties('taras_shevchenko_uni', Facs).
query_departments(Depts) :- departments('taras_shevchenko_uni', Depts).
query_about_cse(About) :- about_department_of_computer_science_and_engineering('taras_shevchenko_uni', About).
query_chairman_of_cse(Chairman) :- chairman_of_cse('Department of Computer Science', Chairman).
query_developers(Devs) :- developers(Devs).

% Запустити запит
:- initialization(ask_about_university).
